import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Bienvenido',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.primaryDark,
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Citesa Field Colector te permite recolectar '
          'datos de campo de forma eficiente y organizada.',
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryDark.withValues(alpha: 0.85),
          ),
        ),
      ],
    );
  }
}
