// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bird_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBirdRecordModelCollection on Isar {
  IsarCollection<BirdRecordModel> get birdRecordModels => this.collection();
}

const BirdRecordModelSchema = CollectionSchema(
  name: r'BirdRecordModel',
  id: 5324029958740940634,
  properties: {
    r'activity': PropertySchema(
      id: 0,
      name: r'activity',
      type: IsarType.string,
    ),
    r'behavior': PropertySchema(
      id: 1,
      name: r'behavior',
      type: IsarType.string,
    ),
    r'birdType': PropertySchema(
      id: 2,
      name: r'birdType',
      type: IsarType.string,
    ),
    r'coordinates': PropertySchema(
      id: 3,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'department': PropertySchema(
      id: 4,
      name: r'department',
      type: IsarType.string,
    ),
    r'firebaseId': PropertySchema(
      id: 5,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'foragingType': PropertySchema(
      id: 6,
      name: r'foragingType',
      type: IsarType.stringList,
    ),
    r'habitat': PropertySchema(
      id: 7,
      name: r'habitat',
      type: IsarType.stringList,
    ),
    r'individualCount': PropertySchema(
      id: 8,
      name: r'individualCount',
      type: IsarType.long,
    ),
    r'migratorStatus': PropertySchema(
      id: 9,
      name: r'migratorStatus',
      type: IsarType.string,
    ),
    r'municipality': PropertySchema(
      id: 10,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'observedThreats': PropertySchema(
      id: 11,
      name: r'observedThreats',
      type: IsarType.stringList,
    ),
    r'outingId': PropertySchema(
      id: 12,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 13,
      name: r'photos',
      type: IsarType.objectList,
      target: r'PhotoRecord',
    ),
    r'place': PropertySchema(
      id: 14,
      name: r'place',
      type: IsarType.string,
    ),
    r'recordId': PropertySchema(
      id: 15,
      name: r'recordId',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 16,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'season': PropertySchema(
      id: 17,
      name: r'season',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 18,
      name: r'sector',
      type: IsarType.string,
    ),
    r'speciesId': PropertySchema(
      id: 19,
      name: r'speciesId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 20,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 21,
      name: r'userId',
      type: IsarType.string,
    ),
    r'village': PropertySchema(
      id: 22,
      name: r'village',
      type: IsarType.string,
    )
  },
  estimateSize: _birdRecordModelEstimateSize,
  serialize: _birdRecordModelSerialize,
  deserialize: _birdRecordModelDeserialize,
  deserializeProp: _birdRecordModelDeserializeProp,
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
  embeddedSchemas: {
    r'CoordinateModel': CoordinateModelSchema,
    r'PhotoRecord': PhotoRecordSchema
  },
  getId: _birdRecordModelGetId,
  getLinks: _birdRecordModelGetLinks,
  attach: _birdRecordModelAttach,
  version: '3.1.0+1',
);

int _birdRecordModelEstimateSize(
  BirdRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activity.length * 3;
  bytesCount += 3 + object.behavior.length * 3;
  bytesCount += 3 + object.birdType.length * 3;
  {
    final value = object.coordinates;
    if (value != null) {
      bytesCount += 3 +
          CoordinateModelSchema.estimateSize(
              value, allOffsets[CoordinateModel]!, allOffsets);
    }
  }
  bytesCount += 3 + object.department.length * 3;
  {
    final value = object.firebaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.foragingType.length * 3;
  {
    for (var i = 0; i < object.foragingType.length; i++) {
      final value = object.foragingType[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.habitat.length * 3;
  {
    for (var i = 0; i < object.habitat.length; i++) {
      final value = object.habitat[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.migratorStatus.length * 3;
  bytesCount += 3 + object.municipality.length * 3;
  bytesCount += 3 + object.observedThreats.length * 3;
  {
    for (var i = 0; i < object.observedThreats.length; i++) {
      final value = object.observedThreats[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.outingId.length * 3;
  bytesCount += 3 + object.photos.length * 3;
  {
    final offsets = allOffsets[PhotoRecord]!;
    for (var i = 0; i < object.photos.length; i++) {
      final value = object.photos[i];
      bytesCount += PhotoRecordSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.place.length * 3;
  bytesCount += 3 + object.recordId.length * 3;
  bytesCount += 3 + object.season.length * 3;
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.speciesId.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.village.length * 3;
  return bytesCount;
}

void _birdRecordModelSerialize(
  BirdRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activity);
  writer.writeString(offsets[1], object.behavior);
  writer.writeString(offsets[2], object.birdType);
  writer.writeObject<CoordinateModel>(
    offsets[3],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[4], object.department);
  writer.writeString(offsets[5], object.firebaseId);
  writer.writeStringList(offsets[6], object.foragingType);
  writer.writeStringList(offsets[7], object.habitat);
  writer.writeLong(offsets[8], object.individualCount);
  writer.writeString(offsets[9], object.migratorStatus);
  writer.writeString(offsets[10], object.municipality);
  writer.writeStringList(offsets[11], object.observedThreats);
  writer.writeString(offsets[12], object.outingId);
  writer.writeObjectList<PhotoRecord>(
    offsets[13],
    allOffsets,
    PhotoRecordSchema.serialize,
    object.photos,
  );
  writer.writeString(offsets[14], object.place);
  writer.writeString(offsets[15], object.recordId);
  writer.writeDateTime(offsets[16], object.recordedAt);
  writer.writeString(offsets[17], object.season);
  writer.writeString(offsets[18], object.sector);
  writer.writeString(offsets[19], object.speciesId);
  writer.writeString(offsets[20], object.syncStatus);
  writer.writeString(offsets[21], object.userId);
  writer.writeString(offsets[22], object.village);
}

BirdRecordModel _birdRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BirdRecordModel();
  object.activity = reader.readString(offsets[0]);
  object.behavior = reader.readString(offsets[1]);
  object.birdType = reader.readString(offsets[2]);
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[3],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.department = reader.readString(offsets[4]);
  object.firebaseId = reader.readStringOrNull(offsets[5]);
  object.foragingType = reader.readStringList(offsets[6]) ?? [];
  object.habitat = reader.readStringList(offsets[7]) ?? [];
  object.id = id;
  object.individualCount = reader.readLong(offsets[8]);
  object.migratorStatus = reader.readString(offsets[9]);
  object.municipality = reader.readString(offsets[10]);
  object.observedThreats = reader.readStringList(offsets[11]) ?? [];
  object.outingId = reader.readString(offsets[12]);
  object.photos = reader.readObjectList<PhotoRecord>(
        offsets[13],
        PhotoRecordSchema.deserialize,
        allOffsets,
        PhotoRecord(),
      ) ??
      [];
  object.place = reader.readString(offsets[14]);
  object.recordId = reader.readString(offsets[15]);
  object.recordedAt = reader.readDateTime(offsets[16]);
  object.season = reader.readString(offsets[17]);
  object.sector = reader.readString(offsets[18]);
  object.speciesId = reader.readString(offsets[19]);
  object.syncStatus = reader.readString(offsets[20]);
  object.userId = reader.readString(offsets[21]);
  object.village = reader.readString(offsets[22]);
  return object;
}

P _birdRecordModelDeserializeProp<P>(
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
      return (reader.readObjectOrNull<CoordinateModel>(
        offset,
        CoordinateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readObjectList<PhotoRecord>(
            offset,
            PhotoRecordSchema.deserialize,
            allOffsets,
            PhotoRecord(),
          ) ??
          []) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _birdRecordModelGetId(BirdRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _birdRecordModelGetLinks(BirdRecordModel object) {
  return [];
}

void _birdRecordModelAttach(
    IsarCollection<dynamic> col, Id id, BirdRecordModel object) {
  object.id = id;
}

extension BirdRecordModelByIndex on IsarCollection<BirdRecordModel> {
  Future<BirdRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  BirdRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<BirdRecordModel?>> getAllByRecordId(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<BirdRecordModel?> getAllByRecordIdSync(List<String> recordIdValues) {
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

  Future<Id> putByRecordId(BirdRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(BirdRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<BirdRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<BirdRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension BirdRecordModelQueryWhereSort
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QWhere> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BirdRecordModelQueryWhere
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QWhereClause> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterWhereClause>
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

extension BirdRecordModelQueryFilter
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QFilterCondition> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activity',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      activityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activity',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'behavior',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'behavior',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'behavior',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'behavior',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      behaviorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'behavior',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birdType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'birdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'birdType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birdType',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      birdTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'birdType',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foragingType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foragingType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foragingType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foragingType',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foragingType',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      foragingTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'foragingType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'habitat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'habitat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'habitat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'habitat',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'habitat',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      habitatLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'habitat',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      individualCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'individualCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      individualCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'individualCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      individualCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'individualCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      individualCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'individualCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'migratorStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'migratorStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'migratorStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'migratorStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      migratorStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'migratorStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'observedThreats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observedThreats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observedThreats',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observedThreats',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observedThreats',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      observedThreatsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'observedThreats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'photos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'place',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'place',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'place',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'place',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      placeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'place',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'season',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      speciesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
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

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }
}

extension BirdRecordModelQueryObject
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QFilterCondition> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterFilterCondition>
      photosElement(FilterQuery<PhotoRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photos');
    });
  }
}

extension BirdRecordModelQueryLinks
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QFilterCondition> {}

extension BirdRecordModelQuerySortBy
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QSortBy> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByBehavior() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behavior', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByBehaviorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behavior', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByBirdType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birdType', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByBirdTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birdType', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByIndividualCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualCount', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByIndividualCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualCount', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByMigratorStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migratorStatus', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByMigratorStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migratorStatus', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> sortByPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension BirdRecordModelQuerySortThenBy
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QSortThenBy> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByActivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByActivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activity', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByBehavior() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behavior', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByBehaviorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'behavior', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByBirdType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birdType', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByBirdTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birdType', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByIndividualCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualCount', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByIndividualCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'individualCount', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByMigratorStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migratorStatus', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByMigratorStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'migratorStatus', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenByPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'place', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy> thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension BirdRecordModelQueryWhereDistinct
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> {
  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByActivity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByBehavior(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'behavior', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByBirdType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birdType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByForagingType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foragingType');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByHabitat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'habitat');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByIndividualCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'individualCount');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByMigratorStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'migratorStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByObservedThreats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observedThreats');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByOutingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByPlace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'place', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByRecordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctBySeason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctBySpeciesId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BirdRecordModel, BirdRecordModel, QDistinct> distinctByVillage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }
}

extension BirdRecordModelQueryProperty
    on QueryBuilder<BirdRecordModel, BirdRecordModel, QQueryProperty> {
  QueryBuilder<BirdRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> activityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activity');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> behaviorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'behavior');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> birdTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birdType');
    });
  }

  QueryBuilder<BirdRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<BirdRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<BirdRecordModel, List<String>, QQueryOperations>
      foragingTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foragingType');
    });
  }

  QueryBuilder<BirdRecordModel, List<String>, QQueryOperations>
      habitatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'habitat');
    });
  }

  QueryBuilder<BirdRecordModel, int, QQueryOperations>
      individualCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'individualCount');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations>
      migratorStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'migratorStatus');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<BirdRecordModel, List<String>, QQueryOperations>
      observedThreatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observedThreats');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<BirdRecordModel, List<PhotoRecord>, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> placeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'place');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<BirdRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> speciesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesId');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<BirdRecordModel, String, QQueryOperations> villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }
}
