// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSoilRecordModelCollection on Isar {
  IsarCollection<SoilRecordModel> get soilRecordModels => this.collection();
}

const SoilRecordModelSchema = CollectionSchema(
  name: r'SoilRecordModel',
  id: -3181245022077206654,
  properties: {
    r'colorVariability': PropertySchema(
      id: 0,
      name: r'colorVariability',
      type: IsarType.string,
    ),
    r'coordinates': PropertySchema(
      id: 1,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'department': PropertySchema(
      id: 2,
      name: r'department',
      type: IsarType.string,
    ),
    r'dominantColor': PropertySchema(
      id: 3,
      name: r'dominantColor',
      type: IsarType.string,
    ),
    r'firebaseId': PropertySchema(
      id: 4,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'hasSample': PropertySchema(
      id: 5,
      name: r'hasSample',
      type: IsarType.bool,
    ),
    r'municipality': PropertySchema(
      id: 6,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'observations': PropertySchema(
      id: 7,
      name: r'observations',
      type: IsarType.string,
    ),
    r'outingId': PropertySchema(
      id: 8,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 9,
      name: r'photos',
      type: IsarType.objectList,
      target: r'PhotoRecord',
    ),
    r'plot': PropertySchema(
      id: 10,
      name: r'plot',
      type: IsarType.object,
      target: r'PlotModel',
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
    r'sampleDepth': PropertySchema(
      id: 13,
      name: r'sampleDepth',
      type: IsarType.double,
    ),
    r'sampleId': PropertySchema(
      id: 14,
      name: r'sampleId',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 15,
      name: r'sector',
      type: IsarType.string,
    ),
    r'soilProfile': PropertySchema(
      id: 16,
      name: r'soilProfile',
      type: IsarType.string,
    ),
    r'soilTypeFreeText': PropertySchema(
      id: 17,
      name: r'soilTypeFreeText',
      type: IsarType.string,
    ),
    r'soilTypes': PropertySchema(
      id: 18,
      name: r'soilTypes',
      type: IsarType.stringList,
    ),
    r'structure': PropertySchema(
      id: 19,
      name: r'structure',
      type: IsarType.string,
    ),
    r'structureFreeText': PropertySchema(
      id: 20,
      name: r'structureFreeText',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 21,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'texture': PropertySchema(
      id: 22,
      name: r'texture',
      type: IsarType.stringList,
    ),
    r'textureFreeText': PropertySchema(
      id: 23,
      name: r'textureFreeText',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 24,
      name: r'userId',
      type: IsarType.string,
    ),
    r'village': PropertySchema(
      id: 25,
      name: r'village',
      type: IsarType.string,
    )
  },
  estimateSize: _soilRecordModelEstimateSize,
  serialize: _soilRecordModelSerialize,
  deserialize: _soilRecordModelDeserialize,
  deserializeProp: _soilRecordModelDeserializeProp,
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
    r'PlotModel': PlotModelSchema,
    r'PhotoRecord': PhotoRecordSchema
  },
  getId: _soilRecordModelGetId,
  getLinks: _soilRecordModelGetLinks,
  attach: _soilRecordModelAttach,
  version: '3.1.0+1',
);

int _soilRecordModelEstimateSize(
  SoilRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.colorVariability.length * 3;
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
  {
    final value = object.plot;
    if (value != null) {
      bytesCount += 3 +
          PlotModelSchema.estimateSize(
              value, allOffsets[PlotModel]!, allOffsets);
    }
  }
  bytesCount += 3 + object.recordId.length * 3;
  {
    final value = object.sampleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.soilProfile.length * 3;
  {
    final value = object.soilTypeFreeText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.soilTypes.length * 3;
  {
    for (var i = 0; i < object.soilTypes.length; i++) {
      final value = object.soilTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.structure.length * 3;
  {
    final value = object.structureFreeText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.syncStatus.length * 3;
  bytesCount += 3 + object.texture.length * 3;
  {
    for (var i = 0; i < object.texture.length; i++) {
      final value = object.texture[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.textureFreeText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.village.length * 3;
  return bytesCount;
}

void _soilRecordModelSerialize(
  SoilRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorVariability);
  writer.writeObject<CoordinateModel>(
    offsets[1],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[2], object.department);
  writer.writeString(offsets[3], object.dominantColor);
  writer.writeString(offsets[4], object.firebaseId);
  writer.writeBool(offsets[5], object.hasSample);
  writer.writeString(offsets[6], object.municipality);
  writer.writeString(offsets[7], object.observations);
  writer.writeString(offsets[8], object.outingId);
  writer.writeObjectList<PhotoRecord>(
    offsets[9],
    allOffsets,
    PhotoRecordSchema.serialize,
    object.photos,
  );
  writer.writeObject<PlotModel>(
    offsets[10],
    allOffsets,
    PlotModelSchema.serialize,
    object.plot,
  );
  writer.writeString(offsets[11], object.recordId);
  writer.writeDateTime(offsets[12], object.recordedAt);
  writer.writeDouble(offsets[13], object.sampleDepth);
  writer.writeString(offsets[14], object.sampleId);
  writer.writeString(offsets[15], object.sector);
  writer.writeString(offsets[16], object.soilProfile);
  writer.writeString(offsets[17], object.soilTypeFreeText);
  writer.writeStringList(offsets[18], object.soilTypes);
  writer.writeString(offsets[19], object.structure);
  writer.writeString(offsets[20], object.structureFreeText);
  writer.writeString(offsets[21], object.syncStatus);
  writer.writeStringList(offsets[22], object.texture);
  writer.writeString(offsets[23], object.textureFreeText);
  writer.writeString(offsets[24], object.userId);
  writer.writeString(offsets[25], object.village);
}

SoilRecordModel _soilRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SoilRecordModel();
  object.colorVariability = reader.readString(offsets[0]);
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[1],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.department = reader.readString(offsets[2]);
  object.dominantColor = reader.readString(offsets[3]);
  object.firebaseId = reader.readStringOrNull(offsets[4]);
  object.hasSample = reader.readBool(offsets[5]);
  object.id = id;
  object.municipality = reader.readString(offsets[6]);
  object.observations = reader.readString(offsets[7]);
  object.outingId = reader.readString(offsets[8]);
  object.photos = reader.readObjectList<PhotoRecord>(
        offsets[9],
        PhotoRecordSchema.deserialize,
        allOffsets,
        PhotoRecord(),
      ) ??
      [];
  object.plot = reader.readObjectOrNull<PlotModel>(
    offsets[10],
    PlotModelSchema.deserialize,
    allOffsets,
  );
  object.recordId = reader.readString(offsets[11]);
  object.recordedAt = reader.readDateTime(offsets[12]);
  object.sampleDepth = reader.readDoubleOrNull(offsets[13]);
  object.sampleId = reader.readStringOrNull(offsets[14]);
  object.sector = reader.readString(offsets[15]);
  object.soilProfile = reader.readString(offsets[16]);
  object.soilTypeFreeText = reader.readStringOrNull(offsets[17]);
  object.soilTypes = reader.readStringList(offsets[18]) ?? [];
  object.structure = reader.readString(offsets[19]);
  object.structureFreeText = reader.readStringOrNull(offsets[20]);
  object.syncStatus = reader.readString(offsets[21]);
  object.texture = reader.readStringList(offsets[22]) ?? [];
  object.textureFreeText = reader.readStringOrNull(offsets[23]);
  object.userId = reader.readString(offsets[24]);
  object.village = reader.readString(offsets[25]);
  return object;
}

P _soilRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<CoordinateModel>(
        offset,
        CoordinateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readObjectList<PhotoRecord>(
            offset,
            PhotoRecordSchema.deserialize,
            allOffsets,
            PhotoRecord(),
          ) ??
          []) as P;
    case 10:
      return (reader.readObjectOrNull<PlotModel>(
        offset,
        PlotModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readStringList(offset) ?? []) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _soilRecordModelGetId(SoilRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _soilRecordModelGetLinks(SoilRecordModel object) {
  return [];
}

void _soilRecordModelAttach(
    IsarCollection<dynamic> col, Id id, SoilRecordModel object) {
  object.id = id;
}

extension SoilRecordModelByIndex on IsarCollection<SoilRecordModel> {
  Future<SoilRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  SoilRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<SoilRecordModel?>> getAllByRecordId(List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<SoilRecordModel?> getAllByRecordIdSync(List<String> recordIdValues) {
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

  Future<Id> putByRecordId(SoilRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(SoilRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<SoilRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<SoilRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension SoilRecordModelQueryWhereSort
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QWhere> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SoilRecordModelQueryWhere
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QWhereClause> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterWhereClause>
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

extension SoilRecordModelQueryFilter
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QFilterCondition> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorVariability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorVariability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorVariability',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorVariability',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      colorVariabilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorVariability',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      dominantColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dominantColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      dominantColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dominantColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      dominantColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dominantColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      dominantColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dominantColor',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      hasSampleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSample',
        value: value,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      observationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'observations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      observationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'observations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      observationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      observationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'observations',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      plotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      plotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleDepthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleDepth',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleDepthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleDepth',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sampleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sampleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soilProfile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soilProfile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soilProfile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilProfile',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilProfileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soilProfile',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'soilTypeFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'soilTypeFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soilTypeFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soilTypeFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soilTypeFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilTypeFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypeFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soilTypeFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soilTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soilTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soilTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soilTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soilTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      soilTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soilTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'structure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'structure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structure',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'structure',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'structureFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'structureFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'structureFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'structureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'structureFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'structureFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      structureFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'structureFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'texture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'texture',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'texture',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'texture',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'textureFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'textureFreeText',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textureFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textureFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textureFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textureFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      textureFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textureFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
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

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }
}

extension SoilRecordModelQueryObject
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QFilterCondition> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition>
      photosElement(FilterQuery<PhotoRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photos');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterFilterCondition> plot(
      FilterQuery<PlotModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plot');
    });
  }
}

extension SoilRecordModelQueryLinks
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QFilterCondition> {}

extension SoilRecordModelQuerySortBy
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QSortBy> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByColorVariability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorVariability', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByColorVariabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorVariability', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByDominantColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByDominantColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySampleDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySoilProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilProfile', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySoilProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilProfile', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySoilTypeFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilTypeFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySoilTypeFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilTypeFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByStructureFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByStructureFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByTextureFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textureFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByTextureFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textureFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension SoilRecordModelQuerySortThenBy
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QSortThenBy> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByColorVariability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorVariability', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByColorVariabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorVariability', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByDominantColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByDominantColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dominantColor', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByObservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByObservationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'observations', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySampleDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleDepth', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySoilProfile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilProfile', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySoilProfileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilProfile', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySoilTypeFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilTypeFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySoilTypeFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soilTypeFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByStructure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByStructureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structure', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByStructureFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByStructureFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'structureFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByTextureFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textureFreeText', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByTextureFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textureFreeText', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy> thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension SoilRecordModelQueryWhereDistinct
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> {
  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByColorVariability({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorVariability',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByDominantColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dominantColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSample');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByObservations({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'observations', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctByOutingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctByRecordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctBySampleDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleDepth');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctBySampleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctBySoilProfile({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soilProfile', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctBySoilTypeFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soilTypeFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctBySoilTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soilTypes');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctByStructure(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structure', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByStructureFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'structureFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByTexture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'texture');
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct>
      distinctByTextureFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textureFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SoilRecordModel, SoilRecordModel, QDistinct> distinctByVillage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }
}

extension SoilRecordModelQueryProperty
    on QueryBuilder<SoilRecordModel, SoilRecordModel, QQueryProperty> {
  QueryBuilder<SoilRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations>
      colorVariabilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorVariability');
    });
  }

  QueryBuilder<SoilRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations>
      dominantColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dominantColor');
    });
  }

  QueryBuilder<SoilRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<SoilRecordModel, bool, QQueryOperations> hasSampleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSample');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations>
      observationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'observations');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<SoilRecordModel, List<PhotoRecord>, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<SoilRecordModel, PlotModel?, QQueryOperations> plotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plot');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<SoilRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<SoilRecordModel, double?, QQueryOperations>
      sampleDepthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleDepth');
    });
  }

  QueryBuilder<SoilRecordModel, String?, QQueryOperations> sampleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleId');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations>
      soilProfileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soilProfile');
    });
  }

  QueryBuilder<SoilRecordModel, String?, QQueryOperations>
      soilTypeFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soilTypeFreeText');
    });
  }

  QueryBuilder<SoilRecordModel, List<String>, QQueryOperations>
      soilTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soilTypes');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> structureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structure');
    });
  }

  QueryBuilder<SoilRecordModel, String?, QQueryOperations>
      structureFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'structureFreeText');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<SoilRecordModel, List<String>, QQueryOperations>
      textureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'texture');
    });
  }

  QueryBuilder<SoilRecordModel, String?, QQueryOperations>
      textureFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textureFreeText');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<SoilRecordModel, String, QQueryOperations> villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }
}
