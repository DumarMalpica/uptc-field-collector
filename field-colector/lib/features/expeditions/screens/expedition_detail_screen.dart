import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/features/expeditions/data/fake_expeditions_data.dart';
import 'package:field_colector/features/map/download/map_tile_download_flow.dart';
import 'package:field_colector/features/map/map_services.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Pantalla de detalle de una expedición.
///
/// Muestra todos los campos del [Outing], nombre del director (resuelto por
/// `createdById`), listas de participantes y solicitantes, y botones de
/// acción en la parte inferior.
class ExpeditionDetailScreen extends StatefulWidget {
  const ExpeditionDetailScreen({
    super.key,
    required this.outing,
    required this.onBack,
  });

  final Outing outing;
  final VoidCallback onBack;

  @override
  State<ExpeditionDetailScreen> createState() => _ExpeditionDetailScreenState();
}

class _ExpeditionDetailScreenState extends State<ExpeditionDetailScreen> {
  late Outing _outing;
  bool _isDownloadingMap = false;

  @override
  void initState() {
    super.initState();
    _outing = widget.outing;
  }

  User? _resolveUser(String id) => kFakeUsers[id];

  bool get _isOwner => _outing.createdById == kCurrentUserId;

  bool get _alreadyPending =>
      _outing.pendingUsers.any((u) => u.id == kCurrentUserId);

  bool get _isParticipant => _outing.participantIds.contains(kCurrentUserId);

  void _requestJoin() {
    final currentUser = kFakeUsers[kCurrentUserId];
    if (currentUser == null) return;

    setState(() {
      _outing = Outing(
        id: _outing.id,
        prefix: _outing.prefix,
        name: _outing.name,
        location: _outing.location,
        zone: _outing.zone,
        reason: _outing.reason,
        latitude: _outing.latitude,
        longitude: _outing.longitude,
        altitude: _outing.altitude,
        startDate: _outing.startDate,
        endDate: _outing.endDate,
        createdById: _outing.createdById,
        participantIds: _outing.participantIds,
        status: _outing.status,
        syncStatus: _outing.syncStatus,
        pendingUsers: [
          ..._outing.pendingUsers,
          PendingUser(
            id: currentUser.id,
            name: currentUser.fullName,
            email: currentUser.email,
          ),
        ],
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Solicitud enviada'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _downloadMap() async {
    final services = context.read<MapServices>();

    final picked = await MapTileDownloadFlow.showDownloadDialog(
      context: context,
    );
    if (picked == null || !mounted) return;

    final (name, radiusKm) = picked;

    setState(() => _isDownloadingMap = true);

    try {
      await services.downloadMap.execute(
        lat: _outing.latitude,
        lon: _outing.longitude,
        radius: radiusKm,
        name: name,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mapa descargado con éxito'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al descargar: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isDownloadingMap = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'es');
    final director = _resolveUser(_outing.createdById);

    return Column(
      children: [
        // ── Header with back ──
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  _outing.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // ── Scrollable content ──
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // ── Director ──
              _SectionTitle('Director de expedición'),
              const SizedBox(height: 4),
              _InfoRow(
                icon: Icons.person,
                label: director?.fullName ?? 'Desconocido',
                subtitle: director?.email,
              ),
              const SizedBox(height: 16),

              // ── General info ──
              _SectionTitle('Información general'),
              const SizedBox(height: 8),
              _DetailField(label: 'Prefijo', value: _outing.prefix),
              _DetailField(label: 'Ubicación', value: _outing.location),
              _DetailField(label: 'Zona', value: _outing.zone),
              _DetailField(label: 'Razón', value: _outing.reason),
              _DetailField(
                label: 'Latitud',
                value: _outing.latitude.toStringAsFixed(4),
              ),
              _DetailField(
                label: 'Longitud',
                value: _outing.longitude.toStringAsFixed(4),
              ),
              _DetailField(
                label: 'Altitud',
                value: '${_outing.altitude.toStringAsFixed(0)} m',
              ),
              _DetailField(
                label: 'Fecha inicio',
                value: dateFormat.format(_outing.startDate),
              ),
              _DetailField(
                label: 'Fecha fin',
                value: dateFormat.format(_outing.endDate),
              ),
              _DetailField(label: 'Estado', value: _outing.status),
              _DetailField(
                label: 'Sincronización',
                value: _outing.syncStatus,
              ),
              const SizedBox(height: 16),

              // ── Participants ──
              _SectionTitle(
                'Participantes (${_outing.participantIds.length})',
              ),
              const SizedBox(height: 8),
              ..._outing.participantIds.map((id) {
                final user = _resolveUser(id);
                return _InfoRow(
                  icon: Icons.person_outline,
                  label: user?.fullName ?? id,
                  subtitle: user?.email,
                );
              }),
              const SizedBox(height: 16),

              // ── Pending users ──
              _SectionTitle(
                'Solicitantes (${_outing.pendingUsers.length})',
              ),
              const SizedBox(height: 8),
              if (_outing.pendingUsers.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Sin solicitudes pendientes',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              else
                ..._outing.pendingUsers.map(
                  (pu) => _InfoRow(
                    icon: Icons.hourglass_empty,
                    label: pu.name,
                    subtitle: pu.email,
                  ),
                ),

              const SizedBox(height: 24),
            ],
          ),
        ),

        // ── Bottom action buttons (vertical) ──
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Listar registros
              OutlinedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Próximamente: Listar registros'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.list_alt, size: 18),
                label: const Text('Registros'),
              ),
              const SizedBox(height: 8),

              // Descargar mapa
              OutlinedButton.icon(
                onPressed: _isDownloadingMap ? null : _downloadMap,
                icon: _isDownloadingMap
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.download, size: 18),
                label: Text(
                  _isDownloadingMap ? 'Descargando...' : 'Descargar mapa',
                ),
              ),
              const SizedBox(height: 8),

              // Solicitar unirse (solo si no eres propietario ni participante)
              if (!_isOwner && !_isParticipant) ...[
                ElevatedButton.icon(
                  onPressed: _alreadyPending ? null : _requestJoin,
                  icon: Icon(
                    _alreadyPending ? Icons.check : Icons.person_add,
                    size: 18,
                  ),
                  label: Text(
                    _alreadyPending ? 'Pendiente' : 'Solicitar unirse',
                  ),
                ),
                const SizedBox(height: 8),
              ],

              // En campo
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Próximamente: Modo en campo'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: AppColors.textPrimary,
                ),
                icon: const Icon(Icons.explore, size: 18),
                label: const Text('En campo'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Helper widgets ──────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryDark,
        letterSpacing: 0.3,
      ),
    );
  }
}

class _DetailField extends StatelessWidget {
  const _DetailField({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    this.subtitle,
  });

  final IconData icon;
  final String label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
