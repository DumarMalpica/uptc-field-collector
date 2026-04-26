// lib/core/map_downloader/domain/entities/offline_area.dart

enum AreaDownloadStatus { pending, downloading, completed, failed }

class OfflineArea {
  final String id;
  final String name; // Ej: "Transecto Biológico Zona A", "Punto Geológico Sur"
  final double centerLat;
  final double centerLon;
  final double radiusInKilometers;
  final int minZoom;
  final int maxZoom;
  final AreaDownloadStatus status;
  final DateTime createdAt;
  final int estimatedSizeInBytes;

  const OfflineArea({
    required this.id,
    required this.name,
    required this.centerLat,
    required this.centerLon,
    required this.radiusInKilometers,
    required this.minZoom,
    required this.maxZoom,
    required this.status,
    required this.createdAt,
    this.estimatedSizeInBytes = 0,
  });

  // copyWith permite generar nuevas instancias actualizadas (ej. cambiar el status)
  // sin mutar el objeto original, respetando el diseño del dominio.
  OfflineArea copyWith({
    String? id,
    String? name,
    double? centerLat,
    double? centerLon,
    double? radiusInKilometers,
    int? minZoom,
    int? maxZoom,
    AreaDownloadStatus? status,
    DateTime? createdAt,
    int? estimatedSizeInBytes,
  }) {
    return OfflineArea(
      id: id ?? this.id,
      name: name ?? this.name,
      centerLat: centerLat ?? this.centerLat,
      centerLon: centerLon ?? this.centerLon,
      radiusInKilometers: radiusInKilometers ?? this.radiusInKilometers,
      minZoom: minZoom ?? this.minZoom,
      maxZoom: maxZoom ?? this.maxZoom,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      estimatedSizeInBytes: estimatedSizeInBytes ?? this.estimatedSizeInBytes,
    );
  }
}
