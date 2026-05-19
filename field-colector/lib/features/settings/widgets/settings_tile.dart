import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';

enum SettingsTileVariant { toggle, dropdown, action, info }

/// Fila de ajuste reutilizable.
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    this.subtitle,
    this.variant = SettingsTileVariant.info,
    this.value,
    this.onChanged,
    this.onTap,
    this.trailing,
    this.enabled = true,
  });

  const SettingsTile.toggle({
    super.key,
    required this.title,
    this.subtitle,
    required bool value,
    required ValueChanged<bool>? onChanged,
    this.enabled = true,
  })  : variant = SettingsTileVariant.toggle,
        value = value,
        onChanged = onChanged,
        onTap = null,
        trailing = null;

  const SettingsTile.dropdown({
    super.key,
    required this.title,
    this.subtitle,
    required String value,
    required VoidCallback? onTap,
    this.enabled = true,
  })  : variant = SettingsTileVariant.dropdown,
        value = value,
        onChanged = null,
        onTap = onTap,
        trailing = null;

  const SettingsTile.action({
    super.key,
    required this.title,
    this.subtitle,
    required VoidCallback? onTap,
    this.trailing,
    this.enabled = true,
  })  : variant = SettingsTileVariant.action,
        value = null,
        onChanged = null,
        onTap = onTap;

  const SettingsTile.info({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  })  : variant = SettingsTileVariant.info,
        value = null,
        onChanged = null,
        onTap = null,
        enabled = true;

  final String title;
  final String? subtitle;
  final SettingsTileVariant variant;
  final dynamic value;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    Widget? control;
    switch (variant) {
      case SettingsTileVariant.toggle:
        control = Switch.adaptive(
          value: value as bool? ?? false,
          onChanged: enabled ? onChanged : null,
        );
      case SettingsTileVariant.dropdown:
      case SettingsTileVariant.action:
        control = trailing ??
            Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary.withValues(
                alpha: enabled ? 1 : 0.4,
              ),
            );
      case SettingsTileVariant.info:
        control = trailing;
    }

    final content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: enabled
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: AppStyles.caption,
                  ),
                ],
              ],
            ),
          ),
          if (variant == SettingsTileVariant.dropdown && value is String) ...[
            Text(
              value as String,
              style: AppStyles.caption.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
          ],
          if (control != null) control,
        ],
      ),
    );

    if (variant == SettingsTileVariant.toggle ||
        variant == SettingsTileVariant.info) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: content,
      ),
    );
  }
}
