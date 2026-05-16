/// Entrada numérica con decimales (`type: number_decimal`).
///
/// Teclado numérico, filtro de caracteres y validación básica de formato;
/// el valor se almacena como cadena en el proveedor (el backend puede parsear).
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumberDecimalField extends StatefulWidget {
  const FormNumberDecimalField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormNumberDecimalField> createState() => _FormNumberDecimalFieldState();
}

class _FormNumberDecimalFieldState extends State<FormNumberDecimalField> {
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
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,-]')),
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
              final n = num.tryParse(v.replaceAll(',', '.'));
              if (n == null) {
                return 'Número inválido';
              }
              return null;
            }
          : (v) {
              if (v == null || v.trim().isEmpty) return null;
              final n = num.tryParse(v.replaceAll(',', '.'));
              if (n == null) return 'Número inválido';
              return null;
            },
      onChanged: (v) => widget.provider.setValue(widget.field.fieldId, v),
    );
  }
}
