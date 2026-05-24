import 'package:field_colector/features/expeditions/providers/field_session_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Etiqueta superior y botón de registro cuando hay sesión en campo.
class FieldModeOverlay extends StatelessWidget {
  const FieldModeOverlay({
    super.key,
    required this.fieldSession,
    required this.topInset,
    required this.bottomInset,
    required this.onRegistrationTap,
  });

  final FieldSessionProvider fieldSession;
  final double topInset;
  final double bottomInset;
  final VoidCallback onRegistrationTap;

  @override
  Widget build(BuildContext context) {
    final prefix = fieldSession.activeOutingPrefix?.trim() ?? '';
    final name = fieldSession.activeOutingName?.trim() ?? '';

    return Stack(
      children: [
        Positioned(
          top: topInset,
          left: 12,
          child: _FieldModeBanner(prefix: prefix, name: name),
        ),
        Positioned(
          left: 12,
          bottom: bottomInset,
          child: _FieldRegistrationButton(onPressed: onRegistrationTap),
        ),
      ],
    );
  }
}

class _FieldModeBanner extends StatelessWidget {
  const _FieldModeBanner({required this.prefix, required this.name});

  final String prefix;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      color: AppColors.surface,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 260),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.cumulusBlue.withValues(alpha: 0.55),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.cumulusBlue.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                PhosphorIconsRegular.tree,
                size: 20,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EN CAMPO',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: AppColors.primaryDark.withValues(alpha: 0.85),
                    ),
                  ),
                  if (prefix.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      prefix,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  if (name.isNotEmpty) ...[
                    const SizedBox(height: 1),
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldRegistrationButton extends StatelessWidget {
  const _FieldRegistrationButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: AppColors.grassShadow.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(14),
      child: FilledButton.icon(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.cumulusBlue,
          foregroundColor: AppColors.primaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: AppColors.primaryDark.withValues(alpha: 0.12),
            ),
          ),
        ),
        icon: const Icon(Icons.edit_note, size: 26),
        label: const Text('Registro'),
      ),
    );
  }
}
