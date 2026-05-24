import 'package:flutter/material.dart';

/// Etiqueta de campo de formulario; permite hasta 2 líneas para textos largos.
class FormFieldLabel extends StatelessWidget {
  const FormFieldLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).inputDecorationTheme.labelStyle ??
        Theme.of(context).textTheme.titleSmall;
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: style,
    );
  }
}
