import 'package:field_colector/features/auth/widgets/gems_design.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Contenido central del splash GEMS: wordmark + subtítulo completo,
/// emblema botánico y crédito institucional de Citesa Research.
class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const GemsWordmark(
          fontSize: 44,
          baseColor: AppColors.primaryDark,
          accentColor: AppColors.accent,
          accentLetter: 'E',
        ),
        const SizedBox(height: 10),
        const Text(
          'GEOSPATIAL ENVIRONMENTAL MONITORING SYSTEM',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
            letterSpacing: 0.8,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 44),
        const GemsBotanicalEmblem(size: 132),
        const SizedBox(height: 36),
        const Text(
          'un proyecto de',
          style: TextStyle(fontSize: 10, color: AppColors.textMuted),
        ),
        const SizedBox(height: 2),
        Text.rich(
          TextSpan(
            children: const [
              TextSpan(
                text: 'Citesa ',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'Research',
                style: TextStyle(
                  color: AppColors.semilleroDeepBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          style: const TextStyle(fontSize: 13, letterSpacing: 0.3),
        ),
      ],
    );
  }
}
