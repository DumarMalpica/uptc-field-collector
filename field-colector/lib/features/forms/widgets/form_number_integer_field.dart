/// Entrada numérica entera (`type: number_integer`).
///
/// Teclado numérico sin decimales; solo dígitos permitidos.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumberIntegerField extends StatefulWidget {
  const FormNumberIntegerField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormNumberIntegerField> createState() => _FormNumberIntegerFieldState();
}

class _FormNumberIntegerFieldState extends State<FormNumberIntegerField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initial =
        widget.provider.valueFor(widget.field.fieldId)?.toString() ?? '';
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
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelText: widget.field.label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.surface,
      ),
      validator: widget.field.isRequired
          ? (v) {
              if (v == null || v.trim().isEmpty) {
                return 'Campo obligatorio';
              }
              if (int.tryParse(v) == null) {
                return 'Número entero inválido';
              }
              return null;
            }
          : (v) {
              if (v == null || v.trim().isEmpty) return null;
              if (int.tryParse(v) == null) return 'Número entero inválido';
              return null;
            },
      onChanged: (v) => widget.provider.setValue(widget.field.fieldId, v),
    );
  }
}
