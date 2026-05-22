/// Estado y carga de formularios dinámicos a partir de activos JSON.
///
/// Responsabilidades:
/// - Cargar siempre [kCommonAssetPath] y fusionar con el módulo indicado
///   (`*_metadata.json`), ordenando por [FormFieldDef.formSection] y `order`.
/// - Cachear el esquema fusionado en memoria por ruta del módulo (reapertura rápida).
/// - Mantener valores por `field_id` y recalcular visibilidad cuando las
///   selecciones activan `show_child` en [FieldOption].
/// - Persistir borrador vía [FormDraftService] (debounce) hasta envío exitoso
///   a backend; entonces [clearPersistedDraft].
import 'dart:async';

import 'package:field_colector/core/database/form_draft_service.dart';
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// [ChangeNotifier] que expone carga, error, campos visibles y valores actuales.
class FormProvider extends ChangeNotifier {
  static const String kCommonAssetPath = 'assets/data/common_data.json';
  static const Duration _saveDebounce = Duration(milliseconds: 300);

  FormProvider({required FormDraftService draftService})
      : _draftService = draftService;

  final FormDraftService _draftService;

  bool _loading = false;
  String? _error;

  String _moduleTitle = '';
  String _moduleFormId = '';
  String? _moduleAssetPath;
  List<FormFieldDef> _fields = const [];

  final Map<String, dynamic> _values = {};
  final Set<String> _visibleFieldIds = {};

  bool _dirty = false;
  bool _skipPersistOnDispose = false;
  Timer? _saveTimer;

  static final Map<String, _CachedMerged> _cache = {};

  bool get isLoading => _loading;
  String? get errorMessage => _error;
  String get moduleTitle => _moduleTitle;
  String get moduleFormId => _moduleFormId;
  String? get moduleAssetPath => _moduleAssetPath;
  List<FormFieldDef> get fields => List.unmodifiable(_fields);
  Map<String, dynamic> get values => Map.unmodifiable(_values);
  bool get isDirty => _dirty;

  /// `true` cuando todos los campos obligatorios visibles tienen valor válido.
  /// Omite `image_capture` (fotos aún sin implementar).
  bool get allVisibleRequiredFieldsFilled {
    for (final field in visibleFieldsOrdered()) {
      if (!field.isRequired) continue;
      if (field.type == 'image_capture') continue;
      if (!_isFieldValueFilled(field)) return false;
    }
    return true;
  }

  bool isFieldVisible(String fieldId) => _visibleFieldIds.contains(fieldId);

  dynamic valueFor(String fieldId) => _values[fieldId];

  /// No persiste al salir ni en debounce (p. ej. borrador descartado por el usuario).
  void markSkipPersistOnDispose() {
    _skipPersistOnDispose = true;
  }

  /// Tras guardar en Firestore u otro backend: borra borrador local.
  Future<void> clearPersistedDraft() async {
    final path = _moduleAssetPath;
    if (path == null) return;
    await _draftService.clearDraft(path);
    _dirty = false;
  }

  /// Fuerza escritura inmediata del borrador (p. ej. antes de cambiar de sección).
  Future<void> saveDraftNow() async {
    _saveTimer?.cancel();
    _saveTimer = null;
    final path = _moduleAssetPath;
    if (path == null) return;
    await _draftService.saveDraft(path, Map<String, dynamic>.from(_values));
    _dirty = false;
  }

  /// Loads common + module; uses in-memory cache keyed by [moduleAssetPath].
  Future<void> loadForm(String moduleAssetPath) async {
    _moduleAssetPath = moduleAssetPath;
    _dirty = false;
    final cached = _cache[moduleAssetPath];
    if (cached != null) {
      _error = null;
      _applyMerged(cached);
      await _restoreDraftIfAny(moduleAssetPath);
      _recomputeVisibility();
      notifyListeners();
      return;
    }

    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final commonStr = await rootBundle.loadString(kCommonAssetPath);
      final moduleStr = await rootBundle.loadString(moduleAssetPath);

      final common = FormSchema.parse(commonStr, formSection: 0);
      final module = FormSchema.parse(moduleStr, formSection: 1);

      final merged = <FormFieldDef>[...common.fields, ...module.fields]
        ..sort((a, b) {
          final s = a.formSection.compareTo(b.formSection);
          if (s != 0) return s;
          return a.order.compareTo(b.order);
        });

      final entry = _CachedMerged(
        moduleFormId: module.formId,
        moduleTitle: module.title,
        fields: merged,
      );
      _cache[moduleAssetPath] = entry;
      _applyMerged(entry);
      await _restoreDraftIfAny(moduleAssetPath);
      _recomputeVisibility();
      _error = null;
    } catch (e, st) {
      _error = e.toString();
      if (kDebugMode) {
        debugPrintStack(stackTrace: st, label: 'FormProvider.loadForm');
      }
      _fields = const [];
      _values.clear();
      _visibleFieldIds.clear();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> _restoreDraftIfAny(String moduleAssetPath) async {
    final draft = await _draftService.loadDraft(moduleAssetPath);
    if (draft == null || draft.isEmpty) return;
    for (final e in draft.entries) {
      final v = e.value;
      if (v is List) {
        _values[e.key] = v.map((x) => x.toString()).toList();
      } else {
        _values[e.key] = v;
      }
    }
  }

  void _applyMerged(_CachedMerged m) {
    _moduleFormId = m.moduleFormId;
    _moduleTitle = m.moduleTitle;
    _fields = m.fields;
    _values.clear();
    for (final f in _fields) {
      if (f.type == 'multi_select') {
        _values[f.fieldId] = <String>[];
      }
    }
  }

  void _scheduleDraftSave() {
    final path = _moduleAssetPath;
    if (path == null) return;
    _saveTimer?.cancel();
    _saveTimer = Timer(_saveDebounce, () async {
      try {
        await _draftService.saveDraft(path, Map<String, dynamic>.from(_values));
        _dirty = false;
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint('FormProvider._scheduleDraftSave: $e');
          debugPrintStack(stackTrace: st);
        }
      }
    });
  }

  void setValue(String fieldId, dynamic value) {
    _values[fieldId] = value;
    _dirty = true;
    _recomputeVisibility();
    notifyListeners();
    _scheduleDraftSave();
  }

  void setMultiSelectValues(String fieldId, List<String> values) {
    _values[fieldId] = List<String>.from(values);
    _dirty = true;
    _recomputeVisibility();
    notifyListeners();
    _scheduleDraftSave();
  }

  void _recomputeVisibility() {
    _visibleFieldIds.clear();
    for (final f in _fields) {
      if (f.isVisibleByDefault) {
        _visibleFieldIds.add(f.fieldId);
      }
    }

    for (final f in _fields) {
      final opts = f.options;
      if (opts == null || opts.isEmpty) continue;

      final dynamic raw = _values[f.fieldId];
      if (raw == null) continue;

      if (f.type == 'multi_select') {
        final list = _asStringList(raw);
        for (final v in list) {
          _applyOptionVisibility(opts, v);
        }
      } else {
        _applyOptionVisibility(opts, raw.toString());
      }
    }
  }

  List<String> _asStringList(dynamic raw) {
    if (raw is List) {
      return raw.map((e) => e.toString()).toList();
    }
    return const [];
  }

  void _applyOptionVisibility(List<FieldOption> opts, String selectedValue) {
    for (final o in opts) {
      if (o.value != selectedValue) continue;
      if (o.action != 'show_child') return;
      final targets = o.targetFields;
      if (targets == null) return;
      for (final id in targets) {
        _visibleFieldIds.add(id);
      }
      return;
    }
  }

  /// Visible fields in display order.
  List<FormFieldDef> visibleFieldsOrdered() {
    return _fields.where((f) => _visibleFieldIds.contains(f.fieldId)).toList();
  }

  bool _isFieldValueFilled(FormFieldDef field) {
    final raw = _values[field.fieldId];

    switch (field.type) {
      case 'multi_select':
        return raw is List && raw.isNotEmpty;
      case 'gps_capture':
        if (raw is! Map) return false;
        final lat = raw['latitude'];
        final lon = raw['longitude'];
        return lat != null && lon != null;
      case 'number_integer':
      case 'number_decimal':
        if (raw == null) return false;
        if (raw is num) return true;
        return double.tryParse(raw.toString()) != null;
      default:
        if (raw == null) return false;
        if (raw is String) return raw.trim().isNotEmpty;
        if (raw is List) return raw.isNotEmpty;
        return true;
    }
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    if (!_skipPersistOnDispose &&
        _dirty &&
        _moduleAssetPath != null) {
      unawaited(
        _draftService.saveDraft(
          _moduleAssetPath!,
          Map<String, dynamic>.from(_values),
        ),
      );
    }
    super.dispose();
  }
}

class _CachedMerged {
  const _CachedMerged({
    required this.moduleFormId,
    required this.moduleTitle,
    required this.fields,
  });

  final String moduleFormId;
  final String moduleTitle;
  final List<FormFieldDef> fields;
}
