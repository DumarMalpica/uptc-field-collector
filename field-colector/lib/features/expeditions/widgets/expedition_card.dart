import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Tarjeta de expedición reutilizable.
///
/// Muestra datos principales del [Outing]. Un checkbox en la esquina superior
/// derecha controla la selección. Cuando está seleccionada, aparece una
/// banderita fijada en la parte inferior de la tarjeta.
class ExpeditionCard extends StatelessWidget {
  const ExpeditionCard({
    super.key,
    required this.outing,
    required this.isSelected,
    required this.onCheckChanged,
    required this.onTap,
  });

  final Outing outing;
  final bool isSelected;
  final ValueChanged<bool> onCheckChanged;
  final VoidCallback onTap;

  Color _statusColor(String status) {
    switch (status) {
      case 'active':
        return AppColors.primary;
      case 'closed':
        return AppColors.error;
      case 'draft':
        return AppColors.accent;
      default:
        return AppColors.textSecondary;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'active':
        return 'Activa';
      case 'closed':
        return 'Cerrada';
      case 'draft':
        return 'Borrador';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'es');

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 48, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Prefix + Name ──
                  Text(
                    outing.prefix,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    outing.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // ── Location + Zone ──
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${outing.location} · ${outing.zone}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // ── Dates + Status ──
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${dateFormat.format(outing.startDate)} – ${dateFormat.format(outing.endDate)}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _statusColor(outing.status).withValues(
                            alpha: 0.15,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _statusLabel(outing.status),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: _statusColor(outing.status),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Checkbox (top-right) ──
            Positioned(
              top: 4,
              right: 4,
              child: Checkbox(
                value: isSelected,
                onChanged: (v) => onCheckChanged(v ?? false),
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),

            // ── Flag badge (bottom-right, only when selected) ──
            if (isSelected)
              Positioned(
                bottom: 8,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.flag,
                    size: 16,
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
