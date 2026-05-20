// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRockRecordModelCollection on Isar {
  IsarCollection<RockRecordModel> get rockRecordModels => this.collection();
}

const RockRecordModelSchema = CollectionSchema(
  name: r'RockRecordModel',
  id: 7633655498976300927,
  properties: {
    r'coordinates': PropertySchema(
      id: 0,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'department': PropertySchema(
      id: 1,
      name: r'department',
      type: IsarType.string,
    ),
    r'dominantColor': PropertySchema(
      id: 2,
      name: r'dominantColor',
      type: IsarType.string,
    ),
    r'firebaseId': PropertySchema(
      id: 3,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'hardness': PropertySchema(
      id: 4,
      name: r'hardness',
      type: IsarType.string,
    ),
    r'hasSample': PropertySchema(
      id: 5,
      name: r'hasSample',
      type: IsarType.bool,
    ),
    r'minerals': PropertySchema(
      id: 6,
      name: r'minerals',
      type: IsarType.string,
    ),
    r'municipality': PropertySchema(
      id: 7,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'observations': PropertySchema(
      id: 8,
      name: r'observations',
      type: IsarType.string,
    ),
    r'outingId': PropertySchema(
      id: 9,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 10,
      name: r'photos',
      type: IsarType.objectList,
      target: r'PhotoRecord',
    ),
    r'recordId': PropertySchema(
      id: 11,
      name: r'recordId',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 12,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'rockType': PropertySchema(
      id: 13,
      name: r'rockType',
      type: IsarType.string,
    ),
    r'rockTypeFreeText': PropertySchema(
      id: 14,
      name: r'rockTypeFreeText',
      type: IsarType.string,
    ),
    r'sampleDepth': PropertySchema(
      id: 15,
      name: r'sampleDepth',
      type: IsarType.double,
    ),
    r'sampleId': PropertySchema(
      id: 16,
      name: r'sampleId',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 17,
      name: r'sector',
      type: IsarType.string,
    ),
    r'structure': PropertySchema(
      id: 18,
      name: r'structure',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 19,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'texture': PropertySchema(
      id: 20,
      name: r'texture',
      type: IsarType.stringList,
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
  estimateSize: _rockRecordModelEstimateSize,
  serialize: _rockRecordModelSerialize,
  deserialize: _rockRecordModelDeserialize,
  deserializeProp: _rockRecordModelDeserializeProp,
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
  getId: _rockRecordModelGetId,
  getLinks: _rockRecordModelGetLinks,
  attach: _rockRecordModelAttach,
  version: '3.1.0+1',
);

int _rockRecordModelEstimateSize(
  RockRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.coordinates;
    if (value != null) {
      bytesCount += 3 +
          CoordinateModelSchema.estimateSize(
              value, allOffsets[CoordinateModel]!, allOffsets);
    }
  }
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.dominantColor.length * 3;
  {
    final value = object.firebaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.hardness.length * 3;
  bytesCount += 3 + object.minerals.length * 3;
  bytesCount += 3 + object.municipality.length * 3;
  bytesCount += 3 + object.observations.length * 3;
  bytesCount += 3 + object.outingId.length * 3;
  bytesCount += 3 + object.photos.length * 3;
  {
    final offsets = allOffsets[PhotoRecord]!;
    for (var i = 0; i < object.photos.length; i++) {
      final value = object.photos[i];
      bytesCount += PhotoRecordSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.recordId.length * 3;
  bytesCount += 3 + object.rockType.length * 3;
  {
    final value = object.rockTypeFreeText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sampleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.structure.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  bytesCount += 3 + object.texture.length * 3;
  {
    for (var i = 0; i < object.texture.length; i++) {
      final value = object.texture[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.village.length * 3;
  return bytesCount;
}

void _rockRecordModelSerialize(
  RockRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<CoordinateModel>(
    offsets[0],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[1], object.department);
  writer.writeString(offsets[2], object.dominantColor);
  writer.writeString(offsets[3], object.firebaseId);
  writer.writeString(offsets[4], object.hardness);
  writer.writeBool(offsets[5], object.hasSample);
  writer.writeString(offsets[6], object.minerals);
  writer.writeString(offsets[7], object.municipality);
  writer.writeString(offsets[8], object.observations);
  writer.writeString(offsets[9], object.outingId);
  writer.writeObjectList<PhotoRecord>(
    offsets[10],
    allOffsets,
    PhotoRecordSchema.serialize,
    object.photos,
  );
  writer.writeString(offsets[11], object.recordId);
  writer.writeDateTime(offsets[12], object.recordedAt);
  writer.writeString(offsets[13], object.rockType);
  writer.writeString(offsets[14], object.rockTypeFreeText);
  writer.writeDouble(offsets[15], object.sampleDepth);
  writer.writeString(offsets[16], object.sampleId);
  writer.writeString(offsets[17], object.sector);
  writer.writeString(offsets[18], object.structure);
  writer.writeString(offsets[19], object.syncStatus);
  writer.writeStringList(offsets[20], object.texture);
  writer.writeString(offsets[21], object.userId);
  writer.writeString(offsets[22], object.village);
}

RockRecordModel _rockRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RockRecordModel();
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[0],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.department = reader.readString(offsets[1]);
  object.dominantColor = reader.readString(offsets[2]);
  object.firebaseId = reader.readStringOrNull(offsets[3]);
  object.hardness = reader.readString(offsets[4]);
  object.hasSample = reader.readBool(offsets[5]);
  object.id = id;
  object.minerals = reader.readString(offsets[6]);
  object.municipality = reader.readString(offsets[7]);
  object.observations = reader.readString(offsets[8]);
  object.outingId = reader.readString(offsets[9]);
  object.photos = reader.readObjectList<PhotoRecord>(
        offsets[10],
        PhotoRecordSchema.deserialize,
        allOffsets,
        PhotoRecord(),
      ) ??
      [];
  object.recordId = reader.readString(offsets[11]);
  object.recordedAt = reader.readDateTime(offsets[12]);
  object.rockType = reader.readString(offsets[13]);
  object.rockTypeFreeText = reader.readStringOrNull(offsets[14]);
  object.sampleDepth = reader.readDoubleOrNull(offsets[15]);
  object.sampleId = reader.readStringOrNull(offsets[16]);
  object.sector = reader.readString(offsets[17]);
  object.structure = reader.readString(offsets[18]);
  object.syncStatus = reader.readString(offsets[19]);
  object.texture = reader.readStringList(offsets[20]) ?? [];
  object.userId = reader.readString(offsets[21]);
  object.village = reader.readString(offsets[22]);
  return object;
}

P _rockRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<CoordinateModel>(
        offset,
        CoordinateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readObjectList<PhotoRecord>(
            offset,
            PhotoRecordSchema.deserialize,
            allOffsets,
            PhotoRecord(),
          ) ??
          []) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringList(offset) ?? []) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rockRecordModelGetId(RockRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rockRecordModelGetLinks(RockRecordModel object) {
  return [];
}

void _rockRecordModelAttach(
    IsarCollection<dynamic> col, Id id, RockRecordModel object) {
  object.id = id;
}

extension RockRecordModelByIndex on IsarCollection<RockRecordModel> {
  Future<RockRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  RockRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<RockRecordModel?>> getAllByRecordId(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<RockRecordModel?> getAllByRecordIdSync(List<String> recordIdValues) {
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

  Future<Id> putByRecordId(RockRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(RockRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<RockRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<RockRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension RockRecordModelQueryWhereSort
    on QueryBuilder<RockRecordModel, RockRecordModel, QWhere> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RockRecordModelQueryWhere
    on QueryBuilder<RockRecordModel, RockRecordModel, QWhereClause> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterWhereClause>
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

extension RockRecordModelQueryFilter
    on QueryBuilder<RockRecordModel, RockRecordModel, QFilterCondition> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dominantColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dominantColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantColor',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      dominantColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dominantColor',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hardness',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hardness',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hardness',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hardness',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hardnessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hardness',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      hasSampleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSample',
        value: value,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minerals',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'minerals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'minerals',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minerals',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      mineralsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'minerals',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsEqualTo(
    String value, {
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsGreaterThan(
    String value, {
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsLessThan(
    String value, {
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      observationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rockType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rockType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rockType',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rockType',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rockTypeFreeText',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rockTypeFreeText',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rockTypeFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rockTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rockTypeFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rockTypeFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      rockTypeFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rockTypeFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleDepth',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleDepth',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleDepth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sampleDepth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sampleDepth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleDepthBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sampleDepth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sampleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sampleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sampleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'structure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'structure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structure',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      structureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'structure',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'texture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'texture',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texture',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'texture',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      textureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'texture',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
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

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }
}

extension RockRecordModelQueryObject
    on QueryBuilder<RockRecordModel, RockRecordModel, QFilterCondition> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterFilterCondition>
      photosElement(FilterQuery<PhotoRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photos');
    });
  }
}

extension RockRecordModelQueryLinks
    on QueryBuilder<RockRecordModel, RockRecordModel, QFilterCondition> {}

extension RockRecordModelQuerySortBy
    on QueryBuilder<RockRecordModel, RockRecordModel, QSortBy> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByDominantColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByDominantColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByHardness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hardness', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByHardnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hardness', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByMinerals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minerals', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByMineralsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minerals', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockType', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockType', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRockTypeFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockTypeFreeText', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByRockTypeFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockTypeFreeText', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySampleDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension RockRecordModelQuerySortThenBy
    on QueryBuilder<RockRecordModel, RockRecordModel, QSortThenBy> {
  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByDominantColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByDominantColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByHardness() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hardness', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByHardnessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hardness', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByMinerals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minerals', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByMineralsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minerals', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockType', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockType', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRockTypeFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockTypeFreeText', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByRockTypeFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rockTypeFreeText', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySampleDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy> thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension RockRecordModelQueryWhereDistinct
    on QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> {
  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByDominantColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dominantColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByHardness(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hardness', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSample');
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByMinerals(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minerals', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByObservations({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observations', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByOutingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByRecordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByRockType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rockType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByRockTypeFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rockTypeFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleDepth');
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctBySampleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByStructure(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structure', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct>
      distinctByTexture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'texture');
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RockRecordModel, RockRecordModel, QDistinct> distinctByVillage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }
}

extension RockRecordModelQueryProperty
    on QueryBuilder<RockRecordModel, RockRecordModel, QQueryProperty> {
  QueryBuilder<RockRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RockRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations>
      dominantColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dominantColor');
    });
  }

  QueryBuilder<RockRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> hardnessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hardness');
    });
  }

  QueryBuilder<RockRecordModel, bool, QQueryOperations> hasSampleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSample');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> mineralsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minerals');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations>
      observationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observations');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<RockRecordModel, List<PhotoRecord>, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<RockRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> rockTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rockType');
    });
  }

  QueryBuilder<RockRecordModel, String?, QQueryOperations>
      rockTypeFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rockTypeFreeText');
    });
  }

  QueryBuilder<RockRecordModel, double?, QQueryOperations>
      sampleDepthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleDepth');
    });
  }

  QueryBuilder<RockRecordModel, String?, QQueryOperations> sampleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleId');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> structureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structure');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<RockRecordModel, List<String>, QQueryOperations>
      textureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'texture');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<RockRecordModel, String, QQueryOperations> villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }
}
