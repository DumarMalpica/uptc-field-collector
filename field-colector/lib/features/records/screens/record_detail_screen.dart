import 'dart:async';
import 'dart:io';

import 'package:field_colector/core/services/user_cache_service.dart';
import 'package:field_colector/domain/entities/photo.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/domain/ports/sync_port.dart';
import 'package:field_colector/domain/entities/base_record.dart';
import 'package:field_colector/domain/utils/geo_coords.dart';
import 'package:field_colector/domain/outing_member_display.dart';
import 'package:field_colector/features/dashboard/data/field_form_catalog.dart';
import 'package:field_colector/features/records/models/record_list_item.dart';
import 'package:field_colector/features/records/services/record_detail_refresh.dart';
import 'package:field_colector/features/records/utils/record_display_format.dart';
import 'package:field_colector/features/records/widgets/record_module_section.dart';
import 'package:field_colector/features/records/widgets/record_photos_section.dart';
import 'package:field_colector/features/records/widgets/sync_badge.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/widgets/detail_field.dart';
import 'package:field_colector/features/utilities/widgets/detail_section_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

/// Detalle de auditoría de un registro de campo (solo lectura).
class RecordDetailScreen extends StatefulWidget {
  const RecordDetailScreen({
    super.key,
    required this.item,
    required this.onBack,
    this.onNavigateToLocation,
  });

  final RecordListItem item;
  final VoidCallback onBack;
  final ValueChanged<LatLng>? onNavigateToLocation;

  @override
  State<RecordDetailScreen> createState() => _RecordDetailScreenState();
}

class _RecordDetailScreenState extends State<RecordDetailScreen> {
  late BaseRecord _record;
  String _observerLabel = kUnknownMemberLabel;
  bool _refreshing = true;
  bool _retryingPhotos = false;

  @override
  void initState() {
    super.initState();
    _record = widget.item.record;
    WidgetsBinding.instance.addPostFrameCallback((_) => _refresh());
  }

  String get _screenTitle {
    for (final def in kFieldFormCatalog) {
      if (def.formId == widget.item.moduleFormId) return def.title;
    }
    return widget.item.typeLabel;
  }

  Future<void> _refresh() async {
    setState(() => _refreshing = true);
    try {
      final fresh = await RecordDetailRefresh.fetch(
        context,
        moduleFormId: widget.item.moduleFormId,
        recordId: widget.item.record.id,
      );
      if (!mounted) return;
      if (fresh == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registro no encontrado'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        widget.onBack();
        return;
      }

      final users = await context.read<UserCacheService>().resolveUsers(
            {fresh.userId},
          );
      final name = users[fresh.userId]?.fullName;

      setState(() {
        _record = fresh;
        _observerLabel = (name != null && name.isNotEmpty)
            ? name
            : kUnknownMemberLabel;
        _refreshing = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _refreshing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al cargar: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  bool _isRecordOwner(BuildContext context) {
    final currentUserId = context.read<Authprovider>().user?.id ?? '';
    return currentUserId.isNotEmpty && currentUserId == _record.userId;
  }

  /// Solo fotos del autor que aún requieren subida desde este dispositivo.
  bool _photoNeedsUpload(Photo photo) {
    if (photo.syncStatus == 'synced' && photo.storageUrl.trim().isNotEmpty) {
      return false;
    }
    if (photo.syncStatus == 'error') {
      final path = photo.localPath.trim();
      return path.isNotEmpty && File(path).existsSync();
    }
    if (photo.syncStatus == 'pending') {
      final path = photo.localPath.trim();
      return path.isNotEmpty && File(path).existsSync();
    }
    return false;
  }

  bool _showPhotoRetryButton(BuildContext context) {
    if (!_isRecordOwner(context)) return false;
    final photos = RecordModuleSection.photosFor(_record);
    return photos.any(_photoNeedsUpload);
  }

  void _navigateToRecordLocation() {
    final c = _record.coordinates;
    if (!isValidLatLng(c.latitude, c.longitude)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Coordenadas no disponibles'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    widget.onNavigateToLocation?.call(LatLng(c.latitude, c.longitude));
  }

  Future<void> _retryPhotos() async {
    if (_retryingPhotos) return;
    setState(() => _retryingPhotos = true);
    try {
      final result = await context.read<SyncPort>().syncPendingData();
      if (!mounted) return;
      await _refresh();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result.failed == 0
                ? 'Fotos sincronizadas'
                : '${result.synced} ok, ${result.failed} fallaron',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al sincronizar fotos: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _retryingPhotos = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy HH:mm', 'es');
    final photos = RecordModuleSection.photosFor(_record);

    return Column(
      children: [
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
                  _screenTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SyncBadge(status: _record.syncStatus),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: _refreshing
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailSectionTitle('Metadatos'),
                      const SizedBox(height: 8),
                      DetailField(label: 'ID', value: _record.id),
                      DetailField(
                        label: 'Fecha registro',
                        value: dateFormat.format(_record.recordedAt),
                      ),
                      DetailField(label: 'Observador', value: _observerLabel),
                      DetailField(
                        label: 'Sincronización',
                        value: _record.syncStatus,
                      ),
                      const SizedBox(height: 16),
                      DetailSectionTitle('Ubicación'),
                      const SizedBox(height: 8),
                      DetailField(label: 'Departamento', value: _record.department),
                      DetailField(label: 'Municipio', value: _record.municipality),
                      DetailField(label: 'Vereda', value: _record.village),
                      DetailField(label: 'Sector', value: _record.sector),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DetailField(
                              label: 'Coordenadas',
                              value: RecordDisplayFormat.formatCoordinate(
                                _record.coordinates,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: widget.onNavigateToLocation != null
                                ? _navigateToRecordLocation
                                : null,
                            icon: const Icon(Icons.map_outlined, size: 20),
                            tooltip: 'Ver en mapa',
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 36,
                              minHeight: 36,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DetailSectionTitle('Datos del módulo'),
                      const SizedBox(height: 8),
                      RecordModuleSection(
                        moduleFormId: widget.item.moduleFormId,
                        record: _record,
                      ),
                      if (photos.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        RecordPhotosSection(photos: photos),
                        if (_showPhotoRetryButton(context)) ...[
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed:
                                _retryingPhotos ? null : () => unawaited(_retryPhotos()),
                            icon: _retryingPhotos
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.cloud_upload_outlined, size: 18),
                            label: Text(
                              _retryingPhotos
                                  ? 'Reintentando fotos…'
                                  : 'Reintentar subida de fotos',
                            ),
                          ),
                        ],
                      ],
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
