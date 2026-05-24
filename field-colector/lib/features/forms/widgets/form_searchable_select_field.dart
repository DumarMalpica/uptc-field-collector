/// Lista desplegable autocompletada (`type: searchable_select`).
///
/// [RawAutocomplete] sobre opciones fijas del JSON; al seleccionar se llama
/// [FormProvider.setValue] para mantener coherencia con reglas `show_child`.
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_field_label.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormSearchableSelectField extends StatefulWidget {
  const FormSearchableSelectField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormSearchableSelectField> createState() => _FormSearchableSelectFieldState();
}

class _FormSearchableSelectFieldState extends State<FormSearchableSelectField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  List<FieldOption> get _opts => widget.field.options ?? const [];

  String _labelForValue(String? value) {
    if (value == null || value.isEmpty) return '';
    for (final o in _opts) {
      if (o.value == value) return o.label;
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    final current = widget.provider.valueFor(widget.field.fieldId)?.toString();
    _controller = TextEditingController(text: _labelForValue(current));
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: widget.provider.valueFor(widget.field.fieldId) as String?,
      validator: widget.field.isRequired
          ? (v) {
              if (v == null || v.isEmpty) {
                return 'Seleccione una opción';
              }
              return null;
            }
          : null,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RawAutocomplete<FieldOption>(
              textEditingController: _controller,
              focusNode: _focusNode,
              displayStringForOption: (o) => o.label,
              optionsBuilder: (textEditingValue) {
                final q = textEditingValue.text.trim().toLowerCase();
                if (q.isEmpty) return _opts;
                return _opts.where((o) => o.label.toLowerCase().contains(q));
              },
              onSelected: (o) {
                _controller.text = o.label;
                state.didChange(o.value);
                widget.provider.setValue(widget.field.fieldId, o.value);
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 240, minWidth: 280),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, i) {
                          final o = options.elementAt(i);
                          return ListTile(
                            title: Text(o.label),
                            onTap: () => onSelected(o),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    label: FormFieldLabel(text: widget.field.label),
                    hintText: 'Buscar…',
                    errorText: state.errorText,
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.surface,
                    suffixIcon: const Icon(Icons.search),
                  ),
                  onFieldSubmitted: (_) => onFieldSubmitted(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
