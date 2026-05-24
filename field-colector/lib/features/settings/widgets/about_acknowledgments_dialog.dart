import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';

class _Contributor {
  const _Contributor({
    required this.name,
    required this.role,
    required this.color,
  });

  final String name;
  final String role;
  final Color color;
}

/// Diálogo de agradecimientos a participantes y equipo de desarrollo.
class AboutAcknowledgmentsDialog extends StatelessWidget {
  const AboutAcknowledgmentsDialog({super.key});

  static const List<_Contributor> _contributors = [
    _Contributor(
      name: 'Nancy Milena Cárdenas Avella',
      role: 'Bióloga',
      color: AppColors.semilleroLightGreen,
    ),
    _Contributor(
      name: 'Inés Vergara Gómez',
      role: 'Geóloga',
      color: AppColors.semilleroSkyBlue,
    ),
    _Contributor(
      name: 'José Luis Salamanca López',
      role: 'Ingeniero de sistemas',
      color: AppColors.semilleroDeepBlue,
    ),
    _Contributor(
      name: 'Nicolás Samuel Tinjacá Topia',
      role: 'Ingeniero de sistemas',
      color: AppColors.semilleroViolet,
    ),
    _Contributor(
      name: 'Dumar Hernán Malpica Pérez',
      role: 'Ingeniero de sistemas',
      color: AppColors.semilleroMagenta,
    ),
  ];

  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => const AboutAcknowledgmentsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: AppColors.textPrimary,
      height: 1.45,
    );

    return AlertDialog(
      title: const Text('Agradecimientos'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Esta aplicación es fruto de un esfuerzo conjunto entre '
              'distintas disciplinas. Agradecemos especialmente a quienes '
              'participaron en esta iniciativa:',
              style: bodyStyle,
            ),
            const SizedBox(height: 16),
            for (final person in _contributors) ...[
              _ContributorLine(person: person),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 8),
            Text(
              'A las ingenieras Inés Vergara Gómez y Nancy Milena '
              'Cárdenas Avella, por los datos técnicos, las ideas y las '
              'revisiones que enriquecieron nuestro trabajo.',
              style: bodyStyle,
            ),
            const SizedBox(height: 12),
            Text(
              'Al grupo de investigación, por su apertura a iniciativas '
              'provenientes de otras carreras y por fomentar la colaboración '
              'interdisciplinaria.',
              style: bodyStyle,
            ),
            const SizedBox(height: 12),
            Text(
              'A nuestro equipo de desarrollo, por construir esta '
              'aplicación con dedicación y cariño.',
              style: bodyStyle,
            ),
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}

class _ContributorLine extends StatelessWidget {
  const _ContributorLine({required this.person});

  final _Contributor person;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppStyles.body.copyWith(height: 1.35),
        children: [
          TextSpan(
            text: person.name,
            style: TextStyle(color: person.color, fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '\n${person.role}',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
