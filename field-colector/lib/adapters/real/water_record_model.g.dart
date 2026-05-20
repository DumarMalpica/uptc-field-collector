// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWaterRecordModelCollection on Isar {
  IsarCollection<WaterRecordModel> get waterRecordModels => this.collection();
}

const WaterRecordModelSchema = CollectionSchema(
  name: r'WaterRecordModel',
  id: 6768600345805597262,
  properties: {
    r'access': PropertySchema(
      id: 0,
      name: r'access',
      type: IsarType.string,
    ),
    r'accessFreeText': PropertySchema(
      id: 1,
      name: r'accessFreeText',
      type: IsarType.string,
    ),
    r'apparentColor': PropertySchema(
      id: 2,
      name: r'apparentColor',
      type: IsarType.string,
    ),
    r'conductivity': PropertySchema(
      id: 3,
      name: r'conductivity',
      type: IsarType.double,
    ),
    r'container': PropertySchema(
      id: 4,
      name: r'container',
      type: IsarType.string,
    ),
    r'coordinates': PropertySchema(
      id: 5,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'department': PropertySchema(
      id: 6,
      name: r'department',
      type: IsarType.string,
    ),
    r'dissolvedOxygen': PropertySchema(
      id: 7,
      name: r'dissolvedOxygen',
      type: IsarType.double,
    ),
    r'firebaseId': PropertySchema(
      id: 8,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'hasSample': PropertySchema(
      id: 9,
      name: r'hasSample',
      type: IsarType.bool,
    ),
    r'municipality': PropertySchema(
      id: 10,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'odor': PropertySchema(
      id: 11,
      name: r'odor',
      type: IsarType.string,
    ),
    r'outingId': PropertySchema(
      id: 12,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'ph': PropertySchema(
      id: 13,
      name: r'ph',
      type: IsarType.double,
    ),
    r'photos': PropertySchema(
      id: 14,
      name: r'photos',
      type: IsarType.objectList,
      target: r'PhotoRecord',
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
    r'sampleId': PropertySchema(
      id: 17,
      name: r'sampleId',
      type: IsarType.string,
    ),
    r'sampleType': PropertySchema(
      id: 18,
      name: r'sampleType',
      type: IsarType.string,
    ),
    r'samplingDepth': PropertySchema(
      id: 19,
      name: r'samplingDepth',
      type: IsarType.string,
    ),
    r'samplingGoal': PropertySchema(
      id: 20,
      name: r'samplingGoal',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 21,
      name: r'sector',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 22,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'temperature': PropertySchema(
      id: 23,
      name: r'temperature',
      type: IsarType.double,
    ),
    r'turbidity': PropertySchema(
      id: 24,
      name: r'turbidity',
      type: IsarType.double,
    ),
    r'userId': PropertySchema(
      id: 25,
      name: r'userId',
      type: IsarType.string,
    ),
    r'village': PropertySchema(
      id: 26,
      name: r'village',
      type: IsarType.string,
    ),
    r'visibility': PropertySchema(
      id: 27,
      name: r'visibility',
      type: IsarType.string,
    ),
    r'weatherConditions': PropertySchema(
      id: 28,
      name: r'weatherConditions',
      type: IsarType.string,
    )
  },
  estimateSize: _waterRecordModelEstimateSize,
  serialize: _waterRecordModelSerialize,
  deserialize: _waterRecordModelDeserialize,
  deserializeProp: _waterRecordModelDeserializeProp,
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
  getId: _waterRecordModelGetId,
  getLinks: _waterRecordModelGetLinks,
  attach: _waterRecordModelAttach,
  version: '3.1.0+1',
);

int _waterRecordModelEstimateSize(
  WaterRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.access.length * 3;
  {
    final value = object.accessFreeText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.apparentColor.length * 3;
  {
    final value = object.container;
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
  bytesCount += 3 + object.department.length * 3;
  {
    final value = object.firebaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.municipality.length * 3;
  bytesCount += 3 + object.odor.length * 3;
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
  {
    final value = object.sampleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sampleType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.samplingDepth.length * 3;
  {
    final value = object.samplingGoal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.village.length * 3;
  bytesCount += 3 + object.visibility.length * 3;
  bytesCount += 3 + object.weatherConditions.length * 3;
  return bytesCount;
}

void _waterRecordModelSerialize(
  WaterRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.access);
  writer.writeString(offsets[1], object.accessFreeText);
  writer.writeString(offsets[2], object.apparentColor);
  writer.writeDouble(offsets[3], object.conductivity);
  writer.writeString(offsets[4], object.container);
  writer.writeObject<CoordinateModel>(
    offsets[5],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[6], object.department);
  writer.writeDouble(offsets[7], object.dissolvedOxygen);
  writer.writeString(offsets[8], object.firebaseId);
  writer.writeBool(offsets[9], object.hasSample);
  writer.writeString(offsets[10], object.municipality);
  writer.writeString(offsets[11], object.odor);
  writer.writeString(offsets[12], object.outingId);
  writer.writeDouble(offsets[13], object.ph);
  writer.writeObjectList<PhotoRecord>(
    offsets[14],
    allOffsets,
    PhotoRecordSchema.serialize,
    object.photos,
  );
  writer.writeString(offsets[15], object.recordId);
  writer.writeDateTime(offsets[16], object.recordedAt);
  writer.writeString(offsets[17], object.sampleId);
  writer.writeString(offsets[18], object.sampleType);
  writer.writeString(offsets[19], object.samplingDepth);
  writer.writeString(offsets[20], object.samplingGoal);
  writer.writeString(offsets[21], object.sector);
  writer.writeString(offsets[22], object.syncStatus);
  writer.writeDouble(offsets[23], object.temperature);
  writer.writeDouble(offsets[24], object.turbidity);
  writer.writeString(offsets[25], object.userId);
  writer.writeString(offsets[26], object.village);
  writer.writeString(offsets[27], object.visibility);
  writer.writeString(offsets[28], object.weatherConditions);
}

WaterRecordModel _waterRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WaterRecordModel();
  object.access = reader.readString(offsets[0]);
  object.accessFreeText = reader.readStringOrNull(offsets[1]);
  object.apparentColor = reader.readString(offsets[2]);
  object.conductivity = reader.readDoubleOrNull(offsets[3]);
  object.container = reader.readStringOrNull(offsets[4]);
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[5],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.department = reader.readString(offsets[6]);
  object.dissolvedOxygen = reader.readDoubleOrNull(offsets[7]);
  object.firebaseId = reader.readStringOrNull(offsets[8]);
  object.hasSample = reader.readBool(offsets[9]);
  object.id = id;
  object.municipality = reader.readString(offsets[10]);
  object.odor = reader.readString(offsets[11]);
  object.outingId = reader.readString(offsets[12]);
  object.ph = reader.readDoubleOrNull(offsets[13]);
  object.photos = reader.readObjectList<PhotoRecord>(
        offsets[14],
        PhotoRecordSchema.deserialize,
        allOffsets,
        PhotoRecord(),
      ) ??
      [];
  object.recordId = reader.readString(offsets[15]);
  object.recordedAt = reader.readDateTime(offsets[16]);
  object.sampleId = reader.readStringOrNull(offsets[17]);
  object.sampleType = reader.readStringOrNull(offsets[18]);
  object.samplingDepth = reader.readString(offsets[19]);
  object.samplingGoal = reader.readStringOrNull(offsets[20]);
  object.sector = reader.readString(offsets[21]);
  object.syncStatus = reader.readString(offsets[22]);
  object.temperature = reader.readDoubleOrNull(offsets[23]);
  object.turbidity = reader.readDoubleOrNull(offsets[24]);
  object.userId = reader.readString(offsets[25]);
  object.village = reader.readString(offsets[26]);
  object.visibility = reader.readString(offsets[27]);
  object.weatherConditions = reader.readString(offsets[28]);
  return object;
}

P _waterRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readObjectList<PhotoRecord>(
            offset,
            PhotoRecordSchema.deserialize,
            allOffsets,
            PhotoRecord(),
          ) ??
          []) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _waterRecordModelGetId(WaterRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _waterRecordModelGetLinks(WaterRecordModel object) {
  return [];
}

void _waterRecordModelAttach(
    IsarCollection<dynamic> col, Id id, WaterRecordModel object) {
  object.id = id;
}

extension WaterRecordModelByIndex on IsarCollection<WaterRecordModel> {
  Future<WaterRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  WaterRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<WaterRecordModel?>> getAllByRecordId(
      List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<WaterRecordModel?> getAllByRecordIdSync(List<String> recordIdValues) {
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

  Future<Id> putByRecordId(WaterRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(WaterRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<WaterRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<WaterRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension WaterRecordModelQueryWhereSort
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QWhere> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WaterRecordModelQueryWhere
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QWhereClause> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterWhereClause>
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

extension WaterRecordModelQueryFilter
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QFilterCondition> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'access',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'access',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'access',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'access',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'access',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accessFreeText',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accessFreeText',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      accessFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apparentColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apparentColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apparentColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apparentColor',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      apparentColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apparentColor',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conductivity',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conductivity',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conductivity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conductivity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conductivity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      conductivityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conductivity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'container',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'container',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'container',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'container',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'container',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'container',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      containerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'container',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dissolvedOxygen',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dissolvedOxygen',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dissolvedOxygen',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dissolvedOxygen',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dissolvedOxygen',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      dissolvedOxygenBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dissolvedOxygen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      hasSampleEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSample',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'odor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'odor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'odor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'odor',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      odorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'odor',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ph',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ph',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ph',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      phBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ph',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleId',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sampleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sampleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sampleId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sampleType',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sampleType',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sampleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sampleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sampleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sampleType',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sampleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sampleType',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'samplingDepth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'samplingDepth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'samplingDepth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'samplingDepth',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingDepthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'samplingDepth',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'samplingGoal',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'samplingGoal',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'samplingGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'samplingGoal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'samplingGoal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'samplingGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      samplingGoalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'samplingGoal',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temperature',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      temperatureBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'turbidity',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'turbidity',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'turbidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'turbidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'turbidity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      turbidityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'turbidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
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

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visibility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visibility',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      visibilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visibility',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weatherConditions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weatherConditions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weatherConditions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weatherConditions',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      weatherConditionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weatherConditions',
        value: '',
      ));
    });
  }
}

extension WaterRecordModelQueryObject
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QFilterCondition> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterFilterCondition>
      photosElement(FilterQuery<PhotoRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photos');
    });
  }
}

extension WaterRecordModelQueryLinks
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QFilterCondition> {}

extension WaterRecordModelQuerySortBy
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QSortBy> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByAccessFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessFreeText', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByAccessFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessFreeText', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByApparentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentColor', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByApparentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentColor', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByConductivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductivity', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByConductivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductivity', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'container', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'container', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByDissolvedOxygen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dissolvedOxygen', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByDissolvedOxygenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dissolvedOxygen', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy> sortByOdor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odor', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByOdorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odor', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy> sortByPh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ph', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByPhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ph', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySampleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleType', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySampleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleType', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySamplingDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingDepth', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySamplingDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingDepth', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySamplingGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingGoal', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySamplingGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingGoal', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByTurbidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turbidity', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByTurbidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turbidity', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      sortByWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.desc);
    });
  }
}

extension WaterRecordModelQuerySortThenBy
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QSortThenBy> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByAccess() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByAccessDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'access', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByAccessFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessFreeText', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByAccessFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessFreeText', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByApparentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentColor', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByApparentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apparentColor', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByConductivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductivity', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByConductivityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conductivity', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'container', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'container', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByDissolvedOxygen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dissolvedOxygen', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByDissolvedOxygenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dissolvedOxygen', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByHasSampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSample', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy> thenByOdor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odor', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByOdorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'odor', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy> thenByPh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ph', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByPhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ph', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySampleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySampleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySampleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleType', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySampleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sampleType', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySamplingDepth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingDepth', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySamplingDepthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingDepth', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySamplingGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingGoal', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySamplingGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'samplingGoal', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByTurbidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turbidity', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByTurbidityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'turbidity', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByVisibility() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByVisibilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visibility', Sort.desc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByWeatherConditions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.asc);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QAfterSortBy>
      thenByWeatherConditionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weatherConditions', Sort.desc);
    });
  }
}

extension WaterRecordModelQueryWhereDistinct
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> {
  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctByAccess(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'access', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByAccessFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByApparentColor({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apparentColor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByConductivity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conductivity');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByContainer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'container', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByDissolvedOxygen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dissolvedOxygen');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByHasSample() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSample');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctByOdor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'odor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByOutingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctByPh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ph');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByRecordId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctBySampleId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctBySampleType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sampleType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctBySamplingDepth({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'samplingDepth',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctBySamplingGoal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'samplingGoal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByTurbidity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'turbidity');
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct> distinctByVillage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByVisibility({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visibility', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WaterRecordModel, WaterRecordModel, QDistinct>
      distinctByWeatherConditions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weatherConditions',
          caseSensitive: caseSensitive);
    });
  }
}

extension WaterRecordModelQueryProperty
    on QueryBuilder<WaterRecordModel, WaterRecordModel, QQueryProperty> {
  QueryBuilder<WaterRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> accessProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'access');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations>
      accessFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessFreeText');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      apparentColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apparentColor');
    });
  }

  QueryBuilder<WaterRecordModel, double?, QQueryOperations>
      conductivityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conductivity');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations>
      containerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'container');
    });
  }

  QueryBuilder<WaterRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<WaterRecordModel, double?, QQueryOperations>
      dissolvedOxygenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dissolvedOxygen');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<WaterRecordModel, bool, QQueryOperations> hasSampleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSample');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> odorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'odor');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<WaterRecordModel, double?, QQueryOperations> phProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ph');
    });
  }

  QueryBuilder<WaterRecordModel, List<PhotoRecord>, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<WaterRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations> sampleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleId');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations>
      sampleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sampleType');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      samplingDepthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'samplingDepth');
    });
  }

  QueryBuilder<WaterRecordModel, String?, QQueryOperations>
      samplingGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'samplingGoal');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<WaterRecordModel, double?, QQueryOperations>
      temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }

  QueryBuilder<WaterRecordModel, double?, QQueryOperations>
      turbidityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'turbidity');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations> villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      visibilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visibility');
    });
  }

  QueryBuilder<WaterRecordModel, String, QQueryOperations>
      weatherConditionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weatherConditions');
    });
  }
}
