import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/features/expeditions/data/fake_expeditions_data.dart';
import 'package:field_colector/features/expeditions/screens/expedition_detail_screen.dart';
import 'package:field_colector/features/expeditions/widgets/expedition_card.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Pantalla principal de expediciones.
///
/// Contiene:
/// - Input de búsqueda
/// - Sección de expediciones disponibles (sin seleccionar)
/// - Sección de expediciones seleccionadas (con check + bandera)
///
/// Al tocar una tarjeta (no el check), se abre el detalle en el mismo espacio.
class ExpeditionListScreen extends StatefulWidget {
  const ExpeditionListScreen({super.key});

  @override
  State<ExpeditionListScreen> createState() => _ExpeditionListScreenState();
}

class _ExpeditionListScreenState extends State<ExpeditionListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedIds = {};
  String _searchQuery = '';

  /// Cuando no es null, se muestra el detalle de esta expedición.
  Outing? _detailOuting;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Outing> get _filtered {
    if (_searchQuery.isEmpty) return kFakeOutings;
    final q = _searchQuery.toLowerCase();
    return kFakeOutings.where((o) {
      return o.name.toLowerCase().contains(q) ||
          o.prefix.toLowerCase().contains(q) ||
          o.location.toLowerCase().contains(q) ||
          o.zone.toLowerCase().contains(q);
    }).toList();
  }

  List<Outing> get _unselected =>
      _filtered.where((o) => !_selectedIds.contains(o.id)).toList();

  List<Outing> get _selected =>
      _filtered.where((o) => _selectedIds.contains(o.id)).toList();

  @override
  Widget build(BuildContext context) {
    // ── Detail mode ──
    if (_detailOuting != null) {
      return ExpeditionDetailScreen(
        outing: _detailOuting!,
        onBack: () => setState(() => _detailOuting = null),
      );
    }

    // ── List mode ──
    return Column(
      children: [
        // ── Search bar ──
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: _searchController,
            onChanged: (v) => setState(() => _searchQuery = v),
            decoration: InputDecoration(
              hintText: 'Buscar expedición...',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
        ),

        // ── Scrollable list ──
        Expanded(
          child: (_unselected.isEmpty && _selected.isEmpty)
              ? const Center(
                  child: Text(
                    'Sin resultados',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                )
              : ListView(
                  children: [
                    // ── Unselected section ──
                    if (_unselected.isNotEmpty) ...[
                      _SectionHeader(
                        title: 'Expediciones disponibles',
                        count: _unselected.length,
                      ),
                      ..._unselected.map(
                        (o) => ExpeditionCard(
                          outing: o,
                          isSelected: false,
                          onCheckChanged: (_) {
                            setState(() => _selectedIds.add(o.id));
                          },
                          onTap: () =>
                              setState(() => _detailOuting = o),
                        ),
                      ),
                    ],

                    // ── Selected section ──
                    if (_selected.isNotEmpty) ...[
                      _SectionHeader(
                        title: 'Seleccionadas',
                        count: _selected.length,
                      ),
                      ..._selected.map(
                        (o) => ExpeditionCard(
                          outing: o,
                          isSelected: true,
                          onCheckChanged: (_) {
                            setState(() => _selectedIds.remove(o.id));
                          },
                          onTap: () =>
                              setState(() => _detailOuting = o),
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),
                  ],
                ),
        ),
      ],
    );
  }
}

// ── Section header ──────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.count});

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryDark,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
