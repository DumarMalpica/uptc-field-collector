import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SyncBadge extends StatelessWidget {
  const SyncBadge({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final synced = status == 'synced';
    final isError = status == 'error';

    final Color bg;
    final Color fg;
    final String label;

    if (synced) {
      bg = AppColors.primary.withValues(alpha: 0.12);
      fg = AppColors.primary;
      label = 'Sync';
    } else if (isError) {
      bg = Colors.red.withValues(alpha: 0.15);
      fg = Colors.red.shade800;
      label = 'Error';
    } else {
      bg = Colors.orange.withValues(alpha: 0.15);
      fg = Colors.orange.shade800;
      label = status == 'pending' ? 'Pendiente' : status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}
