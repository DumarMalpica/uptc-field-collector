/// Perfil embebido de usuario en una expedición (participante o solicitante).
class OutingMember {
  final String id;
  final String name;
  final String email;

  const OutingMember({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };

  factory OutingMember.fromMap(Map<String, dynamic> map) => OutingMember(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        email: map['email'] ?? '',
      );
}

/// Solicitud pendiente de unión; misma forma que [OutingMember].
typedef PendingUser = OutingMember;

class Outing {
  final String id;
  final String prefix;
  final String name;
  final String location;
  final String zone;
  final String reason;
  final double latitude;
  final double longitude;
  final double altitude;
  final DateTime startDate;
  final DateTime endDate;
  final String createdById;
  final List<String> participantIds;
  final String status;
  final String syncStatus;
  final List<OutingMember> participants;
  final List<PendingUser> pendingUsers;

  Outing({
    required this.id,
    required this.prefix,
    required this.name,
    required this.location,
    required this.zone,
    required this.reason,
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.startDate,
    required this.endDate,
    required this.createdById,
    required this.participantIds,
    required this.status,
    required this.syncStatus,
    this.participants = const [],
    this.pendingUsers = const [],
  });

  /// Dueño o participante aceptado; puede registrar en campo.
  bool isMember(String userId) =>
      createdById == userId || participantIds.contains(userId);

  OutingMember? memberById(String id) {
    for (final m in participants) {
      if (m.id == id) return m;
    }
    return null;
  }
}
