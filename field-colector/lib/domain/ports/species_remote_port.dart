import '../entities/species.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SpeciesRemotePort {
  Future<void> saveSpecies(Species item);
  Future<void> updateSpecies(String id, Map<String, dynamic> data);
  Future<void> deleteSpecies(String id);
  Future<Species?> getSpeciesById(String id);
  Future<SpeciesSearchResult> getSpeciess({int limit = 20, DocumentSnapshot? lastDocument});
}

class SpeciesSearchResult {
  final List<Species> items;
  final DocumentSnapshot? lastDocument;

  SpeciesSearchResult({required this.items, this.lastDocument});
}
