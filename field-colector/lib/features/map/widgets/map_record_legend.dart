import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/features/map/models/map_record_pin.dart';
import 'package:flutter/material.dart';

/// Leyenda colapsable; cada fila activa/desactiva visibilidad de ese módulo en el mapa.
class MapRecordLegend extends StatefulWidget {
  const MapRecordLegend({
    super.key,
    required this.activeFilters,
    required this.onFilterToggled,
    this.showOfflineHint = false,
    this.onRefresh,
    this.isRefreshing = false,
  });

  final Set<String> activeFilters;
  final ValueChanged<String> onFilterToggled;
  final bool showOfflineHint;
  final VoidCallback? onRefresh;
  final bool isRefreshing;

  @override
  State<MapRecordLegend> createState() => _MapRecordLegendState();
}

class _MapRecordLegendState extends State<MapRecordLegend> {
  bool _expanded = false;

  static const _moduleOrder = [
    FormMapperRegistry.moduloAgua,
    FormMapperRegistry.moduloAves,
    FormMapperRegistry.moduloRocas,
    FormMapperRegistry.moduloSuelos,
    FormMapperRegistry.moduloVegetacion,
    FormMapperRegistry.moduloSocial,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface.withValues(alpha: 0.92),
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () => setState(() => _expanded = !_expanded),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Registros',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                  ),
                  if (widget.onRefresh != null) ...[
                    const SizedBox(width: 2),
                    IconButton(
                      icon: widget.isRefreshing
                          ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: theme.colorScheme.primary,
                              ),
                            )
                          : const Icon(Icons.refresh, size: 18),
                      onPressed:
                          widget.isRefreshing ? null : widget.onRefresh,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 28,
                        minHeight: 28,
                      ),
                      tooltip: 'Actualizar registros',
                    ),
                  ],
                ],
              ),
            ),
            if (widget.showOfflineHint) ...[
              const SizedBox(height: 4),
              Text(
                'Sin conexión · datos locales',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontSize: 11,
                ),
              ),
            ],
            if (_expanded) ...[
              const SizedBox(height: 6),
              for (final moduleId in _moduleOrder)
                _LegendRow(
                  color: MapRecordPin.colorFor(moduleId),
                  label: MapRecordPin.labelFor(moduleId),
                  isActive: widget.activeFilters.contains(moduleId),
                  onTap: () => widget.onFilterToggled(moduleId),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({
    required this.color,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final Color color;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final opacity = isActive ? 1.0 : 0.35;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
          child: Opacity(
            opacity: opacity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    decoration:
                        isActive ? null : TextDecoration.lineThrough,
                  ),
                ),
                if (!isActive) ...[
                  const SizedBox(width: 6),
                  Icon(
                    Icons.visibility_off,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
