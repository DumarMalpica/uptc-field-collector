/// Selección múltiple (`type: multi_select`) con [FilterChip].
///
/// Los valores activos son una lista de `value` en el proveedor
/// ([FormProvider.setMultiSelectValues]); también participa en `show_child`.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormMultiSelectField extends StatelessWidget {
  const FormMultiSelectField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  List<String> _selected() {
    final raw = provider.valueFor(field.fieldId);
    if (raw is List) {
      return raw.map((e) => e.toString()).toList();
    }
    return <String>[];
  }

  @override
  Widget build(BuildContext context) {
    final opts = field.options ?? const <FieldOption>[];
    if (opts.isEmpty) {
      return Text('Sin opciones: ${field.fieldId}', style: const TextStyle(color: AppColors.textSecondary));
    }

    final selected = _selected();

    return FormField<List<String>>(
      initialValue: selected,
      validator: field.isRequired
          ? (v) {
              if (v == null || v.isEmpty) {
                return 'Seleccione al menos una opción';
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
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final o in opts)
                FilterChip(
                  label: Text(o.label),
                  selected: selected.contains(o.value),
                  onSelected: (on) {
                    final next = List<String>.from(selected);
                    if (on) {
                      if (!next.contains(o.value)) next.add(o.value);
                    } else {
                      next.remove(o.value);
                    }
                    state.didChange(next);
                    provider.setMultiSelectValues(field.fieldId, next);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
