/// Campo de texto corto (`type: text`) enlazado a [FormProvider].
///
/// Usa [TextFormField] con validación opcional según [FormFieldDef.isRequired].
/// El valor se escribe en el proveedor en cada cambio para disparar reglas
/// de visibilidad condicional (`show_child`).
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_field_label.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  const FormTextField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initial = widget.provider.valueFor(widget.field.fieldId)?.toString() ?? '';
    _controller = TextEditingController(text: initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        label: FormFieldLabel(text: widget.field.label),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.surface,
      ),
      validator: widget.field.isRequired
          ? (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Campo obligatorio';
              }
              return null;
            }
          : null,
      onChanged: (v) => widget.provider.setValue(widget.field.fieldId, v),
    );
  }
}
