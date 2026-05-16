/// Modelos de datos para definiciones de formulario en JSON (`assets/data/*.json`).
///
/// Incluye [FormSchema] (documento raíz), [FormFieldDef] (cada variable de campo)
/// y [FieldOption] (opciones de selección). El analizador unifica `target_field`
/// (string) y `target_fields` (lista) del JSON en [FieldOption.targetFields].
///
/// El campo [FormFieldDef.formSection] distingue datos comunes (0) del módulo
/// específico (1); lo asigna el cargador al parsear, no el propio JSON.
import 'dart:convert';

/// Raíz del JSON: identificador, título y lista de campos.
class FormSchema {
  const FormSchema({
    required this.formId,
    required this.title,
    required this.fields,
  });

  final String formId;
  final String title;
  final List<FormFieldDef> fields;

  factory FormSchema.fromJson(Map<String, dynamic> json, {int formSection = 0}) {
    final raw = json['fields'];
    if (raw is! List) {
      throw FormatException('FormSchema.fields must be a list');
    }
    return FormSchema(
      formId: json['form_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      fields: raw
          .whereType<Map<String, dynamic>>()
          .map((e) => FormFieldDef.fromJson(e, formSection: formSection))
          .toList(),
    );
  }

  static FormSchema parse(String source, {int formSection = 0}) {
    final decoded = jsonDecode(source);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('Root JSON must be an object');
    }
    return FormSchema.fromJson(decoded, formSection: formSection);
  }
}

/// Definición de un campo: tipo, visibilidad inicial, obligatoriedad y opciones.
class FormFieldDef {
  const FormFieldDef({
    required this.fieldId,
    required this.label,
    required this.type,
    required this.isVisibleByDefault,
    required this.isRequired,
    required this.order,
    required this.formSection,
    this.options,
  });

  final String fieldId;
  final String label;
  final String type;
  final bool isVisibleByDefault;
  final bool isRequired;
  final int order;

  /// 0 = common (`common_data.json`), 1 = module (`*_metadata.json`).
  final int formSection;
  final List<FieldOption>? options;

  factory FormFieldDef.fromJson(
    Map<String, dynamic> json, {
    int formSection = 0,
  }) {
    final opts = json['options'];
    return FormFieldDef(
      fieldId: json['field_id'] as String? ?? '',
      label: json['label'] as String? ?? '',
      type: json['type'] as String? ?? 'text',
      isVisibleByDefault: json['is_visible_by_default'] as bool? ?? true,
      isRequired: json['is_required'] as bool? ?? false,
      order: (json['order'] as num?)?.toInt() ?? 0,
      formSection: formSection,
      options: opts is List
          ? opts.whereType<Map<String, dynamic>>().map(FieldOption.fromJson).toList()
          : null,
    );
  }
}

/// Opción de lista; `action: show_child` con [targetFields] muestra campos hijos.
class FieldOption {
  const FieldOption({
    required this.label,
    required this.value,
    this.action,
    this.targetFields,
  });

  final String label;
  final String value;
  final String? action;
  final List<String>? targetFields;

  factory FieldOption.fromJson(Map<String, dynamic> json) {
    final tf = json['target_fields'];
    final single = json['target_field'];
    List<String>? targets;
    if (tf is List) {
      targets = tf.map((e) => e.toString()).toList();
    } else if (single is String) {
      targets = [single];
    }
    return FieldOption(
      label: json['label'] as String? ?? '',
      value: json['value'] as String? ?? '',
      action: json['action'] as String?,
      targetFields: targets,
    );
  }
}
