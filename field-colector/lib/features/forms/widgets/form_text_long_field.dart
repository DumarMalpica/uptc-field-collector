/// Campo de texto multilínea (`type: text_long`) para observaciones extensas.
///
/// Varias líneas visibles; misma integración con [FormProvider] que [FormTextField].
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_field_label.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormTextLongField extends StatefulWidget {
  const FormTextLongField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormTextLongField> createState() => _FormTextLongFieldState();
}

class _FormTextLongFieldState extends State<FormTextLongField> {
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
      minLines: 3,
      maxLines: 6,
      decoration: InputDecoration(
        label: FormFieldLabel(text: widget.field.label),
        alignLabelWithHint: true,
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
