import 'package:isar/isar.dart';
import '../../domain/entities/coordinate.dart';
import '../../domain/entities/social_record.dart';
import 'coordinate_model.dart';

part 'social_record_model.g.dart';

@Collection()
class SocialRecordModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String recordId;

  late String outingId;
  late String userId;
  late String syncStatus;
  String? firebaseId;
  late DateTime recordedAt;
  late String department;
  late String municipality;
  late String village;
  late String sector;

  CoordinateModel? coordinates;

  late String respondentId;
  late String actorName;
  late String actorType;
  late double age;
  late String gender;
  late String educationLevel;
  late String mainActivity;
  late double timeInTerritory;
  String? locationMunicipality;
  String? locationVillage;
  late String naturalResourceDependency;
  late String coverageChangePerception;
  String? observedChangeType;
  late String organizationParticipation;
  String? organizationName;
  late String actorInteractionFrequency;
  String? connectedKeyActors;
  late String relationshipType;
  late String trustLevel;
  late String environmentalInfoAccess;
  String? technologyUse;
  late String territorialConnectivity;
  late String fragmentationPerception;
  late String productivePracticeChanges;
  String? practiceType;
  late String perceivedLandscapeImpact;
  String? observations;

  SocialRecord toDomain() => SocialRecord(
        id: recordId,
        outingId: outingId,
        userId: userId,
        recordedAt: recordedAt,
        coordinates: coordinates?.toDomain() ??
            Coordinate(
              latitude: 0,
              longitude: 0,
              altitude: 0,
              gpsAccuracy: 0,
              manuallyEdited: false,
            ),
        department: department,
        municipality: municipality,
        village: village,
        sector: sector,
        syncStatus: syncStatus,
        respondentId: respondentId,
        actorName: actorName,
        actorType: actorType,
        age: age,
        gender: gender,
        educationLevel: educationLevel,
        mainActivity: mainActivity,
        timeInTerritory: timeInTerritory,
        locationMunicipality: locationMunicipality,
        locationVillage: locationVillage,
        naturalResourceDependency: naturalResourceDependency,
        coverageChangePerception: coverageChangePerception,
        observedChangeType: observedChangeType,
        organizationParticipation: organizationParticipation,
        organizationName: organizationName,
        actorInteractionFrequency: actorInteractionFrequency,
        connectedKeyActors: connectedKeyActors,
        relationshipType: relationshipType,
        trustLevel: trustLevel,
        environmentalInfoAccess: environmentalInfoAccess,
        technologyUse: technologyUse,
        territorialConnectivity: territorialConnectivity,
        fragmentationPerception: fragmentationPerception,
        productivePracticeChanges: productivePracticeChanges,
        practiceType: practiceType,
        perceivedLandscapeImpact: perceivedLandscapeImpact,
        observations: observations,
      );

  static SocialRecordModel fromDomain(SocialRecord r) => SocialRecordModel()
    ..recordId = r.id
    ..outingId = r.outingId
    ..userId = r.userId
    ..recordedAt = r.recordedAt
    ..coordinates = CoordinateModel.fromDomain(r.coordinates)
    ..department = r.department
    ..municipality = r.municipality
    ..village = r.village
    ..sector = r.sector
    ..syncStatus = r.syncStatus
    ..respondentId = r.respondentId
    ..actorName = r.actorName
    ..actorType = r.actorType
    ..age = r.age
    ..gender = r.gender
    ..educationLevel = r.educationLevel
    ..mainActivity = r.mainActivity
    ..timeInTerritory = r.timeInTerritory
    ..locationMunicipality = r.locationMunicipality
    ..locationVillage = r.locationVillage
    ..naturalResourceDependency = r.naturalResourceDependency
    ..coverageChangePerception = r.coverageChangePerception
    ..observedChangeType = r.observedChangeType
    ..organizationParticipation = r.organizationParticipation
    ..organizationName = r.organizationName
    ..actorInteractionFrequency = r.actorInteractionFrequency
    ..connectedKeyActors = r.connectedKeyActors
    ..relationshipType = r.relationshipType
    ..trustLevel = r.trustLevel
    ..environmentalInfoAccess = r.environmentalInfoAccess
    ..technologyUse = r.technologyUse
    ..territorialConnectivity = r.territorialConnectivity
    ..fragmentationPerception = r.fragmentationPerception
    ..productivePracticeChanges = r.productivePracticeChanges
    ..practiceType = r.practiceType
    ..perceivedLandscapeImpact = r.perceivedLandscapeImpact
    ..observations = r.observations;
}
