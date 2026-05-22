// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSocialRecordModelCollection on Isar {
  IsarCollection<SocialRecordModel> get socialRecordModels => this.collection();
}

const SocialRecordModelSchema = CollectionSchema(
  name: r'SocialRecordModel',
  id: 2410922485911992792,
  properties: {
    r'actorInteractionFrequency': PropertySchema(
      id: 0,
      name: r'actorInteractionFrequency',
      type: IsarType.string,
    ),
    r'actorName': PropertySchema(
      id: 1,
      name: r'actorName',
      type: IsarType.string,
    ),
    r'actorType': PropertySchema(
      id: 2,
      name: r'actorType',
      type: IsarType.string,
    ),
    r'age': PropertySchema(
      id: 3,
      name: r'age',
      type: IsarType.double,
    ),
    r'connectedKeyActors': PropertySchema(
      id: 4,
      name: r'connectedKeyActors',
      type: IsarType.string,
    ),
    r'coordinates': PropertySchema(
      id: 5,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'coverageChangePerception': PropertySchema(
      id: 6,
      name: r'coverageChangePerception',
      type: IsarType.string,
    ),
    r'department': PropertySchema(
      id: 7,
      name: r'department',
      type: IsarType.string,
    ),
    r'educationLevel': PropertySchema(
      id: 8,
      name: r'educationLevel',
      type: IsarType.string,
    ),
    r'environmentalInfoAccess': PropertySchema(
      id: 9,
      name: r'environmentalInfoAccess',
      type: IsarType.string,
    ),
    r'firebaseId': PropertySchema(
      id: 10,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'fragmentationPerception': PropertySchema(
      id: 11,
      name: r'fragmentationPerception',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 12,
      name: r'gender',
      type: IsarType.string,
    ),
    r'locationMunicipality': PropertySchema(
      id: 13,
      name: r'locationMunicipality',
      type: IsarType.string,
    ),
    r'locationVillage': PropertySchema(
      id: 14,
      name: r'locationVillage',
      type: IsarType.string,
    ),
    r'mainActivity': PropertySchema(
      id: 15,
      name: r'mainActivity',
      type: IsarType.string,
    ),
    r'municipality': PropertySchema(
      id: 16,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'naturalResourceDependency': PropertySchema(
      id: 17,
      name: r'naturalResourceDependency',
      type: IsarType.string,
    ),
    r'observations': PropertySchema(
      id: 18,
      name: r'observations',
      type: IsarType.string,
    ),
    r'observedChangeType': PropertySchema(
      id: 19,
      name: r'observedChangeType',
      type: IsarType.string,
    ),
    r'organizationName': PropertySchema(
      id: 20,
      name: r'organizationName',
      type: IsarType.string,
    ),
    r'organizationParticipation': PropertySchema(
      id: 21,
      name: r'organizationParticipation',
      type: IsarType.string,
    ),
    r'outingId': PropertySchema(
      id: 22,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'perceivedLandscapeImpact': PropertySchema(
      id: 23,
      name: r'perceivedLandscapeImpact',
      type: IsarType.string,
    ),
    r'practiceType': PropertySchema(
      id: 24,
      name: r'practiceType',
      type: IsarType.string,
    ),
    r'productivePracticeChanges': PropertySchema(
      id: 25,
      name: r'productivePracticeChanges',
      type: IsarType.string,
    ),
    r'recordId': PropertySchema(
      id: 26,
      name: r'recordId',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 27,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'relationshipType': PropertySchema(
      id: 28,
      name: r'relationshipType',
      type: IsarType.string,
    ),
    r'respondentId': PropertySchema(
      id: 29,
      name: r'respondentId',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 30,
      name: r'sector',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 31,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'technologyUse': PropertySchema(
      id: 32,
      name: r'technologyUse',
      type: IsarType.string,
    ),
    r'territorialConnectivity': PropertySchema(
      id: 33,
      name: r'territorialConnectivity',
      type: IsarType.string,
    ),
    r'timeInTerritory': PropertySchema(
      id: 34,
      name: r'timeInTerritory',
      type: IsarType.double,
    ),
    r'trustLevel': PropertySchema(
      id: 35,
      name: r'trustLevel',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 36,
      name: r'userId',
      type: IsarType.string,
    ),
    r'village': PropertySchema(
      id: 37,
      name: r'village',
      type: IsarType.string,
    )
  },
  estimateSize: _socialRecordModelEstimateSize,
  serialize: _socialRecordModelSerialize,
  deserialize: _socialRecordModelDeserialize,
  deserializeProp: _socialRecordModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'recordId': IndexSchema(
      id: 907839981883940929,
      name: r'recordId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recordId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'CoordinateModel': CoordinateModelSchema},
  getId: _socialRecordModelGetId,
  getLinks: _socialRecordModelGetLinks,
  attach: _socialRecordModelAttach,
  version: '3.1.0+1',
);

int _socialRecordModelEstimateSize(
  SocialRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.actorInteractionFrequency.length * 3;
  bytesCount += 3 + object.actorName.length * 3;
  bytesCount += 3 + object.actorType.length * 3;
  {
    final value = object.connectedKeyActors;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coordinates;
    if (value != null) {
      bytesCount += 3 +
          CoordinateModelSchema.estimateSize(
              value, allOffsets[CoordinateModel]!, allOffsets);
    }
  }
  bytesCount += 3 + object.coverageChangePerception.length * 3;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.educationLevel.length * 3;
  bytesCount += 3 + object.environmentalInfoAccess.length * 3;
  {
    final value = object.firebaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fragmentationPerception.length * 3;
  bytesCount += 3 + object.gender.length * 3;
  {
    final value = object.locationMunicipality;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationVillage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.mainActivity.length * 3;
  bytesCount += 3 + object.municipality.length * 3;
  bytesCount += 3 + object.naturalResourceDependency.length * 3;
  {
    final value = object.observations;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.observedChangeType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.organizationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.organizationParticipation.length * 3;
  bytesCount += 3 + object.outingId.length * 3;
  bytesCount += 3 + object.perceivedLandscapeImpact.length * 3;
  {
    final value = object.practiceType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.productivePracticeChanges.length * 3;
  bytesCount += 3 + object.recordId.length * 3;
  bytesCount += 3 + object.relationshipType.length * 3;
  bytesCount += 3 + object.respondentId.length * 3;
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  {
    final value = object.technologyUse;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.territorialConnectivity.length * 3;
  bytesCount += 3 + object.trustLevel.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.village.length * 3;
  return bytesCount;
}

void _socialRecordModelSerialize(
  SocialRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actorInteractionFrequency);
  writer.writeString(offsets[1], object.actorName);
  writer.writeString(offsets[2], object.actorType);
  writer.writeDouble(offsets[3], object.age);
  writer.writeString(offsets[4], object.connectedKeyActors);
  writer.writeObject<CoordinateModel>(
    offsets[5],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[6], object.coverageChangePerception);
  writer.writeString(offsets[7], object.department);
  writer.writeString(offsets[8], object.educationLevel);
  writer.writeString(offsets[9], object.environmentalInfoAccess);
  writer.writeString(offsets[10], object.firebaseId);
  writer.writeString(offsets[11], object.fragmentationPerception);
  writer.writeString(offsets[12], object.gender);
  writer.writeString(offsets[13], object.locationMunicipality);
  writer.writeString(offsets[14], object.locationVillage);
  writer.writeString(offsets[15], object.mainActivity);
  writer.writeString(offsets[16], object.municipality);
  writer.writeString(offsets[17], object.naturalResourceDependency);
  writer.writeString(offsets[18], object.observations);
  writer.writeString(offsets[19], object.observedChangeType);
  writer.writeString(offsets[20], object.organizationName);
  writer.writeString(offsets[21], object.organizationParticipation);
  writer.writeString(offsets[22], object.outingId);
  writer.writeString(offsets[23], object.perceivedLandscapeImpact);
  writer.writeString(offsets[24], object.practiceType);
  writer.writeString(offsets[25], object.productivePracticeChanges);
  writer.writeString(offsets[26], object.recordId);
  writer.writeDateTime(offsets[27], object.recordedAt);
  writer.writeString(offsets[28], object.relationshipType);
  writer.writeString(offsets[29], object.respondentId);
  writer.writeString(offsets[30], object.sector);
  writer.writeString(offsets[31], object.syncStatus);
  writer.writeString(offsets[32], object.technologyUse);
  writer.writeString(offsets[33], object.territorialConnectivity);
  writer.writeDouble(offsets[34], object.timeInTerritory);
  writer.writeString(offsets[35], object.trustLevel);
  writer.writeString(offsets[36], object.userId);
  writer.writeString(offsets[37], object.village);
}

SocialRecordModel _socialRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SocialRecordModel();
  object.actorInteractionFrequency = reader.readString(offsets[0]);
  object.actorName = reader.readString(offsets[1]);
  object.actorType = reader.readString(offsets[2]);
  object.age = reader.readDouble(offsets[3]);
  object.connectedKeyActors = reader.readStringOrNull(offsets[4]);
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[5],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.coverageChangePerception = reader.readString(offsets[6]);
  object.department = reader.readString(offsets[7]);
  object.educationLevel = reader.readString(offsets[8]);
  object.environmentalInfoAccess = reader.readString(offsets[9]);
  object.firebaseId = reader.readStringOrNull(offsets[10]);
  object.fragmentationPerception = reader.readString(offsets[11]);
  object.gender = reader.readString(offsets[12]);
  object.id = id;
  object.locationMunicipality = reader.readStringOrNull(offsets[13]);
  object.locationVillage = reader.readStringOrNull(offsets[14]);
  object.mainActivity = reader.readString(offsets[15]);
  object.municipality = reader.readString(offsets[16]);
  object.naturalResourceDependency = reader.readString(offsets[17]);
  object.observations = reader.readStringOrNull(offsets[18]);
  object.observedChangeType = reader.readStringOrNull(offsets[19]);
  object.organizationName = reader.readStringOrNull(offsets[20]);
  object.organizationParticipation = reader.readString(offsets[21]);
  object.outingId = reader.readString(offsets[22]);
  object.perceivedLandscapeImpact = reader.readString(offsets[23]);
  object.practiceType = reader.readStringOrNull(offsets[24]);
  object.productivePracticeChanges = reader.readString(offsets[25]);
  object.recordId = reader.readString(offsets[26]);
  object.recordedAt = reader.readDateTime(offsets[27]);
  object.relationshipType = reader.readString(offsets[28]);
  object.respondentId = reader.readString(offsets[29]);
  object.sector = reader.readString(offsets[30]);
  object.syncStatus = reader.readString(offsets[31]);
  object.technologyUse = reader.readStringOrNull(offsets[32]);
  object.territorialConnectivity = reader.readString(offsets[33]);
  object.timeInTerritory = reader.readDouble(offsets[34]);
  object.trustLevel = reader.readString(offsets[35]);
  object.userId = reader.readString(offsets[36]);
  object.village = reader.readString(offsets[37]);
  return object;
}

P _socialRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<CoordinateModel>(
        offset,
        CoordinateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readDateTime(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readString(offset)) as P;
    case 34:
      return (reader.readDouble(offset)) as P;
    case 35:
      return (reader.readString(offset)) as P;
    case 36:
      return (reader.readString(offset)) as P;
    case 37:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _socialRecordModelGetId(SocialRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _socialRecordModelGetLinks(
    SocialRecordModel object) {
  return [];
}

void _socialRecordModelAttach(
    IsarCollection<dynamic> col, Id id, SocialRecordModel object) {
  object.id = id;
}

extension SocialRecordModelByIndex on IsarCollection<SocialRecordModel> {
  Future<SocialRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  SocialRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<SocialRecordModel?>> getAllByRecordId(
      List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<SocialRecordModel?> getAllByRecordIdSync(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recordId', values);
  }

  Future<int> deleteAllByRecordId(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recordId', values);
  }

  int deleteAllByRecordIdSync(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recordId', values);
  }

  Future<Id> putByRecordId(SocialRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(SocialRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<SocialRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<SocialRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension SocialRecordModelQueryWhereSort
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QWhere> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SocialRecordModelQueryWhere
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QWhereClause> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterWhereClause>
      recordIdNotEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordId',
              lower: [],
              upper: [recordId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordId',
              lower: [recordId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordId',
              lower: [recordId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordId',
              lower: [],
              upper: [recordId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SocialRecordModelQueryFilter
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QFilterCondition> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actorInteractionFrequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actorInteractionFrequency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actorInteractionFrequency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorInteractionFrequency',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorInteractionFrequencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actorInteractionFrequency',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorName',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actorName',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actorType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actorType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actorType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      actorTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actorType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      ageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      ageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      ageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      ageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'connectedKeyActors',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'connectedKeyActors',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectedKeyActors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'connectedKeyActors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'connectedKeyActors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectedKeyActors',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      connectedKeyActorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'connectedKeyActors',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverageChangePerception',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverageChangePerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverageChangePerception',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverageChangePerception',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coverageChangePerceptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverageChangePerception',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'educationLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'educationLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'educationLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      educationLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'educationLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'environmentalInfoAccess',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'environmentalInfoAccess',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'environmentalInfoAccess',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'environmentalInfoAccess',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      environmentalInfoAccessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'environmentalInfoAccess',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firebaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fragmentationPerception',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fragmentationPerception',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fragmentationPerception',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fragmentationPerception',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      fragmentationPerceptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fragmentationPerception',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationMunicipality',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationMunicipality',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationMunicipality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationMunicipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationMunicipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationMunicipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationMunicipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationMunicipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationVillage',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationVillage',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationVillage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationVillage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationVillage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationVillage',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      locationVillageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationVillage',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mainActivity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mainActivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mainActivity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      mainActivityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mainActivity',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'naturalResourceDependency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'naturalResourceDependency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'naturalResourceDependency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'naturalResourceDependency',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      naturalResourceDependencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'naturalResourceDependency',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observations',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observations',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'observedChangeType',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'observedChangeType',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observedChangeType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observedChangeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observedChangeType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observedChangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      observedChangeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observedChangeType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'organizationName',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'organizationName',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'organizationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'organizationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'organizationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizationName',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'organizationName',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'organizationParticipation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'organizationParticipation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'organizationParticipation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'organizationParticipation',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      organizationParticipationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'organizationParticipation',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'perceivedLandscapeImpact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'perceivedLandscapeImpact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'perceivedLandscapeImpact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'perceivedLandscapeImpact',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      perceivedLandscapeImpactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'perceivedLandscapeImpact',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'practiceType',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'practiceType',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'practiceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'practiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'practiceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'practiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      practiceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'practiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productivePracticeChanges',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productivePracticeChanges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productivePracticeChanges',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productivePracticeChanges',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      productivePracticeChangesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productivePracticeChanges',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relationshipType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'relationshipType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'relationshipType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relationshipType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      relationshipTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'relationshipType',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'respondentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'respondentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'respondentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'respondentId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      respondentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'respondentId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technologyUse',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technologyUse',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technologyUse',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technologyUse',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technologyUse',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technologyUse',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      technologyUseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technologyUse',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'territorialConnectivity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'territorialConnectivity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'territorialConnectivity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'territorialConnectivity',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      territorialConnectivityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'territorialConnectivity',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      timeInTerritoryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeInTerritory',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      timeInTerritoryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeInTerritory',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      timeInTerritoryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeInTerritory',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      timeInTerritoryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeInTerritory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trustLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trustLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trustLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trustLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      trustLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trustLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'village',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }
}

extension SocialRecordModelQueryObject
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QFilterCondition> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterFilterCondition>
      coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }
}

extension SocialRecordModelQueryLinks
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QFilterCondition> {}

extension SocialRecordModelQuerySortBy
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QSortBy> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorInteractionFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorInteractionFrequency', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorInteractionFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorInteractionFrequency', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorName', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorName', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByActorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByConnectedKeyActors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedKeyActors', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByConnectedKeyActorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedKeyActors', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByCoverageChangePerception() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageChangePerception', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByCoverageChangePerceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageChangePerception', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByEnvironmentalInfoAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'environmentalInfoAccess', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByEnvironmentalInfoAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'environmentalInfoAccess', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByFragmentationPerception() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fragmentationPerception', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByFragmentationPerceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fragmentationPerception', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByLocationMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationMunicipality', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByLocationMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationMunicipality', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByLocationVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationVillage', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByLocationVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationVillage', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByMainActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainActivity', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByMainActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainActivity', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByNaturalResourceDependency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalResourceDependency', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByNaturalResourceDependencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalResourceDependency', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByObservedChangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observedChangeType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByObservedChangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observedChangeType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOrganizationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOrganizationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOrganizationParticipation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationParticipation', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOrganizationParticipationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationParticipation', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByPerceivedLandscapeImpact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedLandscapeImpact', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByPerceivedLandscapeImpactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedLandscapeImpact', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByPracticeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'practiceType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByPracticeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'practiceType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByProductivePracticeChanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productivePracticeChanges', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByProductivePracticeChangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productivePracticeChanges', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRelationshipType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationshipType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRelationshipTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationshipType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRespondentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondentId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByRespondentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondentId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTechnologyUse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technologyUse', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTechnologyUseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technologyUse', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTerritorialConnectivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'territorialConnectivity', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTerritorialConnectivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'territorialConnectivity', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTimeInTerritory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInTerritory', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTimeInTerritoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInTerritory', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTrustLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trustLevel', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByTrustLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trustLevel', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension SocialRecordModelQuerySortThenBy
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QSortThenBy> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorInteractionFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorInteractionFrequency', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorInteractionFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorInteractionFrequency', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorName', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorName', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByActorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByConnectedKeyActors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedKeyActors', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByConnectedKeyActorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectedKeyActors', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByCoverageChangePerception() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageChangePerception', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByCoverageChangePerceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageChangePerception', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByEnvironmentalInfoAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'environmentalInfoAccess', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByEnvironmentalInfoAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'environmentalInfoAccess', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByFragmentationPerception() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fragmentationPerception', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByFragmentationPerceptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fragmentationPerception', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByLocationMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationMunicipality', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByLocationMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationMunicipality', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByLocationVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationVillage', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByLocationVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationVillage', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByMainActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainActivity', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByMainActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainActivity', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByNaturalResourceDependency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalResourceDependency', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByNaturalResourceDependencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'naturalResourceDependency', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByObservedChangeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observedChangeType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByObservedChangeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observedChangeType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOrganizationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOrganizationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOrganizationParticipation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationParticipation', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOrganizationParticipationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationParticipation', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByPerceivedLandscapeImpact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedLandscapeImpact', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByPerceivedLandscapeImpactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'perceivedLandscapeImpact', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByPracticeType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'practiceType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByPracticeTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'practiceType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByProductivePracticeChanges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productivePracticeChanges', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByProductivePracticeChangesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productivePracticeChanges', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRelationshipType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationshipType', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRelationshipTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'relationshipType', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRespondentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondentId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByRespondentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'respondentId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTechnologyUse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technologyUse', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTechnologyUseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technologyUse', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTerritorialConnectivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'territorialConnectivity', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTerritorialConnectivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'territorialConnectivity', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTimeInTerritory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInTerritory', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTimeInTerritoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeInTerritory', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTrustLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trustLevel', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByTrustLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trustLevel', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension SocialRecordModelQueryWhereDistinct
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct> {
  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByActorInteractionFrequency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actorInteractionFrequency',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByActorName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actorName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByActorType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actorType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByConnectedKeyActors({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectedKeyActors',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByCoverageChangePerception({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverageChangePerception',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByEducationLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'educationLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByEnvironmentalInfoAccess({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'environmentalInfoAccess',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByFragmentationPerception({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fragmentationPerception',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByGender({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByLocationMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationMunicipality',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByLocationVillage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationVillage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByMainActivity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainActivity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByNaturalResourceDependency({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'naturalResourceDependency',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByObservations({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observations', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByObservedChangeType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observedChangeType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByOrganizationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organizationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByOrganizationParticipation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'organizationParticipation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByOutingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByPerceivedLandscapeImpact({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'perceivedLandscapeImpact',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByPracticeType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'practiceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByProductivePracticeChanges({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productivePracticeChanges',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByRecordId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByRelationshipType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relationshipType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByRespondentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'respondentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctBySector({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByTechnologyUse({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technologyUse',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByTerritorialConnectivity({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'territorialConnectivity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByTimeInTerritory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeInTerritory');
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByTrustLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trustLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SocialRecordModel, SocialRecordModel, QDistinct>
      distinctByVillage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }
}

extension SocialRecordModelQueryProperty
    on QueryBuilder<SocialRecordModel, SocialRecordModel, QQueryProperty> {
  QueryBuilder<SocialRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      actorInteractionFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actorInteractionFrequency');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      actorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actorName');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      actorTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actorType');
    });
  }

  QueryBuilder<SocialRecordModel, double, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      connectedKeyActorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectedKeyActors');
    });
  }

  QueryBuilder<SocialRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      coverageChangePerceptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverageChangePerception');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      educationLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'educationLevel');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      environmentalInfoAccessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'environmentalInfoAccess');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      fragmentationPerceptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fragmentationPerception');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      locationMunicipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationMunicipality');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      locationVillageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationVillage');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      mainActivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainActivity');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      naturalResourceDependencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'naturalResourceDependency');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      observationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observations');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      observedChangeTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observedChangeType');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      organizationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organizationName');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      organizationParticipationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organizationParticipation');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      perceivedLandscapeImpactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'perceivedLandscapeImpact');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      practiceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'practiceType');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      productivePracticeChangesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productivePracticeChanges');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<SocialRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      relationshipTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relationshipType');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      respondentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'respondentId');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<SocialRecordModel, String?, QQueryOperations>
      technologyUseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technologyUse');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      territorialConnectivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'territorialConnectivity');
    });
  }

  QueryBuilder<SocialRecordModel, double, QQueryOperations>
      timeInTerritoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeInTerritory');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations>
      trustLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trustLevel');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<SocialRecordModel, String, QQueryOperations> villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }
}
