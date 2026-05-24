import 'package:field_colector/core/services/expedition_sync_service.dart';
import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/domain/ports/outing_local_port.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/expeditions/providers/field_session_provider.dart';
import 'package:field_colector/features/expeditions/screens/expedition_create_screen.dart';
import 'package:field_colector/features/expeditions/screens/expedition_detail_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:field_colector/features/expeditions/widgets/expedition_card.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Pantalla principal de expediciones.
///
/// Contiene:
/// - Input de búsqueda
/// - Sección de expediciones disponibles (sin seleccionar)
/// - Sección de expediciones seleccionadas (con check + bandera; ver TODO en [_selectedIds])
///
/// Al tocar una tarjeta (no el check), se abre el detalle en el mismo espacio.
class ExpeditionListScreen extends StatefulWidget {
  const ExpeditionListScreen({super.key, this.onNavigateToLocation});

  final ValueChanged<LatLng>? onNavigateToLocation;

  @override
  State<ExpeditionListScreen> createState() => _ExpeditionListScreenState();
}

class _ExpeditionListScreenState extends State<ExpeditionListScreen> {
  final TextEditingController _searchController = TextEditingController();
  // TODO: Persistir selección y precargar datos offline (expedición, registros,
  // mapa) para uso sin red. Hoy solo reorganiza la lista en memoria.
  final Set<String> _selectedIds = {};
  String _searchQuery = '';

  List<Outing> _outings = [];
  bool _loading = true;
  String? _loadError;

  /// Cuando no es null, se muestra el detalle de esta expedición.
  Outing? _detailOuting;

  /// Cuando es true, se muestra la pantalla de creación.
  bool _showCreate = false;

  FieldSessionProvider? _fieldSessionListened;
  int _seenEnterFieldEpoch = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadOutings());
  }

  @override
  void dispose() {
    _fieldSessionListened?.removeListener(_onFieldSessionChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final field = context.read<FieldSessionProvider>();
    if (!identical(_fieldSessionListened, field)) {
      _fieldSessionListened?.removeListener(_onFieldSessionChanged);
      _fieldSessionListened = field;
      _seenEnterFieldEpoch = field.enterFieldEpoch;
      _fieldSessionListened!.addListener(_onFieldSessionChanged);
    }
  }

  void _onFieldSessionChanged() {
    final field = _fieldSessionListened!;
    if (field.enterFieldEpoch <= _seenEnterFieldEpoch) return;
    setState(() {
      _seenEnterFieldEpoch = field.enterFieldEpoch;
      _detailOuting = null;
      _showCreate = false;
    });
  }

  Future<void> _loadOutings({bool forceRemoteSync = false}) async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final auth = context.read<Authprovider>();
      final userId = auth.user?.id;
      if (userId != null && userId.isNotEmpty) {
        try {
          await context
              .read<ExpeditionSyncService>()
              .syncExpeditionsForUser(userId);
        } catch (_) {}
      }

      final outings = await context.read<OutingLocalPort>().getAllOutings();
      if (!mounted) return;
      setState(() {
        _outings = outings;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadError = e.toString();
        _loading = false;
      });
    }
  }

  List<Outing> get _filtered {
    if (_searchQuery.isEmpty) return _outings;
    final q = _searchQuery.toLowerCase();
    return _outings.where((o) {
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
    // ── Create mode ──
    if (_showCreate) {
      return ExpeditionCreateScreen(
        onBack: () {
          setState(() => _showCreate = false);
          _loadOutings();
        },
      );
    }

    // ── Detail mode ──
    if (_detailOuting != null) {
      return ExpeditionDetailScreen(
        outing: _detailOuting!,
        onBack: () {
          setState(() => _detailOuting = null);
          _loadOutings();
        },
        onNavigateToLocation: widget.onNavigateToLocation,
      );
    }

    // ── List mode ──
    return Column(
      children: [
        // ── Search bar ──
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              Expanded(
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
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () => setState(() => _showCreate = true),
                icon: const Icon(Icons.add, size: 22),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                ),
                tooltip: 'Nueva expedición',
              ),
            ],
          ),
        ),

        // ── Scrollable list ──
        Expanded(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _loadError != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          _loadError!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.textSecondary),
                        ),
                      ),
                    )
                  : (_unselected.isEmpty && _selected.isEmpty)
                      ? const Center(
                          child: Text(
                            'Sin resultados',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: () =>
                              _loadOutings(forceRemoteSync: true),
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
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
