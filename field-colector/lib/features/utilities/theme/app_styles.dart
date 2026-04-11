import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Estilos reutilizables.
/// Equivalente a clases CSS: .card, .input, .btn-primary, etc.
class AppStyles {
  AppStyles._();

  // .card
  static BoxDecoration card = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.grassShadow.withValues(alpha: 0.08),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  // .card-accent (card con borde de color primary)
  static BoxDecoration cardAccent = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
    boxShadow: [
      BoxShadow(
        color: AppColors.grassShadow.withValues(alpha: 0.05),
        blurRadius: 4,
        offset: const Offset(0, 1),
      ),
    ],
  );

  // .badge-warning (para etiquetas de advertencia)
  static BoxDecoration badgeWarning = BoxDecoration(
    color: AppColors.accent.withValues(alpha: 0.2),
    borderRadius: BorderRadius.circular(16),
  );

  // .badge-info
  static BoxDecoration badgeInfo = BoxDecoration(
    color: AppColors.secondary.withValues(alpha: 0.2),
    borderRadius: BorderRadius.circular(16),
  );

  // --- Tipografía ---
  // Usar con context: Theme.of(context).textTheme.titleLarge
  //
  // Mapeo:
  //   title    → textTheme.titleLarge
  //   subtitle → textTheme.titleMedium
  //   body     → textTheme.bodyLarge
  //   caption  → textTheme.bodySmall
  //
  // Los const se mantienen para casos sin context (ej. showcase).
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  // --- Espaciado ---
  static const EdgeInsets paddingSm = EdgeInsets.all(8);
  static const EdgeInsets paddingMd = EdgeInsets.all(16);
  static const EdgeInsets paddingLg = EdgeInsets.all(24);
  static const EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 16);

  static const SizedBox gapSm = SizedBox(height: 8);
  static const SizedBox gapMd = SizedBox(height: 16);
  static const SizedBox gapLg = SizedBox(height: 24);
}
