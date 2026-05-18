/// Selección única (`type: single_select`) con [RadioListTile].
///
/// Al elegir una opción con `action: show_child`, [FormProvider.setValue]
/// actualiza visibilidad de campos dependientes definidos en el JSON.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormSingleSelectField extends StatelessWidget {
  const FormSingleSelectField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  Widget build(BuildContext context) {
    final opts = field.options ?? const <FieldOption>[];
    if (opts.isEmpty) {
      return Text('Sin opciones: ${field.fieldId}', style: const TextStyle(color: AppColors.textSecondary));
    }

    final current = provider.valueFor(field.fieldId) as String?;

    return FormField<String>(
      initialValue: current,
      validator: field.isRequired
          ? (v) {
              if (v == null || v.isEmpty) {
                return 'Seleccione una opción';
              }
              return null;
            }
          : null,
      builder: (state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: field.label,
            errorText: state.errorText,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: AppColors.surface,
          ),
          child: Column(
            children: [
              for (final o in opts)
                RadioListTile<String>(
                  title: Text(o.label, style: const TextStyle(fontSize: 14)),
                  value: o.value,
                  groupValue: state.value,
                  onChanged: (v) {
                    state.didChange(v);
                    provider.setValue(field.fieldId, v);
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                ),
            ],
          ),
        );
      },
    );
  }
}
