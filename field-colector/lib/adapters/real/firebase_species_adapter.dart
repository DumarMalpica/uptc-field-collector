import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/species.dart';
import '../../domain/ports/species_remote_port.dart';

class FirebaseSpeciesAdapter implements SpeciesRemotePort {
  final FirebaseFirestore _firestore;
  final String _collection = 'speciess';

  FirebaseSpeciesAdapter(this._firestore);

  @override
  Future<void> saveSpecies(Species item) async {
    await _firestore.collection(_collection).doc(item.id).set({
      'scientificName': item.scientificName,
      'commonName': item.commonName,
      'branch': item.branch,
      'source': item.source,
      'createdById': item.createdById,
    });
  }

  @override
  Future<void> updateSpecies(String id, Map<String, dynamic> data) async {
    await _firestore.collection(_collection).doc(id).update(data);
  }

  @override
  Future<void> deleteSpecies(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  @override
  Future<Species?> getSpeciesById(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return _mapSnapshotToSpecies(doc);
  }

  @override
  Future<SpeciesSearchResult> getSpeciess({
    int limit = 20,
    DocumentSnapshot? lastDocument,
  }) async {
    Query query = _firestore.collection(_collection).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final snapshot = await query.get();

    return SpeciesSearchResult(
      items: snapshot.docs.map((doc) => _mapSnapshotToSpecies(doc)).toList(),
      lastDocument: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  Species _mapSnapshotToSpecies(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Species(
      id: doc.id,
      scientificName: data['scientificName'] ?? '',
      commonName: data['commonName'] ?? '',
      branch: data['branch'] ?? '',
      source: data['source'] ?? '',
      createdById: data['createdById'] ?? '',
    );
  }
}
