/// Estado y carga de formularios dinámicos a partir de activos JSON.
///
/// Responsabilidades:
/// - Cargar siempre [kCommonAssetPath] y fusionar con el módulo indicado
///   (`*_metadata.json`), ordenando por [FormFieldDef.formSection] y `order`.
/// - Cachear el esquema fusionado en memoria por ruta del módulo (reapertura rápida).
/// - Mantener valores por `field_id` y recalcular visibilidad cuando las
///   selecciones activan `show_child` en [FieldOption].
///
/// No persiste envíos; solo estado de sesión de pantalla.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// [ChangeNotifier] que expone carga, error, campos visibles y valores actuales.
class FormProvider extends ChangeNotifier {
  static const String kCommonAssetPath = 'assets/data/common_data.json';

  FormProvider();

  bool _loading = false;
  String? _error;

  String _moduleTitle = '';
  String _moduleFormId = '';
  List<FormFieldDef> _fields = const [];

  final Map<String, dynamic> _values = {};
  final Set<String> _visibleFieldIds = {};

  static final Map<String, _CachedMerged> _cache = {};

  bool get isLoading => _loading;
  String? get errorMessage => _error;
  String get moduleTitle => _moduleTitle;
  String get moduleFormId => _moduleFormId;
  List<FormFieldDef> get fields => List.unmodifiable(_fields);
  Map<String, dynamic> get values => Map.unmodifiable(_values);

  bool isFieldVisible(String fieldId) => _visibleFieldIds.contains(fieldId);

  dynamic valueFor(String fieldId) => _values[fieldId];

  /// Loads common + module; uses in-memory cache keyed by [moduleAssetPath].
  Future<void> loadForm(String moduleAssetPath) async {
    final cached = _cache[moduleAssetPath];
    if (cached != null) {
      _error = null;
      _applyMerged(cached);
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

  void setValue(String fieldId, dynamic value) {
    _values[fieldId] = value;
    _recomputeVisibility();
    notifyListeners();
  }

  void setMultiSelectValues(String fieldId, List<String> values) {
    _values[fieldId] = List<String>.from(values);
    _recomputeVisibility();
    notifyListeners();
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
