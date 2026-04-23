import 'package:field_colector/domain/entities/offline_area.dart';

abstract class OfflineAreaRepository {
  Future<void> saveAreaMetadata(OfflineArea area);
  Future<List<OfflineArea>> getSavedAreas();
}
