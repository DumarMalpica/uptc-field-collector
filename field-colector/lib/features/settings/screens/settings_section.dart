import 'dart:async';

import 'package:field_colector/domain/entities/app_settings.dart';
import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/domain/entities/user.dart';
import 'package:field_colector/domain/ports/outing_local_port.dart';
import 'package:field_colector/domain/ports/sync_port.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/export/providers/export_provider.dart';
import 'package:field_colector/features/profile/providers/profile_provider.dart';
import 'package:field_colector/features/settings/providers/settings_provider.dart';
import 'package:field_colector/features/settings/widgets/about_acknowledgments_dialog.dart';
import 'package:field_colector/features/settings/widgets/settings_group.dart';
import 'package:field_colector/features/settings/widgets/settings_tile.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:field_colector/features/manual/manual_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum _ExportScopeMode { all, myRecords, byOuting }

class _ExportSheetResult {
  const _ExportSheetResult({
    this.outingId,
    this.userId,
    this.startDate,
    this.endDate,
    required this.fileNamePrefix,
  });

  final String? outingId;
  final String? userId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String fileNamePrefix;
}

/// Panel lateral de configuración de la app.
class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool _isSyncing = false;
  SyncPendingSummary? _pendingSummary;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(context.read<SettingsProvider>().refreshStorageSummary());
      unawaited(_refreshPendingSyncStatus());
    });
  }

  Future<void> _refreshPendingSyncStatus() async {
    final sync = context.read<SyncPort>();
    final summary = await sync.getPendingSummary();
    if (!mounted) return;
    setState(() => _pendingSummary = summary);
  }

  String _syncSubtitle() {
    if (_isSyncing) return 'Sincronizando…';
    final summary = _pendingSummary;
    if (summary == null || !summary.hasPending) {
      return 'Todo sincronizado';
    }
    final parts = <String>[];
    if (summary.pendingOutings > 0) {
      parts.add('${summary.pendingOutings} expedición(es)');
    }
    if (summary.pendingRecords > 0) {
      parts.add('${summary.pendingRecords} registro(s)');
    }
    if (summary.pendingPhotos > 0) {
      parts.add('${summary.pendingPhotos} foto(s)');
    }
    return 'Pendiente: ${parts.join(' · ')}';
  }

  Future<void> _showExportSheet() async {
    final authUser = context.read<Authprovider>().user;
    final outings = await context.read<OutingLocalPort>().getAllOutings();
    outings.sort(
      (a, b) => _ExportDataSheet.outingLabel(a).compareTo(
            _ExportDataSheet.outingLabel(b),
          ),
    );

    if (!mounted) return;

    final result = await showModalBottomSheet<_ExportSheetResult>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => _ExportDataSheet(
        authUser: authUser,
        outings: outings,
      ),
    );

    if (result == null || !mounted) return;

    final export = context.read<ExportProvider>();
    final ok = await export.export(
      outingId: result.outingId,
      userId: result.userId,
      startDate: result.startDate,
      endDate: result.endDate,
      fileNamePrefix: result.fileNamePrefix,
    );
    if (!mounted) return;
    if (!ok && export.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(export.errorMessage!)),
      );
    }
  }

  Future<void> _syncNow() async {
    if (_isSyncing) return;
    setState(() => _isSyncing = true);
    try {
      final result = await context.read<SyncPort>().syncPendingData();
      if (!mounted) return;
      final message = result.failed == 0
          ? '${result.synced} elemento(s) sincronizado(s)'
          : '${result.synced} sincronizados, ${result.failed} fallaron';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al sincronizar: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSyncing = false);
        unawaited(_refreshPendingSyncStatus());
      }
    }
  }

  Future<void> _pickFromList<T>({
    required String title,
    required List<T> options,
    required String Function(T) label,
    required T current,
    required Future<void> Function(T) onSelected,
  }) async {
    final picked = await showModalBottomSheet<T>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(title, style: AppStyles.subtitle),
            ),
            for (final option in options)
              ListTile(
                title: Text(label(option)),
                trailing: option == current
                    ? Icon(Icons.check, color: AppColors.primary)
                    : null,
                onTap: () => Navigator.of(ctx).pop(option),
              ),
          ],
        ),
      ),
    );
    if (picked == null || !mounted) return;
    await onSelected(picked);
  }

  Future<void> _confirmClearMapTiles(SettingsProvider settings) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Borrar mapas en caché'),
        content: const Text(
          'Se eliminarán las teselas descargadas. Necesitarás conexión para volver a ver mapas offline.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Borrar'),
          ),
        ],
      ),
    );
    if (go == true && mounted) {
      await settings.clearMapTileCache();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Caché de mapas borrada')),
      );
    }
  }

  Future<void> _confirmClearDrafts(SettingsProvider settings) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Borrar borradores'),
        content: const Text(
          'Se eliminarán todos los borradores de formularios guardados en este dispositivo.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Borrar'),
          ),
        ],
      ),
    );
    if (go == true && mounted) {
      await settings.clearAllFormDrafts();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Borradores eliminados')),
      );
    }
  }

  Future<void> _confirmLogout() async {
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Deseas cerrar sesión en este dispositivo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
    if (go == true && mounted) {
      await context.read<ProfileProvider>().logout();
    }
  }

  Future<void> _openSupportEmail(SettingsProvider settings) async {
    final uri = Uri(
      scheme: 'mailto',
      path: settings.supportEmail,
      queryParameters: const {'subject': 'Soporte Citesa Field Colector'},
    );
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir: ${settings.supportEmail}')),
      );
    }
  }

  static const _intervalOptions = [10, 22, 45, 60];
  static const _zoomOptions = [12.0, 15.0, 17.0, 19.0];

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final auth = context.watch<Authprovider>();
    final export = context.watch<ExportProvider>();
    final user = auth.user;

    if (settings.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final pkg = settings.packageInfo;
    final versionLabel = pkg == null
        ? '—'
        : '${pkg.version} (${pkg.buildNumber})';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(
            'Configuración',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              SettingsGroup(
                title: 'GPS y ubicación',
                icon: PhosphorIconsRegular.crosshair,
                children: [
                  SettingsTile.dropdown(
                    title: 'Precisión GPS',
                    subtitle: 'Mayor precisión consume más batería',
                    value: settings.gpsAccuracy.label,
                    enabled: !settings.isBusy,
                    onTap: () => _pickFromList<GpsAccuracyLevel>(
                      title: 'Precisión GPS',
                      options: GpsAccuracyLevel.values,
                      label: (e) => e.label,
                      current: settings.gpsAccuracy,
                      onSelected: settings.setGpsAccuracy,
                    ),
                  ),
                  SettingsTile.dropdown(
                    title: 'Intervalo de actualización',
                    subtitle: 'Frecuencia del seguimiento en mapa',
                    value: '${settings.locationUpdateIntervalSeconds} s',
                    enabled: !settings.isBusy,
                    onTap: () => _pickFromList<int>(
                      title: 'Intervalo de actualización',
                      options: _intervalOptions,
                      label: (s) => '$s segundos',
                      current: settings.locationUpdateIntervalSeconds,
                      onSelected: settings.setLocationUpdateIntervalSeconds,
                    ),
                  ),
                  SettingsTile.dropdown(
                    title: 'Formato de coordenadas',
                    value: settings.coordinateFormat.label,
                    enabled: !settings.isBusy,
                    onTap: () => _pickFromList<CoordinateFormat>(
                      title: 'Formato de coordenadas',
                      options: CoordinateFormat.values,
                      label: (e) => e.label,
                      current: settings.coordinateFormat,
                      onSelected: settings.setCoordinateFormat,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingsGroup(
                title: 'Mapa',
                icon: PhosphorIconsRegular.mapTrifold,
                children: [
                  SettingsTile.dropdown(
                    title: 'Zoom inicial',
                    value: settings.defaultZoom.toStringAsFixed(0),
                    enabled: !settings.isBusy,
                    onTap: () => _pickFromList<double>(
                      title: 'Zoom inicial',
                      options: _zoomOptions,
                      label: (z) => z.toStringAsFixed(0),
                      current: settings.defaultZoom,
                      onSelected: settings.setDefaultZoom,
                    ),
                  ),
                  SettingsTile.toggle(
                    title: 'Mostrar mi ubicación',
                    value: settings.showLocationMarker,
                    enabled: !settings.isBusy,
                    onChanged: settings.setShowLocationMarker,
                  ),
                  SettingsTile.dropdown(
                    title: 'Tipo de mapa',
                    subtitle: 'Capa base cuando hay conexión',
                    value: settings.mapType.label,
                    enabled: !settings.isBusy,
                    onTap: () => _pickFromList<MapDisplayType>(
                      title: 'Tipo de mapa',
                      options: MapDisplayType.values,
                      label: (e) => e.label,
                      current: settings.mapType,
                      onSelected: settings.setMapType,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingsGroup(
                title: 'Datos',
                icon: PhosphorIconsRegular.cloudArrowUp,
                children: [
                  SettingsTile.action(
                    title: 'Sincronizar ahora',
                    subtitle: _syncSubtitle(),
                    enabled: !_isSyncing && !settings.isBusy,
                    trailing: _isSyncing
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : null,
                    onTap: _syncNow,
                  ),
                  SettingsTile.action(
                    title: 'Exportar datos',
                    subtitle: 'Excel personalizado (alcance y fechas)',
                    enabled: !export.isExporting && !settings.isBusy,
                    trailing: export.isExporting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            PhosphorIconsRegular.fileXls,
                            color: AppColors.primary,
                            size: 20,
                          ),
                    onTap: export.isExporting ? null : _showExportSheet,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingsGroup(
                title: 'Almacenamiento',
                icon: PhosphorIconsRegular.hardDrives,
                children: [
                  SettingsTile.info(
                    title: 'Uso local',
                    subtitle: settings.storageSummary ?? 'Calculando…',
                  ),
                  SettingsTile.action(
                    title: 'Borrar mapas en caché',
                    subtitle: 'Teselas offline descargadas',
                    enabled: !settings.isBusy,
                    onTap: () => _confirmClearMapTiles(settings),
                  ),
                  SettingsTile.action(
                    title: 'Borrar borradores de formularios',
                    enabled: !settings.isBusy,
                    onTap: () => _confirmClearDrafts(settings),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingsGroup(
                title: 'Cuenta',
                icon: PhosphorIconsRegular.user,
                children: [
                  if (user != null) ...[
                    SettingsTile.info(
                      title: 'Nombre',
                      subtitle: user.fullName,
                    ),
                    SettingsTile.info(
                      title: 'Correo',
                      subtitle: user.email,
                    ),
                    SettingsTile.info(
                      title: 'Rol',
                      subtitle: user.role.name,
                    ),
                  ] else
                    const SettingsTile.info(
                      title: 'Sesión',
                      subtitle: 'Sin sesión activa',
                    ),
                  SettingsTile.action(
                    title: 'Cerrar sesión',
                    trailing: Icon(
                      PhosphorIconsRegular.signOut,
                      color: AppColors.error,
                      size: 20,
                    ),
                    onTap: user == null ? null : _confirmLogout,
                  ),
                ],
              ),
              SettingsGroup(
                title: 'Ayuda y soporte',
                icon: PhosphorIconsRegular.question,
                children: [
                  SettingsTile.action(
                    title: 'Manual de usuario',
                    subtitle: 'Guía de uso e instrucciones de la app',
                    onTap: () => openUserManual(context),
                  ),
                  SettingsTile.action(
                    title: 'Contacto y soporte',
                    subtitle: settings.supportEmail,
                    onTap: () => _openSupportEmail(settings),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SettingsGroup(
                title: 'Acerca de',
                icon: PhosphorIconsRegular.info,
                children: [
                  SettingsTile.info(
                    title: 'Versión',
                    subtitle: versionLabel,
                  ),
                  SettingsTile.action(
                    title: 'Agradecimientos',
                    subtitle: 'Participantes y equipo de desarrollo',
                    trailing: Icon(
                      PhosphorIconsRegular.heart,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onTap: () => AboutAcknowledgmentsDialog.show(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Bottom sheet export UI. State in [State] so modal route rebuild no wipe dates.
class _ExportDataSheet extends StatefulWidget {
  const _ExportDataSheet({
    required this.authUser,
    required this.outings,
  });

  final User? authUser;
  final List<Outing> outings;

  static String outingLabel(Outing outing) {
    if (outing.prefix.isNotEmpty) {
      return '${outing.prefix} · ${outing.name}';
    }
    return outing.name;
  }

  static String outingFilePrefix(Outing outing) {
    if (outing.prefix.isNotEmpty) return outing.prefix;
    return outing.name;
  }

  @override
  State<_ExportDataSheet> createState() => _ExportDataSheetState();
}

class _ExportDataSheetState extends State<_ExportDataSheet> {
  _ExportScopeMode _scopeMode = _ExportScopeMode.all;
  String? _selectedOutingId;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _sheetError;

  Future<void> _pickDate({required bool isStart}) async {
    final initial = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('es'),
    );
    if (picked == null || !mounted) return;
    setState(() {
      _sheetError = null;
      if (isStart) {
        _startDate = picked;
        if (_endDate != null && _endDate!.isBefore(picked)) {
          _endDate = picked;
        }
      } else {
        _endDate = picked;
      }
    });
  }

  void _submit() {
    if (_scopeMode == _ExportScopeMode.byOuting && _selectedOutingId == null) {
      setState(() => _sheetError = 'Selecciona una expedición');
      return;
    }
    if (_scopeMode == _ExportScopeMode.myRecords && widget.authUser == null) {
      setState(() => _sheetError = 'Inicia sesión para exportar tus registros');
      return;
    }

    String fileNamePrefix;
    String? outingId;
    String? userId;

    switch (_scopeMode) {
      case _ExportScopeMode.all:
        fileNamePrefix = 'citesa_export';
      case _ExportScopeMode.myRecords:
        fileNamePrefix = 'mis_registros';
        userId = widget.authUser!.id;
      case _ExportScopeMode.byOuting:
        final outing = widget.outings.firstWhere(
          (o) => o.id == _selectedOutingId,
        );
        outingId = outing.id;
        fileNamePrefix = _ExportDataSheet.outingFilePrefix(outing);
    }

    Navigator.of(context).pop(
      _ExportSheetResult(
        outingId: outingId,
        userId: userId,
        startDate: _startDate,
        endDate: _endDate,
        fileNamePrefix: fileNamePrefix,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'es');
    final canUseMyRecords = widget.authUser != null;
    final outings = widget.outings;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          8,
          16,
          16 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Exportar datos', style: AppStyles.subtitle),
              const SizedBox(height: 8),
              Text(
                'Excel con todos los módulos. Elige alcance y, si quieres, un rango de fechas.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Alcance',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Todos'),
                    selected: _scopeMode == _ExportScopeMode.all,
                    onSelected: (_) => setState(() {
                      _sheetError = null;
                      _scopeMode = _ExportScopeMode.all;
                    }),
                  ),
                  ChoiceChip(
                    label: const Text('Mis registros'),
                    selected: _scopeMode == _ExportScopeMode.myRecords,
                    onSelected: canUseMyRecords
                        ? (_) => setState(() {
                              _sheetError = null;
                              _scopeMode = _ExportScopeMode.myRecords;
                            })
                        : null,
                  ),
                  ChoiceChip(
                    label: const Text('Por expedición'),
                    selected: _scopeMode == _ExportScopeMode.byOuting,
                    onSelected: outings.isNotEmpty
                        ? (_) => setState(() {
                              _sheetError = null;
                              _scopeMode = _ExportScopeMode.byOuting;
                              _selectedOutingId ??= outings.first.id;
                            })
                        : null,
                  ),
                ],
              ),
              if (_scopeMode == _ExportScopeMode.byOuting) ...[
                const SizedBox(height: 12),
                if (outings.isEmpty)
                  Text(
                    'No hay expediciones en el dispositivo. Sincroniza primero.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  )
                else
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: _selectedOutingId,
                    decoration: const InputDecoration(
                      labelText: 'Expedición',
                      border: OutlineInputBorder(),
                    ),
                    selectedItemBuilder: (context) => [
                      for (final outing in outings)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _ExportDataSheet.outingLabel(outing),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                    ],
                    items: [
                      for (final outing in outings)
                        DropdownMenuItem(
                          value: outing.id,
                          child: Text(
                            _ExportDataSheet.outingLabel(outing),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                    ],
                    onChanged: (value) => setState(() {
                      _sheetError = null;
                      _selectedOutingId = value;
                    }),
                  ),
              ],
              const SizedBox(height: 16),
              Text(
                'Rango de fechas (opcional)',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Desde'),
                subtitle: Text(
                  _startDate == null
                      ? 'Sin filtro'
                      : dateFormat.format(_startDate!),
                ),
                trailing: _startDate != null
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () => setState(() {
                          _sheetError = null;
                          _startDate = null;
                        }),
                      )
                    : null,
                onTap: () => _pickDate(isStart: true),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Hasta'),
                subtitle: Text(
                  _endDate == null
                      ? 'Sin filtro'
                      : dateFormat.format(_endDate!),
                ),
                trailing: _endDate != null
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () => setState(() {
                          _sheetError = null;
                          _endDate = null;
                        }),
                      )
                    : null,
                onTap: () => _pickDate(isStart: false),
              ),
              if (_sheetError != null) ...[
                const SizedBox(height: 8),
                Text(
                  _sheetError!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 13,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.file_download_outlined),
                label: const Text('Generar Excel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
