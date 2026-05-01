class PendingUser {
  final String id;
  final String name;
  final String email;

  PendingUser({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory PendingUser.fromMap(Map<String, dynamic> map) {
    return PendingUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

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
    this.pendingUsers = const [],
  });
}
