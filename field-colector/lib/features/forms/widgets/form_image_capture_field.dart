/// Placeholder visual para fotos (`type: image_capture`).
///
/// Muestra el rótulo del JSON y un botón deshabilitado hasta integrar
/// cámara, galería o subida. No escribe aún en [FormProvider].
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormImageCaptureField extends StatelessWidget {
  const FormImageCaptureField({
    super.key,
    required this.field,
  });

  final FormFieldDef field;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: field.label,
        helperText: field.isRequired ? 'Obligatorio (pendiente de implementación)' : null,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Captura de fotos se integrará en una siguiente iteración.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: null,
            icon: const Icon(Icons.photo_camera_outlined, size: 20),
            label: const Text('Añadir fotos'),
          ),
        ],
      ),
    );
  }
}
