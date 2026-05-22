import 'dart:async';

import 'package:field_colector/domain/entities/app_settings.dart';
import 'package:field_colector/domain/ports/sync_port.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/profile/providers/profile_provider.dart';
import 'package:field_colector/features/settings/providers/settings_provider.dart';
import 'package:field_colector/features/settings/widgets/settings_group.dart';
import 'package:field_colector/features/settings/widgets/settings_tile.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// Panel lateral de configuración de la app.
class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool _isSyncing = false;
  bool _hasPendingSync = false;

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
    final pending = await context.read<SyncPort>().hasPendingSync();
    if (!mounted) return;
    setState(() => _hasPendingSync = pending);
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
                    subtitle: _isSyncing
                        ? 'Sincronizando…'
                        : _hasPendingSync
                            ? 'Hay datos pendientes de subir'
                            : 'Todo sincronizado',
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
                    title: 'Contacto y soporte',
                    subtitle: settings.supportEmail,
                    onTap: () => _openSupportEmail(settings),
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
