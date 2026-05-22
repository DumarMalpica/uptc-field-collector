import 'base_record.dart';

class SocialRecord extends BaseRecord {
  final String respondentId;
  final String actorName;
  final String actorType;
  final double age;
  final String gender;
  final String educationLevel;
  final String mainActivity;
  final double timeInTerritory;
  final String? locationMunicipality;
  final String? locationVillage;
  final String naturalResourceDependency;
  final String coverageChangePerception;
  final String? observedChangeType;
  final String organizationParticipation;
  final String? organizationName;
  final String actorInteractionFrequency;
  final String? connectedKeyActors;
  final String relationshipType;
  final String trustLevel;
  final String environmentalInfoAccess;
  final String? technologyUse;
  final String territorialConnectivity;
  final String fragmentationPerception;
  final String productivePracticeChanges;
  final String? practiceType;
  final String perceivedLandscapeImpact;
  final String? observations;

  SocialRecord({
    required super.id,
    required super.outingId,
    required super.userId,
    required super.recordedAt,
    required super.coordinates,
    required super.department,
    required super.municipality,
    required super.village,
    required super.sector,
    required super.syncStatus,
    required this.respondentId,
    required this.actorName,
    required this.actorType,
    required this.age,
    required this.gender,
    required this.educationLevel,
    required this.mainActivity,
    required this.timeInTerritory,
    this.locationMunicipality,
    this.locationVillage,
    required this.naturalResourceDependency,
    required this.coverageChangePerception,
    this.observedChangeType,
    required this.organizationParticipation,
    this.organizationName,
    required this.actorInteractionFrequency,
    this.connectedKeyActors,
    required this.relationshipType,
    required this.trustLevel,
    required this.environmentalInfoAccess,
    this.technologyUse,
    required this.territorialConnectivity,
    required this.fragmentationPerception,
    required this.productivePracticeChanges,
    this.practiceType,
    required this.perceivedLandscapeImpact,
    this.observations,
  });
}
