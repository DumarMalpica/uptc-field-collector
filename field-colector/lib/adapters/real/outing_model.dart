import 'package:isar/isar.dart';
import '../../domain/entities/outing.dart';

part 'outing_model.g.dart';

/// Modelo embebido para persistir [OutingMember] dentro de [OutingModel].
@embedded
class OutingMemberModel {
  String id = '';
  String name = '';
  String email = '';

  OutingMember toDomain() => OutingMember(id: id, name: name, email: email);

  static OutingMemberModel fromDomain(OutingMember m) => OutingMemberModel()
    ..id = m.id
    ..name = m.name
    ..email = m.email;
}

/// Alias para compatibilidad con código que referencia PendingUserModel.
typedef PendingUserModel = OutingMemberModel;

/// Modelo de persistencia Isar para [Outing].
@Collection()
class OutingModel {
  Id id = Isar.autoIncrement;

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
  late List<OutingMemberModel> participants;
  late List<OutingMemberModel> pendingUsers;

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
        participants: participants.map((m) => m.toDomain()).toList(),
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
    ..participants = o.participants.map(OutingMemberModel.fromDomain).toList()
    ..pendingUsers = o.pendingUsers.map(OutingMemberModel.fromDomain).toList();
}
