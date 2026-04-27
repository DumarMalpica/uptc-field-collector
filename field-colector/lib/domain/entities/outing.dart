class Outing {
  final String id;
  final String prefix;
  final String name;
  final String location;
  final String zone;
  final String reason;
  final DateTime startDate;
  final DateTime endDate;
  final String createdById;
  final List<String> participantIds;
  final String status;
  final String syncStatus;

  Outing({
    required this.id,
    required this.prefix,
    required this.name,
    required this.location,
    required this.zone,
    required this.reason,
    required this.startDate,
    required this.endDate,
    required this.createdById,
    required this.participantIds,
    required this.status,
    required this.syncStatus,
  });
}
