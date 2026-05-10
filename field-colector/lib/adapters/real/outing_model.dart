import 'package:isar/isar.dart';
import '../../domain/entities/outing.dart';

part 'outing_model.g.dart';

/// Modelo embebido para persistir [PendingUser] dentro de [OutingModel].
///
/// Isar no persiste clases de dominio directamente; este modelo actúa como
/// capa de traducción sin contaminar la entidad pura.
@embedded
class PendingUserModel {
  String id = '';
  String name = '';
  String email = '';

  PendingUser toDomain() => PendingUser(id: id, name: name, email: email);

  static PendingUserModel fromDomain(PendingUser u) => PendingUserModel()
    ..id = u.id
    ..name = u.name
    ..email = u.email;
}

/// Modelo de persistencia Isar para [Outing].
///
/// Separa la entidad pura de dominio del modelo de base de datos.
/// Solo este archivo y sus adaptadores conocen Isar.
@Collection()
class OutingModel {
  Id id = Isar.autoIncrement;

  /// ID de Firebase — clave de búsqueda principal.
  @Index(unique: true)
  late String outingId;

  late String prefix;
  late String name;
  late String location;
  late String zone;
  late String reason;
  late double latitude;
  late double longitude;
  late double altitude;
  late DateTime startDate;
  late DateTime endDate;
  late String createdById;
  late List<String> participantIds;
  late String status;
  late String syncStatus;
  late List<PendingUserModel> pendingUsers;

  Outing toDomain() => Outing(
        id: outingId,
        prefix: prefix,
        name: name,
        location: location,
        zone: zone,
        reason: reason,
        latitude: latitude,
        longitude: longitude,
        altitude: altitude,
        startDate: startDate,
        endDate: endDate,
        createdById: createdById,
        participantIds: List<String>.from(participantIds),
        status: status,
        syncStatus: syncStatus,
        pendingUsers: pendingUsers.map((m) => m.toDomain()).toList(),
      );

  static OutingModel fromDomain(Outing o) => OutingModel()
    ..outingId = o.id
    ..prefix = o.prefix
    ..name = o.name
    ..location = o.location
    ..zone = o.zone
    ..reason = o.reason
    ..latitude = o.latitude
    ..longitude = o.longitude
    ..altitude = o.altitude
    ..startDate = o.startDate
    ..endDate = o.endDate
    ..createdById = o.createdById
    ..participantIds = List<String>.from(o.participantIds)
    ..status = o.status
    ..syncStatus = o.syncStatus
    ..pendingUsers =
        o.pendingUsers.map(PendingUserModel.fromDomain).toList();
}
