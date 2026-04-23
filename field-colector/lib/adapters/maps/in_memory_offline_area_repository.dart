import 'package:field_colector/domain/entities/offline_area.dart';
import 'package:field_colector/domain/ports/maps/offline_area_repository.dart';

/// Repositorio en memoria; sustituir por adaptador Isar cuando exista persistencia.
class InMemoryOfflineAreaRepository implements OfflineAreaRepository {
  final Map<String, OfflineArea> _byId = {};

  @override
  Future<List<OfflineArea>> getSavedAreas() async =>
      List.unmodifiable(_byId.values.toList());

  @override
  Future<void> saveAreaMetadata(OfflineArea area) async {
    _byId[area.id] = area;
  }
}
