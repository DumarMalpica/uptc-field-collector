import 'package:field_colector/domain/entities/social_record.dart';
import 'package:field_colector/domain/ports/photo_local_port.dart';

/// Completa registros sociales con fotos almacenadas en [PhotoLocalPort].
class RecordPhotoEnrichment {
  RecordPhotoEnrichment._();

  static Future<SocialRecord> socialWithPhotos(
    SocialRecord record,
    PhotoLocalPort photoLocal,
  ) async {
    if (record.photos.isNotEmpty) return record;
    final photos = await photoLocal.getPhotosByRecord(record.id);
    if (photos.isEmpty) return record;
    return SocialRecord(
      id: record.id,
      outingId: record.outingId,
      userId: record.userId,
      recordedAt: record.recordedAt,
      coordinates: record.coordinates,
      department: record.department,
      municipality: record.municipality,
      village: record.village,
      sector: record.sector,
      syncStatus: record.syncStatus,
      respondentId: record.respondentId,
      actorName: record.actorName,
      actorType: record.actorType,
      age: record.age,
      gender: record.gender,
      educationLevel: record.educationLevel,
      mainActivity: record.mainActivity,
      timeInTerritory: record.timeInTerritory,
      locationMunicipality: record.locationMunicipality,
      locationVillage: record.locationVillage,
      naturalResourceDependency: record.naturalResourceDependency,
      coverageChangePerception: record.coverageChangePerception,
      observedChangeType: record.observedChangeType,
      organizationParticipation: record.organizationParticipation,
      organizationName: record.organizationName,
      actorInteractionFrequency: record.actorInteractionFrequency,
      connectedKeyActors: record.connectedKeyActors,
      relationshipType: record.relationshipType,
      trustLevel: record.trustLevel,
      environmentalInfoAccess: record.environmentalInfoAccess,
      technologyUse: record.technologyUse,
      territorialConnectivity: record.territorialConnectivity,
      fragmentationPerception: record.fragmentationPerception,
      productivePracticeChanges: record.productivePracticeChanges,
      practiceType: record.practiceType,
      perceivedLandscapeImpact: record.perceivedLandscapeImpact,
      observations: record.observations,
      photos: photos,
    );
  }
}
