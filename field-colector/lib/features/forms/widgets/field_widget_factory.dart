/// Fábrica de widgets de captura según el `type` del JSON de formulario.
///
/// Centraliza el mapeo `text`, `text_long`, `number_integer`, `number_decimal`, `single_select`,
/// `multi_select`, `searchable_select`, `gps_capture`, `image_capture` hacia
/// widgets concretos. Tipos desconocidos muestran aviso en UI.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_gps_capture_field.dart';
import 'package:field_colector/features/forms/widgets/form_image_capture_field.dart';
import 'package:field_colector/features/forms/widgets/form_multi_select_field.dart';
import 'package:field_colector/features/forms/widgets/form_number_decimal_field.dart';
import 'package:field_colector/features/forms/widgets/form_number_integer_field.dart';
import 'package:field_colector/features/forms/widgets/form_searchable_select_field.dart';
import 'package:field_colector/features/forms/widgets/form_single_select_field.dart';
import 'package:field_colector/features/forms/widgets/form_text_field.dart';
import 'package:field_colector/features/forms/widgets/form_text_long_field.dart';
import 'package:flutter/material.dart';

class FieldWidgetFactory {
  FieldWidgetFactory._();

  static Widget build({
    required FormFieldDef field,
    required FormProvider provider,
  }) {
    switch (field.type) {
      case 'text':
        return FormTextField(field: field, provider: provider);
      case 'text_long':
        return FormTextLongField(field: field, provider: provider);
      case 'number_integer':
        return FormNumberIntegerField(field: field, provider: provider);
      case 'number_decimal':
        return FormNumberDecimalField(field: field, provider: provider);
      case 'single_select':
        return FormSingleSelectField(field: field, provider: provider);
      case 'multi_select':
        return FormMultiSelectField(field: field, provider: provider);
      case 'searchable_select':
        return FormSearchableSelectField(field: field, provider: provider);
      case 'gps_capture':
        return FormGpsCaptureField(field: field, provider: provider);
      case 'image_capture':
        return FormImageCaptureField(field: field, provider: provider);
      default:
        return ListTile(
          title: Text(field.label),
          subtitle: Text(
            'Tipo no soportado: ${field.type}',
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
    }
  }
}
