// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vegetation_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVegetationRecordModelCollection on Isar {
  IsarCollection<VegetationRecordModel> get vegetationRecordModels =>
      this.collection();
}

const VegetationRecordModelSchema = CollectionSchema(
  name: r'VegetationRecordModel',
  id: 6380956331919122936,
  properties: {
    r'canopyLength': PropertySchema(
      id: 0,
      name: r'canopyLength',
      type: IsarType.double,
    ),
    r'commonName': PropertySchema(
      id: 1,
      name: r'commonName',
      type: IsarType.string,
    ),
    r'coordinates': PropertySchema(
      id: 2,
      name: r'coordinates',
      type: IsarType.object,
      target: r'CoordinateModel',
    ),
    r'coverageDistribution': PropertySchema(
      id: 3,
      name: r'coverageDistribution',
      type: IsarType.string,
    ),
    r'coveragePercent': PropertySchema(
      id: 4,
      name: r'coveragePercent',
      type: IsarType.long,
    ),
    r'department': PropertySchema(
      id: 5,
      name: r'department',
      type: IsarType.string,
    ),
    r'diameter': PropertySchema(
      id: 6,
      name: r'diameter',
      type: IsarType.double,
    ),
    r'diameterType': PropertySchema(
      id: 7,
      name: r'diameterType',
      type: IsarType.string,
    ),
    r'firebaseId': PropertySchema(
      id: 8,
      name: r'firebaseId',
      type: IsarType.string,
    ),
    r'groundCover': PropertySchema(
      id: 9,
      name: r'groundCover',
      type: IsarType.string,
    ),
    r'hasPyrogeny': PropertySchema(
      id: 10,
      name: r'hasPyrogeny',
      type: IsarType.bool,
    ),
    r'height': PropertySchema(
      id: 11,
      name: r'height',
      type: IsarType.double,
    ),
    r'municipality': PropertySchema(
      id: 12,
      name: r'municipality',
      type: IsarType.string,
    ),
    r'origin': PropertySchema(
      id: 13,
      name: r'origin',
      type: IsarType.string,
    ),
    r'outingId': PropertySchema(
      id: 14,
      name: r'outingId',
      type: IsarType.string,
    ),
    r'photos': PropertySchema(
      id: 15,
      name: r'photos',
      type: IsarType.objectList,
      target: r'PhotoRecord',
    ),
    r'physicalCondition': PropertySchema(
      id: 16,
      name: r'physicalCondition',
      type: IsarType.string,
    ),
    r'physiognomy': PropertySchema(
      id: 17,
      name: r'physiognomy',
      type: IsarType.string,
    ),
    r'plot': PropertySchema(
      id: 18,
      name: r'plot',
      type: IsarType.object,
      target: r'PlotModel',
    ),
    r'pyrogenyDescription': PropertySchema(
      id: 19,
      name: r'pyrogenyDescription',
      type: IsarType.string,
    ),
    r'recordId': PropertySchema(
      id: 20,
      name: r'recordId',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 21,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'sector': PropertySchema(
      id: 22,
      name: r'sector',
      type: IsarType.string,
    ),
    r'speciesFreeText': PropertySchema(
      id: 23,
      name: r'speciesFreeText',
      type: IsarType.string,
    ),
    r'speciesId': PropertySchema(
      id: 24,
      name: r'speciesId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 25,
      name: r'syncStatus',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 26,
      name: r'userId',
      type: IsarType.string,
    ),
    r'vegetationType': PropertySchema(
      id: 27,
      name: r'vegetationType',
      type: IsarType.string,
    ),
    r'village': PropertySchema(
      id: 28,
      name: r'village',
      type: IsarType.string,
    )
  },
  estimateSize: _vegetationRecordModelEstimateSize,
  serialize: _vegetationRecordModelSerialize,
  deserialize: _vegetationRecordModelDeserialize,
  deserializeProp: _vegetationRecordModelDeserializeProp,
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
  getId: _vegetationRecordModelGetId,
  getLinks: _vegetationRecordModelGetLinks,
  attach: _vegetationRecordModelAttach,
  version: '3.1.0+1',
);

int _vegetationRecordModelEstimateSize(
  VegetationRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.commonName.length * 3;
  {
    final value = object.coordinates;
    if (value != null) {
      bytesCount += 3 +
          CoordinateModelSchema.estimateSize(
              value, allOffsets[CoordinateModel]!, allOffsets);
    }
  }
  {
    final value = object.coverageDistribution;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.department.length * 3;
  {
    final value = object.diameterType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firebaseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.groundCover.length * 3;
  bytesCount += 3 + object.municipality.length * 3;
  bytesCount += 3 + object.origin.length * 3;
  bytesCount += 3 + object.outingId.length * 3;
  bytesCount += 3 + object.photos.length * 3;
  {
    final offsets = allOffsets[PhotoRecord]!;
    for (var i = 0; i < object.photos.length; i++) {
      final value = object.photos[i];
      bytesCount += PhotoRecordSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.physicalCondition.length * 3;
  bytesCount += 3 + object.physiognomy.length * 3;
  {
    final value = object.plot;
    if (value != null) {
      bytesCount += 3 +
          PlotModelSchema.estimateSize(
              value, allOffsets[PlotModel]!, allOffsets);
    }
  }
  {
    final value = object.pyrogenyDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.recordId.length * 3;
  bytesCount += 3 + object.sector.length * 3;
  bytesCount += 3 + object.speciesFreeText.length * 3;
  bytesCount += 3 + object.speciesId.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.vegetationType.length * 3;
  bytesCount += 3 + object.village.length * 3;
  return bytesCount;
}

void _vegetationRecordModelSerialize(
  VegetationRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.canopyLength);
  writer.writeString(offsets[1], object.commonName);
  writer.writeObject<CoordinateModel>(
    offsets[2],
    allOffsets,
    CoordinateModelSchema.serialize,
    object.coordinates,
  );
  writer.writeString(offsets[3], object.coverageDistribution);
  writer.writeLong(offsets[4], object.coveragePercent);
  writer.writeString(offsets[5], object.department);
  writer.writeDouble(offsets[6], object.diameter);
  writer.writeString(offsets[7], object.diameterType);
  writer.writeString(offsets[8], object.firebaseId);
  writer.writeString(offsets[9], object.groundCover);
  writer.writeBool(offsets[10], object.hasPyrogeny);
  writer.writeDouble(offsets[11], object.height);
  writer.writeString(offsets[12], object.municipality);
  writer.writeString(offsets[13], object.origin);
  writer.writeString(offsets[14], object.outingId);
  writer.writeObjectList<PhotoRecord>(
    offsets[15],
    allOffsets,
    PhotoRecordSchema.serialize,
    object.photos,
  );
  writer.writeString(offsets[16], object.physicalCondition);
  writer.writeString(offsets[17], object.physiognomy);
  writer.writeObject<PlotModel>(
    offsets[18],
    allOffsets,
    PlotModelSchema.serialize,
    object.plot,
  );
  writer.writeString(offsets[19], object.pyrogenyDescription);
  writer.writeString(offsets[20], object.recordId);
  writer.writeDateTime(offsets[21], object.recordedAt);
  writer.writeString(offsets[22], object.sector);
  writer.writeString(offsets[23], object.speciesFreeText);
  writer.writeString(offsets[24], object.speciesId);
  writer.writeString(offsets[25], object.syncStatus);
  writer.writeString(offsets[26], object.userId);
  writer.writeString(offsets[27], object.vegetationType);
  writer.writeString(offsets[28], object.village);
}

VegetationRecordModel _vegetationRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VegetationRecordModel();
  object.canopyLength = reader.readDoubleOrNull(offsets[0]);
  object.commonName = reader.readString(offsets[1]);
  object.coordinates = reader.readObjectOrNull<CoordinateModel>(
    offsets[2],
    CoordinateModelSchema.deserialize,
    allOffsets,
  );
  object.coverageDistribution = reader.readStringOrNull(offsets[3]);
  object.coveragePercent = reader.readLongOrNull(offsets[4]);
  object.department = reader.readString(offsets[5]);
  object.diameter = reader.readDoubleOrNull(offsets[6]);
  object.diameterType = reader.readStringOrNull(offsets[7]);
  object.firebaseId = reader.readStringOrNull(offsets[8]);
  object.groundCover = reader.readString(offsets[9]);
  object.hasPyrogeny = reader.readBool(offsets[10]);
  object.height = reader.readDoubleOrNull(offsets[11]);
  object.id = id;
  object.municipality = reader.readString(offsets[12]);
  object.origin = reader.readString(offsets[13]);
  object.outingId = reader.readString(offsets[14]);
  object.photos = reader.readObjectList<PhotoRecord>(
        offsets[15],
        PhotoRecordSchema.deserialize,
        allOffsets,
        PhotoRecord(),
      ) ??
      [];
  object.physicalCondition = reader.readString(offsets[16]);
  object.physiognomy = reader.readString(offsets[17]);
  object.plot = reader.readObjectOrNull<PlotModel>(
    offsets[18],
    PlotModelSchema.deserialize,
    allOffsets,
  );
  object.pyrogenyDescription = reader.readStringOrNull(offsets[19]);
  object.recordId = reader.readString(offsets[20]);
  object.recordedAt = reader.readDateTime(offsets[21]);
  object.sector = reader.readString(offsets[22]);
  object.speciesFreeText = reader.readString(offsets[23]);
  object.speciesId = reader.readString(offsets[24]);
  object.syncStatus = reader.readString(offsets[25]);
  object.userId = reader.readString(offsets[26]);
  object.vegetationType = reader.readString(offsets[27]);
  object.village = reader.readString(offsets[28]);
  return object;
}

P _vegetationRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<CoordinateModel>(
        offset,
        CoordinateModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readObjectList<PhotoRecord>(
            offset,
            PhotoRecordSchema.deserialize,
            allOffsets,
            PhotoRecord(),
          ) ??
          []) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readObjectOrNull<PlotModel>(
        offset,
        PlotModelSchema.deserialize,
        allOffsets,
      )) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
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

Id _vegetationRecordModelGetId(VegetationRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vegetationRecordModelGetLinks(
    VegetationRecordModel object) {
  return [];
}

void _vegetationRecordModelAttach(
    IsarCollection<dynamic> col, Id id, VegetationRecordModel object) {
  object.id = id;
}

extension VegetationRecordModelByIndex
    on IsarCollection<VegetationRecordModel> {
  Future<VegetationRecordModel?> getByRecordId(String recordId) {
    return getByIndex(r'recordId', [recordId]);
  }

  VegetationRecordModel? getByRecordIdSync(String recordId) {
    return getByIndexSync(r'recordId', [recordId]);
  }

  Future<bool> deleteByRecordId(String recordId) {
    return deleteByIndex(r'recordId', [recordId]);
  }

  bool deleteByRecordIdSync(String recordId) {
    return deleteByIndexSync(r'recordId', [recordId]);
  }

  Future<List<VegetationRecordModel?>> getAllByRecordId(
      List<String> recordIdValues) {
    final values = recordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordId', values);
  }

  List<VegetationRecordModel?> getAllByRecordIdSync(
      List<String> recordIdValues) {
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

  Future<Id> putByRecordId(VegetationRecordModel object) {
    return putByIndex(r'recordId', object);
  }

  Id putByRecordIdSync(VegetationRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordId(List<VegetationRecordModel> objects) {
    return putAllByIndex(r'recordId', objects);
  }

  List<Id> putAllByRecordIdSync(List<VegetationRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recordId', objects, saveLinks: saveLinks);
  }
}

extension VegetationRecordModelQueryWhereSort
    on QueryBuilder<VegetationRecordModel, VegetationRecordModel, QWhere> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VegetationRecordModelQueryWhere on QueryBuilder<VegetationRecordModel,
    VegetationRecordModel, QWhereClause> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
      recordIdEqualTo(String recordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordId',
        value: [recordId],
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterWhereClause>
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

extension VegetationRecordModelQueryFilter on QueryBuilder<
    VegetationRecordModel, VegetationRecordModel, QFilterCondition> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'canopyLength',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'canopyLength',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canopyLength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canopyLength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canopyLength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> canopyLengthBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canopyLength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      commonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      commonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonName',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> commonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commonName',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coordinatesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coordinatesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coordinates',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverageDistribution',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverageDistribution',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverageDistribution',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      coverageDistributionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverageDistribution',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      coverageDistributionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverageDistribution',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverageDistribution',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coverageDistributionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverageDistribution',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coveragePercent',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coveragePercent',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coveragePercent',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coveragePercent',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coveragePercent',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coveragePercentBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coveragePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      departmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      departmentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diameter',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diameter',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diameter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diameter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diameterType',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diameterType',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diameterType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      diameterTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diameterType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      diameterTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diameterType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diameterType',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> diameterTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diameterType',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firebaseId',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      firebaseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firebaseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      firebaseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firebaseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> firebaseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firebaseId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groundCover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      groundCoverContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groundCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      groundCoverMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groundCover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groundCover',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> groundCoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groundCover',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> hasPyrogenyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasPyrogeny',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> heightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      municipalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      municipalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> municipalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipality',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'origin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      originContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      originMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'origin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> originIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      outingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      outingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> outingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outingId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosLengthEqualTo(int length) {
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosIsEmpty() {
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosIsNotEmpty() {
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosLengthLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosLengthGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosLengthBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'physicalCondition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      physicalConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'physicalCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      physicalConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'physicalCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physicalCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physicalConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'physicalCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'physiognomy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      physiognomyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'physiognomy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      physiognomyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'physiognomy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physiognomy',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> physiognomyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'physiognomy',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> plotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> plotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pyrogenyDescription',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pyrogenyDescription',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pyrogenyDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      pyrogenyDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pyrogenyDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      pyrogenyDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pyrogenyDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pyrogenyDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> pyrogenyDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pyrogenyDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      recordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      recordIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordedAtGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordedAtLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> recordedAtBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      sectorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      sectorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesFreeText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      speciesFreeTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesFreeText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      speciesFreeTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesFreeText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesFreeTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesFreeText',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      speciesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      speciesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> speciesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vegetationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      vegetationTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vegetationType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      vegetationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vegetationType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vegetationType',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> vegetationTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vegetationType',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageEqualTo(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageGreaterThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageLessThan(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageBetween(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageStartsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageEndsWith(
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

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      villageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'village',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
          QAfterFilterCondition>
      villageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'village',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'village',
        value: '',
      ));
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> villageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'village',
        value: '',
      ));
    });
  }
}

extension VegetationRecordModelQueryObject on QueryBuilder<
    VegetationRecordModel, VegetationRecordModel, QFilterCondition> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> coordinates(FilterQuery<CoordinateModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coordinates');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> photosElement(FilterQuery<PhotoRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'photos');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel,
      QAfterFilterCondition> plot(FilterQuery<PlotModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'plot');
    });
  }
}

extension VegetationRecordModelQueryLinks on QueryBuilder<VegetationRecordModel,
    VegetationRecordModel, QFilterCondition> {}

extension VegetationRecordModelQuerySortBy
    on QueryBuilder<VegetationRecordModel, VegetationRecordModel, QSortBy> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCanopyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canopyLength', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCanopyLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canopyLength', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCoverageDistribution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageDistribution', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCoverageDistributionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageDistribution', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCoveragePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coveragePercent', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByCoveragePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coveragePercent', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameter', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameter', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDiameterType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameterType', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByDiameterTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameterType', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByGroundCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groundCover', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByGroundCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groundCover', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByHasPyrogeny() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPyrogeny', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByHasPyrogenyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPyrogeny', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPhysicalCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalCondition', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPhysicalConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalCondition', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPhysiognomy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physiognomy', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPhysiognomyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physiognomy', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPyrogenyDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pyrogenyDescription', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByPyrogenyDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pyrogenyDescription', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySpeciesFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesFreeText', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySpeciesFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesFreeText', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByVegetationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetationType', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByVegetationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetationType', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      sortByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension VegetationRecordModelQuerySortThenBy
    on QueryBuilder<VegetationRecordModel, VegetationRecordModel, QSortThenBy> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCanopyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canopyLength', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCanopyLengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canopyLength', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCoverageDistribution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageDistribution', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCoverageDistributionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverageDistribution', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCoveragePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coveragePercent', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByCoveragePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coveragePercent', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameter', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDiameterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameter', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDiameterType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameterType', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByDiameterTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diameterType', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByFirebaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByFirebaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firebaseId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByGroundCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groundCover', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByGroundCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groundCover', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByHasPyrogeny() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPyrogeny', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByHasPyrogenyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasPyrogeny', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByMunicipality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByMunicipalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipality', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByOutingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByOutingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outingId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPhysicalCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalCondition', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPhysicalConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physicalCondition', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPhysiognomy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physiognomy', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPhysiognomyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'physiognomy', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPyrogenyDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pyrogenyDescription', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByPyrogenyDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pyrogenyDescription', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySpeciesFreeText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesFreeText', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySpeciesFreeTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesFreeText', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByVegetationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetationType', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByVegetationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vegetationType', Sort.desc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByVillage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.asc);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QAfterSortBy>
      thenByVillageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'village', Sort.desc);
    });
  }
}

extension VegetationRecordModelQueryWhereDistinct
    on QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct> {
  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByCanopyLength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canopyLength');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByCommonName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByCoverageDistribution({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverageDistribution',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByCoveragePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coveragePercent');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByDepartment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByDiameter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diameter');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByDiameterType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diameterType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByFirebaseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firebaseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByGroundCover({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groundCover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByHasPyrogeny() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasPyrogeny');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByMunicipality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByOrigin({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByOutingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByPhysicalCondition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'physicalCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByPhysiognomy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'physiognomy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByPyrogenyDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pyrogenyDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByRecordId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctBySector({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctBySpeciesFreeText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesFreeText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctBySpeciesId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctBySyncStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByVegetationType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vegetationType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VegetationRecordModel, VegetationRecordModel, QDistinct>
      distinctByVillage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'village', caseSensitive: caseSensitive);
    });
  }
}

extension VegetationRecordModelQueryProperty on QueryBuilder<
    VegetationRecordModel, VegetationRecordModel, QQueryProperty> {
  QueryBuilder<VegetationRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VegetationRecordModel, double?, QQueryOperations>
      canopyLengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canopyLength');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      commonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonName');
    });
  }

  QueryBuilder<VegetationRecordModel, CoordinateModel?, QQueryOperations>
      coordinatesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coordinates');
    });
  }

  QueryBuilder<VegetationRecordModel, String?, QQueryOperations>
      coverageDistributionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverageDistribution');
    });
  }

  QueryBuilder<VegetationRecordModel, int?, QQueryOperations>
      coveragePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coveragePercent');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<VegetationRecordModel, double?, QQueryOperations>
      diameterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diameter');
    });
  }

  QueryBuilder<VegetationRecordModel, String?, QQueryOperations>
      diameterTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diameterType');
    });
  }

  QueryBuilder<VegetationRecordModel, String?, QQueryOperations>
      firebaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firebaseId');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      groundCoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groundCover');
    });
  }

  QueryBuilder<VegetationRecordModel, bool, QQueryOperations>
      hasPyrogenyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasPyrogeny');
    });
  }

  QueryBuilder<VegetationRecordModel, double?, QQueryOperations>
      heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      municipalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipality');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      outingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outingId');
    });
  }

  QueryBuilder<VegetationRecordModel, List<PhotoRecord>, QQueryOperations>
      photosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photos');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      physicalConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'physicalCondition');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      physiognomyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'physiognomy');
    });
  }

  QueryBuilder<VegetationRecordModel, PlotModel?, QQueryOperations>
      plotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plot');
    });
  }

  QueryBuilder<VegetationRecordModel, String?, QQueryOperations>
      pyrogenyDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pyrogenyDescription');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      recordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordId');
    });
  }

  QueryBuilder<VegetationRecordModel, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      speciesFreeTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesFreeText');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      speciesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesId');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      vegetationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vegetationType');
    });
  }

  QueryBuilder<VegetationRecordModel, String, QQueryOperations>
      villageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'village');
    });
  }
}
