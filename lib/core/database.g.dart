// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientCollectionCollection on Isar {
  IsarCollection<PatientCollection> get patientCollections => this.collection();
}

const PatientCollectionSchema = CollectionSchema(
  name: r'PatientCollection',
  id: 8833788203413140484,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'bloodGroup': PropertySchema(
      id: 1,
      name: r'bloodGroup',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 4,
      name: r'gender',
      type: IsarType.string,
    ),
    r'height': PropertySchema(
      id: 5,
      name: r'height',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nationality': PropertySchema(
      id: 7,
      name: r'nationality',
      type: IsarType.string,
    ),
    r'passportNumber': PropertySchema(
      id: 8,
      name: r'passportNumber',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 9,
      name: r'phone',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 10,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'weight': PropertySchema(
      id: 12,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _patientCollectionEstimateSize,
  serialize: _patientCollectionSerialize,
  deserialize: _patientCollectionDeserialize,
  deserializeProp: _patientCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'passportNumber': IndexSchema(
      id: 4565258091684131305,
      name: r'passportNumber',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'passportNumber',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    ),
    r'phone': IndexSchema(
      id: -6308098324157559207,
      name: r'phone',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'phone',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _patientCollectionGetId,
  getLinks: _patientCollectionGetLinks,
  attach: _patientCollectionAttach,
  version: '3.1.0+1',
);

int _patientCollectionEstimateSize(
  PatientCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bloodGroup.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.gender.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.nationality.length * 3;
  bytesCount += 3 + object.passportNumber.length * 3;
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _patientCollectionSerialize(
  PatientCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.bloodGroup);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.email);
  writer.writeString(offsets[4], object.gender);
  writer.writeDouble(offsets[5], object.height);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.nationality);
  writer.writeString(offsets[8], object.passportNumber);
  writer.writeString(offsets[9], object.phone);
  writer.writeString(offsets[10], object.photoPath);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeDouble(offsets[12], object.weight);
}

PatientCollection _patientCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PatientCollection();
  object.age = reader.readLong(offsets[0]);
  object.bloodGroup = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.email = reader.readStringOrNull(offsets[3]);
  object.gender = reader.readString(offsets[4]);
  object.height = reader.readDouble(offsets[5]);
  object.id = id;
  object.name = reader.readString(offsets[6]);
  object.nationality = reader.readString(offsets[7]);
  object.passportNumber = reader.readString(offsets[8]);
  object.phone = reader.readStringOrNull(offsets[9]);
  object.photoPath = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.weight = reader.readDouble(offsets[12]);
  return object;
}

P _patientCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientCollectionGetId(PatientCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientCollectionGetLinks(
    PatientCollection object) {
  return [];
}

void _patientCollectionAttach(
    IsarCollection<dynamic> col, Id id, PatientCollection object) {
  object.id = id;
}

extension PatientCollectionByIndex on IsarCollection<PatientCollection> {
  Future<PatientCollection?> getByPassportNumber(String passportNumber) {
    return getByIndex(r'passportNumber', [passportNumber]);
  }

  PatientCollection? getByPassportNumberSync(String passportNumber) {
    return getByIndexSync(r'passportNumber', [passportNumber]);
  }

  Future<bool> deleteByPassportNumber(String passportNumber) {
    return deleteByIndex(r'passportNumber', [passportNumber]);
  }

  bool deleteByPassportNumberSync(String passportNumber) {
    return deleteByIndexSync(r'passportNumber', [passportNumber]);
  }

  Future<List<PatientCollection?>> getAllByPassportNumber(
      List<String> passportNumberValues) {
    final values = passportNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'passportNumber', values);
  }

  List<PatientCollection?> getAllByPassportNumberSync(
      List<String> passportNumberValues) {
    final values = passportNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'passportNumber', values);
  }

  Future<int> deleteAllByPassportNumber(List<String> passportNumberValues) {
    final values = passportNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'passportNumber', values);
  }

  int deleteAllByPassportNumberSync(List<String> passportNumberValues) {
    final values = passportNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'passportNumber', values);
  }

  Future<Id> putByPassportNumber(PatientCollection object) {
    return putByIndex(r'passportNumber', object);
  }

  Id putByPassportNumberSync(PatientCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'passportNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPassportNumber(List<PatientCollection> objects) {
    return putAllByIndex(r'passportNumber', objects);
  }

  List<Id> putAllByPassportNumberSync(List<PatientCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'passportNumber', objects, saveLinks: saveLinks);
  }
}

extension PatientCollectionQueryWhereSort
    on QueryBuilder<PatientCollection, PatientCollection, QWhere> {
  QueryBuilder<PatientCollection, PatientCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PatientCollectionQueryWhere
    on QueryBuilder<PatientCollection, PatientCollection, QWhereClause> {
  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      passportNumberEqualTo(String passportNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'passportNumber',
        value: [passportNumber],
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      passportNumberNotEqualTo(String passportNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passportNumber',
              lower: [],
              upper: [passportNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passportNumber',
              lower: [passportNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passportNumber',
              lower: [passportNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'passportNumber',
              lower: [],
              upper: [passportNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phone',
        value: [null],
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phone',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      phoneEqualTo(String? phone) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phone',
        value: [phone],
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterWhereClause>
      phoneNotEqualTo(String? phone) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [],
              upper: [phone],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [phone],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [phone],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [],
              upper: [phone],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PatientCollectionQueryFilter
    on QueryBuilder<PatientCollection, PatientCollection, QFilterCondition> {
  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      ageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodGroup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      bloodGroupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      heightEqualTo(
    double value, {
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      heightGreaterThan(
    double value, {
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      heightLessThan(
    double value, {
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      heightBetween(
    double lower,
    double upper, {
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
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

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      nationalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passportNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passportNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passportNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      passportNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passportNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      weightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      weightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      weightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterFilterCondition>
      weightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PatientCollectionQueryObject
    on QueryBuilder<PatientCollection, PatientCollection, QFilterCondition> {}

extension PatientCollectionQueryLinks
    on QueryBuilder<PatientCollection, PatientCollection, QFilterCondition> {}

extension PatientCollectionQuerySortBy
    on QueryBuilder<PatientCollection, PatientCollection, QSortBy> {
  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByBloodGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByBloodGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPassportNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passportNumber', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPassportNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passportNumber', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PatientCollectionQuerySortThenBy
    on QueryBuilder<PatientCollection, PatientCollection, QSortThenBy> {
  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByBloodGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByBloodGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bloodGroup', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPassportNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passportNumber', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPassportNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passportNumber', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QAfterSortBy>
      thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension PatientCollectionQueryWhereDistinct
    on QueryBuilder<PatientCollection, PatientCollection, QDistinct> {
  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByBloodGroup({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bloodGroup', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByGender({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByNationality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByPassportNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passportNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByPhotoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<PatientCollection, PatientCollection, QDistinct>
      distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension PatientCollectionQueryProperty
    on QueryBuilder<PatientCollection, PatientCollection, QQueryProperty> {
  QueryBuilder<PatientCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PatientCollection, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<PatientCollection, String, QQueryOperations>
      bloodGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bloodGroup');
    });
  }

  QueryBuilder<PatientCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PatientCollection, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<PatientCollection, String, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<PatientCollection, double, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<PatientCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PatientCollection, String, QQueryOperations>
      nationalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationality');
    });
  }

  QueryBuilder<PatientCollection, String, QQueryOperations>
      passportNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passportNumber');
    });
  }

  QueryBuilder<PatientCollection, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<PatientCollection, String?, QQueryOperations>
      photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<PatientCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<PatientCollection, double, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReportCollectionCollection on Isar {
  IsarCollection<ReportCollection> get reportCollections => this.collection();
}

const ReportCollectionSchema = CollectionSchema(
  name: r'ReportCollection',
  id: 8738112808998542124,
  properties: {
    r'clinicId': PropertySchema(
      id: 0,
      name: r'clinicId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'doctorId': PropertySchema(
      id: 2,
      name: r'doctorId',
      type: IsarType.long,
    ),
    r'examDate': PropertySchema(
      id: 3,
      name: r'examDate',
      type: IsarType.dateTime,
    ),
    r'labInvestigation': PropertySchema(
      id: 4,
      name: r'labInvestigation',
      type: IsarType.object,
      target: r'LabInvestigationEmbed',
    ),
    r'medicalExam': PropertySchema(
      id: 5,
      name: r'medicalExam',
      type: IsarType.object,
      target: r'MedicalExamEmbed',
    ),
    r'patientId': PropertySchema(
      id: 6,
      name: r'patientId',
      type: IsarType.long,
    ),
    r'patientInfo': PropertySchema(
      id: 7,
      name: r'patientInfo',
      type: IsarType.object,
      target: r'PatientInfoEmbed',
    ),
    r'pdfPath': PropertySchema(
      id: 8,
      name: r'pdfPath',
      type: IsarType.string,
    ),
    r'remarks': PropertySchema(
      id: 9,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'serialNumber': PropertySchema(
      id: 10,
      name: r'serialNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'templateId': PropertySchema(
      id: 12,
      name: r'templateId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _reportCollectionEstimateSize,
  serialize: _reportCollectionSerialize,
  deserialize: _reportCollectionDeserialize,
  deserializeProp: _reportCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'serialNumber': IndexSchema(
      id: 135203776617746534,
      name: r'serialNumber',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'serialNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'examDate': IndexSchema(
      id: 1028411097148556109,
      name: r'examDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'examDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'patientId': IndexSchema(
      id: 403389457658259617,
      name: r'patientId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'patientId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'PatientInfoEmbed': PatientInfoEmbedSchema,
    r'MedicalExamEmbed': MedicalExamEmbedSchema,
    r'LabInvestigationEmbed': LabInvestigationEmbedSchema
  },
  getId: _reportCollectionGetId,
  getLinks: _reportCollectionGetLinks,
  attach: _reportCollectionAttach,
  version: '3.1.0+1',
);

int _reportCollectionEstimateSize(
  ReportCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.labInvestigation;
    if (value != null) {
      bytesCount += 3 +
          LabInvestigationEmbedSchema.estimateSize(
              value, allOffsets[LabInvestigationEmbed]!, allOffsets);
    }
  }
  {
    final value = object.medicalExam;
    if (value != null) {
      bytesCount += 3 +
          MedicalExamEmbedSchema.estimateSize(
              value, allOffsets[MedicalExamEmbed]!, allOffsets);
    }
  }
  {
    final value = object.patientInfo;
    if (value != null) {
      bytesCount += 3 +
          PatientInfoEmbedSchema.estimateSize(
              value, allOffsets[PatientInfoEmbed]!, allOffsets);
    }
  }
  {
    final value = object.pdfPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.serialNumber.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.templateId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _reportCollectionSerialize(
  ReportCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clinicId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.doctorId);
  writer.writeDateTime(offsets[3], object.examDate);
  writer.writeObject<LabInvestigationEmbed>(
    offsets[4],
    allOffsets,
    LabInvestigationEmbedSchema.serialize,
    object.labInvestigation,
  );
  writer.writeObject<MedicalExamEmbed>(
    offsets[5],
    allOffsets,
    MedicalExamEmbedSchema.serialize,
    object.medicalExam,
  );
  writer.writeLong(offsets[6], object.patientId);
  writer.writeObject<PatientInfoEmbed>(
    offsets[7],
    allOffsets,
    PatientInfoEmbedSchema.serialize,
    object.patientInfo,
  );
  writer.writeString(offsets[8], object.pdfPath);
  writer.writeString(offsets[9], object.remarks);
  writer.writeString(offsets[10], object.serialNumber);
  writer.writeString(offsets[11], object.status);
  writer.writeString(offsets[12], object.templateId);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

ReportCollection _reportCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReportCollection();
  object.clinicId = reader.readLong(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.doctorId = reader.readLong(offsets[2]);
  object.examDate = reader.readDateTime(offsets[3]);
  object.id = id;
  object.labInvestigation = reader.readObjectOrNull<LabInvestigationEmbed>(
    offsets[4],
    LabInvestigationEmbedSchema.deserialize,
    allOffsets,
  );
  object.medicalExam = reader.readObjectOrNull<MedicalExamEmbed>(
    offsets[5],
    MedicalExamEmbedSchema.deserialize,
    allOffsets,
  );
  object.patientId = reader.readLong(offsets[6]);
  object.patientInfo = reader.readObjectOrNull<PatientInfoEmbed>(
    offsets[7],
    PatientInfoEmbedSchema.deserialize,
    allOffsets,
  );
  object.pdfPath = reader.readStringOrNull(offsets[8]);
  object.remarks = reader.readStringOrNull(offsets[9]);
  object.serialNumber = reader.readString(offsets[10]);
  object.status = reader.readString(offsets[11]);
  object.templateId = reader.readStringOrNull(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  return object;
}

P _reportCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<LabInvestigationEmbed>(
        offset,
        LabInvestigationEmbedSchema.deserialize,
        allOffsets,
      )) as P;
    case 5:
      return (reader.readObjectOrNull<MedicalExamEmbed>(
        offset,
        MedicalExamEmbedSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<PatientInfoEmbed>(
        offset,
        PatientInfoEmbedSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reportCollectionGetId(ReportCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reportCollectionGetLinks(ReportCollection object) {
  return [];
}

void _reportCollectionAttach(
    IsarCollection<dynamic> col, Id id, ReportCollection object) {
  object.id = id;
}

extension ReportCollectionByIndex on IsarCollection<ReportCollection> {
  Future<ReportCollection?> getBySerialNumber(String serialNumber) {
    return getByIndex(r'serialNumber', [serialNumber]);
  }

  ReportCollection? getBySerialNumberSync(String serialNumber) {
    return getByIndexSync(r'serialNumber', [serialNumber]);
  }

  Future<bool> deleteBySerialNumber(String serialNumber) {
    return deleteByIndex(r'serialNumber', [serialNumber]);
  }

  bool deleteBySerialNumberSync(String serialNumber) {
    return deleteByIndexSync(r'serialNumber', [serialNumber]);
  }

  Future<List<ReportCollection?>> getAllBySerialNumber(
      List<String> serialNumberValues) {
    final values = serialNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'serialNumber', values);
  }

  List<ReportCollection?> getAllBySerialNumberSync(
      List<String> serialNumberValues) {
    final values = serialNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'serialNumber', values);
  }

  Future<int> deleteAllBySerialNumber(List<String> serialNumberValues) {
    final values = serialNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'serialNumber', values);
  }

  int deleteAllBySerialNumberSync(List<String> serialNumberValues) {
    final values = serialNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'serialNumber', values);
  }

  Future<Id> putBySerialNumber(ReportCollection object) {
    return putByIndex(r'serialNumber', object);
  }

  Id putBySerialNumberSync(ReportCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'serialNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySerialNumber(List<ReportCollection> objects) {
    return putAllByIndex(r'serialNumber', objects);
  }

  List<Id> putAllBySerialNumberSync(List<ReportCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'serialNumber', objects, saveLinks: saveLinks);
  }
}

extension ReportCollectionQueryWhereSort
    on QueryBuilder<ReportCollection, ReportCollection, QWhere> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhere> anyExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'examDate'),
      );
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhere> anyPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'patientId'),
      );
    });
  }
}

extension ReportCollectionQueryWhere
    on QueryBuilder<ReportCollection, ReportCollection, QWhereClause> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
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

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      serialNumberEqualTo(String serialNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'serialNumber',
        value: [serialNumber],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      serialNumberNotEqualTo(String serialNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serialNumber',
              lower: [],
              upper: [serialNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serialNumber',
              lower: [serialNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serialNumber',
              lower: [serialNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'serialNumber',
              lower: [],
              upper: [serialNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      examDateEqualTo(DateTime examDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'examDate',
        value: [examDate],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      examDateNotEqualTo(DateTime examDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [],
              upper: [examDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [examDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [examDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examDate',
              lower: [],
              upper: [examDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      examDateGreaterThan(
    DateTime examDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [examDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      examDateLessThan(
    DateTime examDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [],
        upper: [examDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      examDateBetween(
    DateTime lowerExamDate,
    DateTime upperExamDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'examDate',
        lower: [lowerExamDate],
        includeLower: includeLower,
        upper: [upperExamDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      statusEqualTo(String status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      statusNotEqualTo(String status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      patientIdEqualTo(int patientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [patientId],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      patientIdNotEqualTo(int patientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      patientIdGreaterThan(
    int patientId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [patientId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      patientIdLessThan(
    int patientId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [],
        upper: [patientId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterWhereClause>
      patientIdBetween(
    int lowerPatientId,
    int upperPatientId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [lowerPatientId],
        includeLower: includeLower,
        upper: [upperPatientId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReportCollectionQueryFilter
    on QueryBuilder<ReportCollection, ReportCollection, QFilterCondition> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      clinicIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinicId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      clinicIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clinicId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      clinicIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clinicId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      clinicIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clinicId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      doctorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doctorId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      doctorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doctorId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      doctorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doctorId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      doctorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doctorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      examDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      examDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      examDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      examDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
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

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
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

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
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

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      labInvestigationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'labInvestigation',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      labInvestigationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'labInvestigation',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      medicalExamIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medicalExam',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      medicalExamIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medicalExam',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patientInfo',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patientInfo',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdfPath',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdfPath',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdfPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdfPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      pdfPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdfPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serialNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serialNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serialNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      serialNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serialNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'templateId',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'templateId',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'templateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'templateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      templateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'templateId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReportCollectionQueryObject
    on QueryBuilder<ReportCollection, ReportCollection, QFilterCondition> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      labInvestigation(FilterQuery<LabInvestigationEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'labInvestigation');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      medicalExam(FilterQuery<MedicalExamEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'medicalExam');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterFilterCondition>
      patientInfo(FilterQuery<PatientInfoEmbed> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'patientInfo');
    });
  }
}

extension ReportCollectionQueryLinks
    on QueryBuilder<ReportCollection, ReportCollection, QFilterCondition> {}

extension ReportCollectionQuerySortBy
    on QueryBuilder<ReportCollection, ReportCollection, QSortBy> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByClinicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByClinicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByDoctorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByDoctorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByExamDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByPdfPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByPdfPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortBySerialNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumber', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortBySerialNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumber', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ReportCollectionQuerySortThenBy
    on QueryBuilder<ReportCollection, ReportCollection, QSortThenBy> {
  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByClinicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByClinicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clinicId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByDoctorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByDoctorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doctorId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByExamDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examDate', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByPdfPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByPdfPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenBySerialNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumber', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenBySerialNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNumber', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ReportCollectionQueryWhereDistinct
    on QueryBuilder<ReportCollection, ReportCollection, QDistinct> {
  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByClinicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clinicId');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByDoctorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doctorId');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByExamDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examDate');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId');
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct> distinctByPdfPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdfPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctBySerialNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByTemplateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'templateId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReportCollection, ReportCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ReportCollectionQueryProperty
    on QueryBuilder<ReportCollection, ReportCollection, QQueryProperty> {
  QueryBuilder<ReportCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReportCollection, int, QQueryOperations> clinicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clinicId');
    });
  }

  QueryBuilder<ReportCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ReportCollection, int, QQueryOperations> doctorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doctorId');
    });
  }

  QueryBuilder<ReportCollection, DateTime, QQueryOperations>
      examDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examDate');
    });
  }

  QueryBuilder<ReportCollection, LabInvestigationEmbed?, QQueryOperations>
      labInvestigationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'labInvestigation');
    });
  }

  QueryBuilder<ReportCollection, MedicalExamEmbed?, QQueryOperations>
      medicalExamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicalExam');
    });
  }

  QueryBuilder<ReportCollection, int, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }

  QueryBuilder<ReportCollection, PatientInfoEmbed?, QQueryOperations>
      patientInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientInfo');
    });
  }

  QueryBuilder<ReportCollection, String?, QQueryOperations> pdfPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdfPath');
    });
  }

  QueryBuilder<ReportCollection, String?, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<ReportCollection, String, QQueryOperations>
      serialNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNumber');
    });
  }

  QueryBuilder<ReportCollection, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ReportCollection, String?, QQueryOperations>
      templateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'templateId');
    });
  }

  QueryBuilder<ReportCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDoctorCollectionCollection on Isar {
  IsarCollection<DoctorCollection> get doctorCollections => this.collection();
}

const DoctorCollectionSchema = CollectionSchema(
  name: r'DoctorCollection',
  id: 7772516448608777662,
  properties: {
    r'designation': PropertySchema(
      id: 0,
      name: r'designation',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'qualifications': PropertySchema(
      id: 3,
      name: r'qualifications',
      type: IsarType.string,
    ),
    r'signaturePath': PropertySchema(
      id: 4,
      name: r'signaturePath',
      type: IsarType.string,
    )
  },
  estimateSize: _doctorCollectionEstimateSize,
  serialize: _doctorCollectionSerialize,
  deserialize: _doctorCollectionDeserialize,
  deserializeProp: _doctorCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _doctorCollectionGetId,
  getLinks: _doctorCollectionGetLinks,
  attach: _doctorCollectionAttach,
  version: '3.1.0+1',
);

int _doctorCollectionEstimateSize(
  DoctorCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.designation.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.qualifications.length * 3;
  {
    final value = object.signaturePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _doctorCollectionSerialize(
  DoctorCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.designation);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.qualifications);
  writer.writeString(offsets[4], object.signaturePath);
}

DoctorCollection _doctorCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DoctorCollection();
  object.designation = reader.readString(offsets[0]);
  object.id = id;
  object.isActive = reader.readBool(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.qualifications = reader.readString(offsets[3]);
  object.signaturePath = reader.readStringOrNull(offsets[4]);
  return object;
}

P _doctorCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _doctorCollectionGetId(DoctorCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _doctorCollectionGetLinks(DoctorCollection object) {
  return [];
}

void _doctorCollectionAttach(
    IsarCollection<dynamic> col, Id id, DoctorCollection object) {
  object.id = id;
}

extension DoctorCollectionQueryWhereSort
    on QueryBuilder<DoctorCollection, DoctorCollection, QWhere> {
  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DoctorCollectionQueryWhere
    on QueryBuilder<DoctorCollection, DoctorCollection, QWhereClause> {
  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause>
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

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DoctorCollectionQueryFilter
    on QueryBuilder<DoctorCollection, DoctorCollection, QFilterCondition> {
  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'designation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'designation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'designation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'designation',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      designationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'designation',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
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

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
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

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
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

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qualifications',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qualifications',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qualifications',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qualifications',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      qualificationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qualifications',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signaturePath',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signaturePath',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signaturePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signaturePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePath',
        value: '',
      ));
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterFilterCondition>
      signaturePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signaturePath',
        value: '',
      ));
    });
  }
}

extension DoctorCollectionQueryObject
    on QueryBuilder<DoctorCollection, DoctorCollection, QFilterCondition> {}

extension DoctorCollectionQueryLinks
    on QueryBuilder<DoctorCollection, DoctorCollection, QFilterCondition> {}

extension DoctorCollectionQuerySortBy
    on QueryBuilder<DoctorCollection, DoctorCollection, QSortBy> {
  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByDesignation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByDesignationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByQualifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qualifications', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortByQualificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qualifications', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortBySignaturePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      sortBySignaturePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.desc);
    });
  }
}

extension DoctorCollectionQuerySortThenBy
    on QueryBuilder<DoctorCollection, DoctorCollection, QSortThenBy> {
  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByDesignation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByDesignationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'designation', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByQualifications() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qualifications', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenByQualificationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qualifications', Sort.desc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenBySignaturePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.asc);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QAfterSortBy>
      thenBySignaturePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.desc);
    });
  }
}

extension DoctorCollectionQueryWhereDistinct
    on QueryBuilder<DoctorCollection, DoctorCollection, QDistinct> {
  QueryBuilder<DoctorCollection, DoctorCollection, QDistinct>
      distinctByDesignation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'designation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QDistinct>
      distinctByQualifications({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qualifications',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DoctorCollection, DoctorCollection, QDistinct>
      distinctBySignaturePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signaturePath',
          caseSensitive: caseSensitive);
    });
  }
}

extension DoctorCollectionQueryProperty
    on QueryBuilder<DoctorCollection, DoctorCollection, QQueryProperty> {
  QueryBuilder<DoctorCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DoctorCollection, String, QQueryOperations>
      designationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'designation');
    });
  }

  QueryBuilder<DoctorCollection, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<DoctorCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DoctorCollection, String, QQueryOperations>
      qualificationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qualifications');
    });
  }

  QueryBuilder<DoctorCollection, String?, QQueryOperations>
      signaturePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signaturePath');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClinicCollectionCollection on Isar {
  IsarCollection<ClinicCollection> get clinicCollections => this.collection();
}

const ClinicCollectionSchema = CollectionSchema(
  name: r'ClinicCollection',
  id: 8240724543572261545,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'logoPath': PropertySchema(
      id: 2,
      name: r'logoPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'registrationNumbers': PropertySchema(
      id: 5,
      name: r'registrationNumbers',
      type: IsarType.string,
    ),
    r'stampPath': PropertySchema(
      id: 6,
      name: r'stampPath',
      type: IsarType.string,
    ),
    r'subtitle': PropertySchema(
      id: 7,
      name: r'subtitle',
      type: IsarType.string,
    )
  },
  estimateSize: _clinicCollectionEstimateSize,
  serialize: _clinicCollectionSerialize,
  deserialize: _clinicCollectionDeserialize,
  deserializeProp: _clinicCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _clinicCollectionGetId,
  getLinks: _clinicCollectionGetLinks,
  attach: _clinicCollectionAttach,
  version: '3.1.0+1',
);

int _clinicCollectionEstimateSize(
  ClinicCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.registrationNumbers;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stampPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subtitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _clinicCollectionSerialize(
  ClinicCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.email);
  writer.writeString(offsets[2], object.logoPath);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.phone);
  writer.writeString(offsets[5], object.registrationNumbers);
  writer.writeString(offsets[6], object.stampPath);
  writer.writeString(offsets[7], object.subtitle);
}

ClinicCollection _clinicCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClinicCollection();
  object.address = reader.readString(offsets[0]);
  object.email = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.logoPath = reader.readStringOrNull(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.phone = reader.readStringOrNull(offsets[4]);
  object.registrationNumbers = reader.readStringOrNull(offsets[5]);
  object.stampPath = reader.readStringOrNull(offsets[6]);
  object.subtitle = reader.readStringOrNull(offsets[7]);
  return object;
}

P _clinicCollectionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clinicCollectionGetId(ClinicCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clinicCollectionGetLinks(ClinicCollection object) {
  return [];
}

void _clinicCollectionAttach(
    IsarCollection<dynamic> col, Id id, ClinicCollection object) {
  object.id = id;
}

extension ClinicCollectionQueryWhereSort
    on QueryBuilder<ClinicCollection, ClinicCollection, QWhere> {
  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClinicCollectionQueryWhere
    on QueryBuilder<ClinicCollection, ClinicCollection, QWhereClause> {
  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhereClause>
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

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterWhereClause> idBetween(
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
}

extension ClinicCollectionQueryFilter
    on QueryBuilder<ClinicCollection, ClinicCollection, QFilterCondition> {
  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
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

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
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

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
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

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      logoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationNumbers',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationNumbers',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationNumbers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'registrationNumbers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'registrationNumbers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationNumbers',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      registrationNumbersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'registrationNumbers',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stampPath',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stampPath',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stampPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stampPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stampPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      stampPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stampPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtitle',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtitle',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: '',
      ));
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterFilterCondition>
      subtitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtitle',
        value: '',
      ));
    });
  }
}

extension ClinicCollectionQueryObject
    on QueryBuilder<ClinicCollection, ClinicCollection, QFilterCondition> {}

extension ClinicCollectionQueryLinks
    on QueryBuilder<ClinicCollection, ClinicCollection, QFilterCondition> {}

extension ClinicCollectionQuerySortBy
    on QueryBuilder<ClinicCollection, ClinicCollection, QSortBy> {
  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByRegistrationNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumbers', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByRegistrationNumbersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumbers', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByStampPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortByStampPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortBySubtitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitle', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      sortBySubtitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitle', Sort.desc);
    });
  }
}

extension ClinicCollectionQuerySortThenBy
    on QueryBuilder<ClinicCollection, ClinicCollection, QSortThenBy> {
  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByRegistrationNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumbers', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByRegistrationNumbersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNumbers', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByStampPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenByStampPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.desc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenBySubtitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitle', Sort.asc);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QAfterSortBy>
      thenBySubtitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtitle', Sort.desc);
    });
  }
}

extension ClinicCollectionQueryWhereDistinct
    on QueryBuilder<ClinicCollection, ClinicCollection, QDistinct> {
  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct>
      distinctByLogoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct>
      distinctByRegistrationNumbers({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationNumbers',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct>
      distinctByStampPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stampPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClinicCollection, ClinicCollection, QDistinct>
      distinctBySubtitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtitle', caseSensitive: caseSensitive);
    });
  }
}

extension ClinicCollectionQueryProperty
    on QueryBuilder<ClinicCollection, ClinicCollection, QQueryProperty> {
  QueryBuilder<ClinicCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClinicCollection, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations> logoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoPath');
    });
  }

  QueryBuilder<ClinicCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations>
      registrationNumbersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationNumbers');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations>
      stampPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stampPath');
    });
  }

  QueryBuilder<ClinicCollection, String?, QQueryOperations> subtitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtitle');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTemplateCollectionCollection on Isar {
  IsarCollection<TemplateCollection> get templateCollections =>
      this.collection();
}

const TemplateCollectionSchema = CollectionSchema(
  name: r'TemplateCollection',
  id: -4094051142176530049,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'isDefault': PropertySchema(
      id: 2,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'layoutJson': PropertySchema(
      id: 3,
      name: r'layoutJson',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _templateCollectionEstimateSize,
  serialize: _templateCollectionSerialize,
  deserialize: _templateCollectionDeserialize,
  deserializeProp: _templateCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _templateCollectionGetId,
  getLinks: _templateCollectionGetLinks,
  attach: _templateCollectionAttach,
  version: '3.1.0+1',
);

int _templateCollectionEstimateSize(
  TemplateCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.layoutJson.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _templateCollectionSerialize(
  TemplateCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.description);
  writer.writeBool(offsets[2], object.isDefault);
  writer.writeString(offsets[3], object.layoutJson);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.type);
}

TemplateCollection _templateCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TemplateCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.isDefault = reader.readBool(offsets[2]);
  object.layoutJson = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.type = reader.readString(offsets[5]);
  return object;
}

P _templateCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _templateCollectionGetId(TemplateCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _templateCollectionGetLinks(
    TemplateCollection object) {
  return [];
}

void _templateCollectionAttach(
    IsarCollection<dynamic> col, Id id, TemplateCollection object) {
  object.id = id;
}

extension TemplateCollectionQueryWhereSort
    on QueryBuilder<TemplateCollection, TemplateCollection, QWhere> {
  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TemplateCollectionQueryWhere
    on QueryBuilder<TemplateCollection, TemplateCollection, QWhereClause> {
  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
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

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
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

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TemplateCollectionQueryFilter
    on QueryBuilder<TemplateCollection, TemplateCollection, QFilterCondition> {
  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
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

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
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

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
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

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layoutJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'layoutJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'layoutJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutJson',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      layoutJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'layoutJson',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension TemplateCollectionQueryObject
    on QueryBuilder<TemplateCollection, TemplateCollection, QFilterCondition> {}

extension TemplateCollectionQueryLinks
    on QueryBuilder<TemplateCollection, TemplateCollection, QFilterCondition> {}

extension TemplateCollectionQuerySortBy
    on QueryBuilder<TemplateCollection, TemplateCollection, QSortBy> {
  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByLayoutJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutJson', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByLayoutJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutJson', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TemplateCollectionQuerySortThenBy
    on QueryBuilder<TemplateCollection, TemplateCollection, QSortThenBy> {
  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByLayoutJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutJson', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByLayoutJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layoutJson', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TemplateCollectionQueryWhereDistinct
    on QueryBuilder<TemplateCollection, TemplateCollection, QDistinct> {
  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByLayoutJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layoutJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TemplateCollection, TemplateCollection, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension TemplateCollectionQueryProperty
    on QueryBuilder<TemplateCollection, TemplateCollection, QQueryProperty> {
  QueryBuilder<TemplateCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TemplateCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TemplateCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TemplateCollection, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<TemplateCollection, String, QQueryOperations>
      layoutJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layoutJson');
    });
  }

  QueryBuilder<TemplateCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TemplateCollection, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollectionCollection on Isar {
  IsarCollection<SettingsCollection> get settingsCollections =>
      this.collection();
}

const SettingsCollectionSchema = CollectionSchema(
  name: r'SettingsCollection',
  id: 1768772991470096974,
  properties: {
    r'key': PropertySchema(
      id: 0,
      name: r'key',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _settingsCollectionEstimateSize,
  serialize: _settingsCollectionSerialize,
  deserialize: _settingsCollectionDeserialize,
  deserializeProp: _settingsCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'key': IndexSchema(
      id: -4906094122524121629,
      name: r'key',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'key',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _settingsCollectionGetId,
  getLinks: _settingsCollectionGetLinks,
  attach: _settingsCollectionAttach,
  version: '3.1.0+1',
);

int _settingsCollectionEstimateSize(
  SettingsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.key.length * 3;
  bytesCount += 3 + object.value.length * 3;
  return bytesCount;
}

void _settingsCollectionSerialize(
  SettingsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.key);
  writer.writeString(offsets[1], object.value);
}

SettingsCollection _settingsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsCollection();
  object.id = id;
  object.key = reader.readString(offsets[0]);
  object.value = reader.readString(offsets[1]);
  return object;
}

P _settingsCollectionDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsCollectionGetId(SettingsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsCollectionGetLinks(
    SettingsCollection object) {
  return [];
}

void _settingsCollectionAttach(
    IsarCollection<dynamic> col, Id id, SettingsCollection object) {
  object.id = id;
}

extension SettingsCollectionByIndex on IsarCollection<SettingsCollection> {
  Future<SettingsCollection?> getByKey(String key) {
    return getByIndex(r'key', [key]);
  }

  SettingsCollection? getByKeySync(String key) {
    return getByIndexSync(r'key', [key]);
  }

  Future<bool> deleteByKey(String key) {
    return deleteByIndex(r'key', [key]);
  }

  bool deleteByKeySync(String key) {
    return deleteByIndexSync(r'key', [key]);
  }

  Future<List<SettingsCollection?>> getAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndex(r'key', values);
  }

  List<SettingsCollection?> getAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'key', values);
  }

  Future<int> deleteAllByKey(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'key', values);
  }

  int deleteAllByKeySync(List<String> keyValues) {
    final values = keyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'key', values);
  }

  Future<Id> putByKey(SettingsCollection object) {
    return putByIndex(r'key', object);
  }

  Id putByKeySync(SettingsCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'key', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKey(List<SettingsCollection> objects) {
    return putAllByIndex(r'key', objects);
  }

  List<Id> putAllByKeySync(List<SettingsCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'key', objects, saveLinks: saveLinks);
  }
}

extension SettingsCollectionQueryWhereSort
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhere> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsCollectionQueryWhere
    on QueryBuilder<SettingsCollection, SettingsCollection, QWhereClause> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      keyEqualTo(String key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'key',
        value: [key],
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterWhereClause>
      keyNotEqualTo(String key) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [key],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'key',
              lower: [],
              upper: [key],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SettingsCollectionQueryFilter
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
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

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      keyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'key',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterFilterCondition>
      valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension SettingsCollectionQueryObject
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {}

extension SettingsCollectionQueryLinks
    on QueryBuilder<SettingsCollection, SettingsCollection, QFilterCondition> {}

extension SettingsCollectionQuerySortBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension SettingsCollectionQuerySortThenBy
    on QueryBuilder<SettingsCollection, SettingsCollection, QSortThenBy> {
  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension SettingsCollectionQueryWhereDistinct
    on QueryBuilder<SettingsCollection, SettingsCollection, QDistinct> {
  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsCollection, SettingsCollection, QDistinct>
      distinctByValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value', caseSensitive: caseSensitive);
    });
  }
}

extension SettingsCollectionQueryProperty
    on QueryBuilder<SettingsCollection, SettingsCollection, QQueryProperty> {
  QueryBuilder<SettingsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<SettingsCollection, String, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLabTestCollectionCollection on Isar {
  IsarCollection<LabTestCollection> get labTestCollections => this.collection();
}

const LabTestCollectionSchema = CollectionSchema(
  name: r'LabTestCollection',
  id: -5594337330031990450,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'referenceMax': PropertySchema(
      id: 2,
      name: r'referenceMax',
      type: IsarType.double,
    ),
    r'referenceMin': PropertySchema(
      id: 3,
      name: r'referenceMin',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 4,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _labTestCollectionEstimateSize,
  serialize: _labTestCollectionSerialize,
  deserialize: _labTestCollectionDeserialize,
  deserializeProp: _labTestCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _labTestCollectionGetId,
  getLinks: _labTestCollectionGetLinks,
  attach: _labTestCollectionAttach,
  version: '3.1.0+1',
);

int _labTestCollectionEstimateSize(
  LabTestCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _labTestCollectionSerialize(
  LabTestCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.name);
  writer.writeDouble(offsets[2], object.referenceMax);
  writer.writeDouble(offsets[3], object.referenceMin);
  writer.writeString(offsets[4], object.unit);
}

LabTestCollection _labTestCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LabTestCollection();
  object.category = reader.readString(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.referenceMax = reader.readDouble(offsets[2]);
  object.referenceMin = reader.readDouble(offsets[3]);
  object.unit = reader.readString(offsets[4]);
  return object;
}

P _labTestCollectionDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _labTestCollectionGetId(LabTestCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _labTestCollectionGetLinks(
    LabTestCollection object) {
  return [];
}

void _labTestCollectionAttach(
    IsarCollection<dynamic> col, Id id, LabTestCollection object) {
  object.id = id;
}

extension LabTestCollectionQueryWhereSort
    on QueryBuilder<LabTestCollection, LabTestCollection, QWhere> {
  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LabTestCollectionQueryWhere
    on QueryBuilder<LabTestCollection, LabTestCollection, QWhereClause> {
  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
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

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
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

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LabTestCollectionQueryFilter
    on QueryBuilder<LabTestCollection, LabTestCollection, QFilterCondition> {
  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
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

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
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

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
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

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMaxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMaxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMaxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceMax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMaxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceMax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceMin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      referenceMinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceMin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension LabTestCollectionQueryObject
    on QueryBuilder<LabTestCollection, LabTestCollection, QFilterCondition> {}

extension LabTestCollectionQueryLinks
    on QueryBuilder<LabTestCollection, LabTestCollection, QFilterCondition> {}

extension LabTestCollectionQuerySortBy
    on QueryBuilder<LabTestCollection, LabTestCollection, QSortBy> {
  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByReferenceMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMax', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByReferenceMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMax', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByReferenceMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMin', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByReferenceMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMin', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension LabTestCollectionQuerySortThenBy
    on QueryBuilder<LabTestCollection, LabTestCollection, QSortThenBy> {
  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByReferenceMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMax', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByReferenceMaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMax', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByReferenceMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMin', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByReferenceMinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceMin', Sort.desc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension LabTestCollectionQueryWhereDistinct
    on QueryBuilder<LabTestCollection, LabTestCollection, QDistinct> {
  QueryBuilder<LabTestCollection, LabTestCollection, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QDistinct>
      distinctByReferenceMax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceMax');
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QDistinct>
      distinctByReferenceMin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceMin');
    });
  }

  QueryBuilder<LabTestCollection, LabTestCollection, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension LabTestCollectionQueryProperty
    on QueryBuilder<LabTestCollection, LabTestCollection, QQueryProperty> {
  QueryBuilder<LabTestCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LabTestCollection, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<LabTestCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LabTestCollection, double, QQueryOperations>
      referenceMaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceMax');
    });
  }

  QueryBuilder<LabTestCollection, double, QQueryOperations>
      referenceMinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceMin');
    });
  }

  QueryBuilder<LabTestCollection, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicalSectionCollectionCollection on Isar {
  IsarCollection<MedicalSectionCollection> get medicalSectionCollections =>
      this.collection();
}

const MedicalSectionCollectionSchema = CollectionSchema(
  name: r'MedicalSectionCollection',
  id: 2594063794825470165,
  properties: {
    r'fieldsJson': PropertySchema(
      id: 0,
      name: r'fieldsJson',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'sortOrder': PropertySchema(
      id: 2,
      name: r'sortOrder',
      type: IsarType.long,
    )
  },
  estimateSize: _medicalSectionCollectionEstimateSize,
  serialize: _medicalSectionCollectionSerialize,
  deserialize: _medicalSectionCollectionDeserialize,
  deserializeProp: _medicalSectionCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicalSectionCollectionGetId,
  getLinks: _medicalSectionCollectionGetLinks,
  attach: _medicalSectionCollectionAttach,
  version: '3.1.0+1',
);

int _medicalSectionCollectionEstimateSize(
  MedicalSectionCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fieldsJson.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _medicalSectionCollectionSerialize(
  MedicalSectionCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fieldsJson);
  writer.writeString(offsets[1], object.name);
  writer.writeLong(offsets[2], object.sortOrder);
}

MedicalSectionCollection _medicalSectionCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicalSectionCollection();
  object.fieldsJson = reader.readString(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.sortOrder = reader.readLong(offsets[2]);
  return object;
}

P _medicalSectionCollectionDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicalSectionCollectionGetId(MedicalSectionCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicalSectionCollectionGetLinks(
    MedicalSectionCollection object) {
  return [];
}

void _medicalSectionCollectionAttach(
    IsarCollection<dynamic> col, Id id, MedicalSectionCollection object) {
  object.id = id;
}

extension MedicalSectionCollectionQueryWhereSort on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QWhere> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicalSectionCollectionQueryWhere on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QWhereClause> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterWhereClause> idBetween(
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
}

extension MedicalSectionCollectionQueryFilter on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QFilterCondition> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fieldsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
          QAfterFilterCondition>
      fieldsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fieldsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
          QAfterFilterCondition>
      fieldsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fieldsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fieldsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> fieldsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fieldsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
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

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
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

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
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

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> sortOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> sortOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> sortOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection,
      QAfterFilterCondition> sortOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MedicalSectionCollectionQueryObject on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QFilterCondition> {}

extension MedicalSectionCollectionQueryLinks on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QFilterCondition> {}

extension MedicalSectionCollectionQuerySortBy on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QSortBy> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortByFieldsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldsJson', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortByFieldsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldsJson', Sort.desc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }
}

extension MedicalSectionCollectionQuerySortThenBy on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QSortThenBy> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenByFieldsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldsJson', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenByFieldsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fieldsJson', Sort.desc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QAfterSortBy>
      thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }
}

extension MedicalSectionCollectionQueryWhereDistinct on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QDistinct> {
  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QDistinct>
      distinctByFieldsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fieldsJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicalSectionCollection, MedicalSectionCollection, QDistinct>
      distinctBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder');
    });
  }
}

extension MedicalSectionCollectionQueryProperty on QueryBuilder<
    MedicalSectionCollection, MedicalSectionCollection, QQueryProperty> {
  QueryBuilder<MedicalSectionCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicalSectionCollection, String, QQueryOperations>
      fieldsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fieldsJson');
    });
  }

  QueryBuilder<MedicalSectionCollection, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MedicalSectionCollection, int, QQueryOperations>
      sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompanyCollectionCollection on Isar {
  IsarCollection<CompanyCollection> get companyCollections => this.collection();
}

const CompanyCollectionSchema = CollectionSchema(
  name: r'CompanyCollection',
  id: 6932128078287845146,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'contactPerson': PropertySchema(
      id: 1,
      name: r'contactPerson',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 3,
      name: r'phone',
      type: IsarType.string,
    )
  },
  estimateSize: _companyCollectionEstimateSize,
  serialize: _companyCollectionSerialize,
  deserialize: _companyCollectionDeserialize,
  deserializeProp: _companyCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _companyCollectionGetId,
  getLinks: _companyCollectionGetLinks,
  attach: _companyCollectionAttach,
  version: '3.1.0+1',
);

int _companyCollectionEstimateSize(
  CompanyCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactPerson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _companyCollectionSerialize(
  CompanyCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.contactPerson);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.phone);
}

CompanyCollection _companyCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompanyCollection();
  object.address = reader.readStringOrNull(offsets[0]);
  object.contactPerson = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.phone = reader.readStringOrNull(offsets[3]);
  return object;
}

P _companyCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _companyCollectionGetId(CompanyCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _companyCollectionGetLinks(
    CompanyCollection object) {
  return [];
}

void _companyCollectionAttach(
    IsarCollection<dynamic> col, Id id, CompanyCollection object) {
  object.id = id;
}

extension CompanyCollectionQueryWhereSort
    on QueryBuilder<CompanyCollection, CompanyCollection, QWhere> {
  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompanyCollectionQueryWhere
    on QueryBuilder<CompanyCollection, CompanyCollection, QWhereClause> {
  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
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

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
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

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CompanyCollectionQueryFilter
    on QueryBuilder<CompanyCollection, CompanyCollection, QFilterCondition> {
  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactPerson',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactPerson',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactPerson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactPerson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      contactPersonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
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

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
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

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
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

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }
}

extension CompanyCollectionQueryObject
    on QueryBuilder<CompanyCollection, CompanyCollection, QFilterCondition> {}

extension CompanyCollectionQueryLinks
    on QueryBuilder<CompanyCollection, CompanyCollection, QFilterCondition> {}

extension CompanyCollectionQuerySortBy
    on QueryBuilder<CompanyCollection, CompanyCollection, QSortBy> {
  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }
}

extension CompanyCollectionQuerySortThenBy
    on QueryBuilder<CompanyCollection, CompanyCollection, QSortThenBy> {
  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }
}

extension CompanyCollectionQueryWhereDistinct
    on QueryBuilder<CompanyCollection, CompanyCollection, QDistinct> {
  QueryBuilder<CompanyCollection, CompanyCollection, QDistinct>
      distinctByAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QDistinct>
      distinctByContactPerson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactPerson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyCollection, CompanyCollection, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }
}

extension CompanyCollectionQueryProperty
    on QueryBuilder<CompanyCollection, CompanyCollection, QQueryProperty> {
  QueryBuilder<CompanyCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CompanyCollection, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<CompanyCollection, String?, QQueryOperations>
      contactPersonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactPerson');
    });
  }

  QueryBuilder<CompanyCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CompanyCollection, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAuditLogCollectionCollection on Isar {
  IsarCollection<AuditLogCollection> get auditLogCollections =>
      this.collection();
}

const AuditLogCollectionSchema = CollectionSchema(
  name: r'AuditLogCollection',
  id: -8238340324760180664,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
    ),
    r'details': PropertySchema(
      id: 1,
      name: r'details',
      type: IsarType.string,
    ),
    r'entityId': PropertySchema(
      id: 2,
      name: r'entityId',
      type: IsarType.long,
    ),
    r'entityType': PropertySchema(
      id: 3,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 4,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _auditLogCollectionEstimateSize,
  serialize: _auditLogCollectionSerialize,
  deserialize: _auditLogCollectionDeserialize,
  deserializeProp: _auditLogCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'action': IndexSchema(
      id: -2948318935682215514,
      name: r'action',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'action',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'entityType': IndexSchema(
      id: -5109706325448941117,
      name: r'entityType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entityType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _auditLogCollectionGetId,
  getLinks: _auditLogCollectionGetLinks,
  attach: _auditLogCollectionAttach,
  version: '3.1.0+1',
);

int _auditLogCollectionEstimateSize(
  AuditLogCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  bytesCount += 3 + object.details.length * 3;
  bytesCount += 3 + object.entityType.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _auditLogCollectionSerialize(
  AuditLogCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeString(offsets[1], object.details);
  writer.writeLong(offsets[2], object.entityId);
  writer.writeString(offsets[3], object.entityType);
  writer.writeDateTime(offsets[4], object.timestamp);
  writer.writeString(offsets[5], object.userId);
}

AuditLogCollection _auditLogCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditLogCollection();
  object.action = reader.readString(offsets[0]);
  object.details = reader.readString(offsets[1]);
  object.entityId = reader.readLong(offsets[2]);
  object.entityType = reader.readString(offsets[3]);
  object.id = id;
  object.timestamp = reader.readDateTime(offsets[4]);
  object.userId = reader.readString(offsets[5]);
  return object;
}

P _auditLogCollectionDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditLogCollectionGetId(AuditLogCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditLogCollectionGetLinks(
    AuditLogCollection object) {
  return [];
}

void _auditLogCollectionAttach(
    IsarCollection<dynamic> col, Id id, AuditLogCollection object) {
  object.id = id;
}

extension AuditLogCollectionQueryWhereSort
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QWhere> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhere>
      anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension AuditLogCollectionQueryWhere
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QWhereClause> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      actionEqualTo(String action) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'action',
        value: [action],
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      actionNotEqualTo(String action) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      entityTypeEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entityType',
        value: [entityType],
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      entityTypeNotEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [],
              upper: [entityType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [entityType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [entityType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [],
              upper: [entityType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      timestampEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      timestampNotEqualTo(DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      timestampGreaterThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      timestampLessThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterWhereClause>
      timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AuditLogCollectionQueryFilter
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QFilterCondition> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'details',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'details',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'details',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'details',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
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

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension AuditLogCollectionQueryObject
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QFilterCondition> {}

extension AuditLogCollectionQueryLinks
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QFilterCondition> {}

extension AuditLogCollectionQuerySortBy
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QSortBy> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AuditLogCollectionQuerySortThenBy
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QSortThenBy> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'details', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityId', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AuditLogCollectionQueryWhereDistinct
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct> {
  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByAction({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'details', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityId');
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByEntityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<AuditLogCollection, AuditLogCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension AuditLogCollectionQueryProperty
    on QueryBuilder<AuditLogCollection, AuditLogCollection, QQueryProperty> {
  QueryBuilder<AuditLogCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditLogCollection, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<AuditLogCollection, String, QQueryOperations> detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'details');
    });
  }

  QueryBuilder<AuditLogCollection, int, QQueryOperations> entityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityId');
    });
  }

  QueryBuilder<AuditLogCollection, String, QQueryOperations>
      entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<AuditLogCollection, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<AuditLogCollection, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCollectionCollection on Isar {
  IsarCollection<UserCollection> get userCollections => this.collection();
}

const UserCollectionSchema = CollectionSchema(
  name: r'UserCollection',
  id: 1551134645489327298,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'passwordHash': PropertySchema(
      id: 1,
      name: r'passwordHash',
      type: IsarType.string,
    ),
    r'role': PropertySchema(
      id: 2,
      name: r'role',
      type: IsarType.string,
    ),
    r'username': PropertySchema(
      id: 3,
      name: r'username',
      type: IsarType.string,
    )
  },
  estimateSize: _userCollectionEstimateSize,
  serialize: _userCollectionSerialize,
  deserialize: _userCollectionDeserialize,
  deserializeProp: _userCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'username': IndexSchema(
      id: -2899563114555695793,
      name: r'username',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'username',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userCollectionGetId,
  getLinks: _userCollectionGetLinks,
  attach: _userCollectionAttach,
  version: '3.1.0+1',
);

int _userCollectionEstimateSize(
  UserCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.passwordHash.length * 3;
  bytesCount += 3 + object.role.length * 3;
  bytesCount += 3 + object.username.length * 3;
  return bytesCount;
}

void _userCollectionSerialize(
  UserCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeString(offsets[1], object.passwordHash);
  writer.writeString(offsets[2], object.role);
  writer.writeString(offsets[3], object.username);
}

UserCollection _userCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserCollection();
  object.id = id;
  object.isActive = reader.readBool(offsets[0]);
  object.passwordHash = reader.readString(offsets[1]);
  object.role = reader.readString(offsets[2]);
  object.username = reader.readString(offsets[3]);
  return object;
}

P _userCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userCollectionGetId(UserCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userCollectionGetLinks(UserCollection object) {
  return [];
}

void _userCollectionAttach(
    IsarCollection<dynamic> col, Id id, UserCollection object) {
  object.id = id;
}

extension UserCollectionByIndex on IsarCollection<UserCollection> {
  Future<UserCollection?> getByUsername(String username) {
    return getByIndex(r'username', [username]);
  }

  UserCollection? getByUsernameSync(String username) {
    return getByIndexSync(r'username', [username]);
  }

  Future<bool> deleteByUsername(String username) {
    return deleteByIndex(r'username', [username]);
  }

  bool deleteByUsernameSync(String username) {
    return deleteByIndexSync(r'username', [username]);
  }

  Future<List<UserCollection?>> getAllByUsername(List<String> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndex(r'username', values);
  }

  List<UserCollection?> getAllByUsernameSync(List<String> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'username', values);
  }

  Future<int> deleteAllByUsername(List<String> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'username', values);
  }

  int deleteAllByUsernameSync(List<String> usernameValues) {
    final values = usernameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'username', values);
  }

  Future<Id> putByUsername(UserCollection object) {
    return putByIndex(r'username', object);
  }

  Id putByUsernameSync(UserCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'username', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUsername(List<UserCollection> objects) {
    return putAllByIndex(r'username', objects);
  }

  List<Id> putAllByUsernameSync(List<UserCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'username', objects, saveLinks: saveLinks);
  }
}

extension UserCollectionQueryWhereSort
    on QueryBuilder<UserCollection, UserCollection, QWhere> {
  QueryBuilder<UserCollection, UserCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserCollectionQueryWhere
    on QueryBuilder<UserCollection, UserCollection, QWhereClause> {
  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause>
      usernameEqualTo(String username) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'username',
        value: [username],
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterWhereClause>
      usernameNotEqualTo(String username) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [],
              upper: [username],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [username],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [username],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'username',
              lower: [],
              upper: [username],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserCollectionQueryFilter
    on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {
  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
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

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
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

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passwordHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passwordHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passwordHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passwordHash',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      passwordHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passwordHash',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'username',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'username',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: '',
      ));
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'username',
        value: '',
      ));
    });
  }
}

extension UserCollectionQueryObject
    on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {}

extension UserCollectionQueryLinks
    on QueryBuilder<UserCollection, UserCollection, QFilterCondition> {}

extension UserCollectionQuerySortBy
    on QueryBuilder<UserCollection, UserCollection, QSortBy> {
  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      sortByPasswordHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      sortByPasswordHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserCollectionQuerySortThenBy
    on QueryBuilder<UserCollection, UserCollection, QSortThenBy> {
  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      thenByPasswordHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      thenByPasswordHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passwordHash', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'role', Sort.desc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy> thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QAfterSortBy>
      thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserCollectionQueryWhereDistinct
    on QueryBuilder<UserCollection, UserCollection, QDistinct> {
  QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<UserCollection, UserCollection, QDistinct>
      distinctByPasswordHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passwordHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByRole(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'role', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserCollection, UserCollection, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension UserCollectionQueryProperty
    on QueryBuilder<UserCollection, UserCollection, QQueryProperty> {
  QueryBuilder<UserCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserCollection, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<UserCollection, String, QQueryOperations>
      passwordHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passwordHash');
    });
  }

  QueryBuilder<UserCollection, String, QQueryOperations> roleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'role');
    });
  }

  QueryBuilder<UserCollection, String, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAttachmentCollectionCollection on Isar {
  IsarCollection<AttachmentCollection> get attachmentCollections =>
      this.collection();
}

const AttachmentCollectionSchema = CollectionSchema(
  name: r'AttachmentCollection',
  id: 8202887945039262620,
  properties: {
    r'fileName': PropertySchema(
      id: 0,
      name: r'fileName',
      type: IsarType.string,
    ),
    r'filePath': PropertySchema(
      id: 1,
      name: r'filePath',
      type: IsarType.string,
    ),
    r'linkedEntityId': PropertySchema(
      id: 2,
      name: r'linkedEntityId',
      type: IsarType.long,
    ),
    r'linkedEntityType': PropertySchema(
      id: 3,
      name: r'linkedEntityType',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _attachmentCollectionEstimateSize,
  serialize: _attachmentCollectionSerialize,
  deserialize: _attachmentCollectionDeserialize,
  deserializeProp: _attachmentCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'linkedEntityType': IndexSchema(
      id: -4277361628669938270,
      name: r'linkedEntityType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'linkedEntityType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'linkedEntityId': IndexSchema(
      id: -6983057899585892797,
      name: r'linkedEntityId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'linkedEntityId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _attachmentCollectionGetId,
  getLinks: _attachmentCollectionGetLinks,
  attach: _attachmentCollectionAttach,
  version: '3.1.0+1',
);

int _attachmentCollectionEstimateSize(
  AttachmentCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fileName.length * 3;
  bytesCount += 3 + object.filePath.length * 3;
  bytesCount += 3 + object.linkedEntityType.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _attachmentCollectionSerialize(
  AttachmentCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fileName);
  writer.writeString(offsets[1], object.filePath);
  writer.writeLong(offsets[2], object.linkedEntityId);
  writer.writeString(offsets[3], object.linkedEntityType);
  writer.writeString(offsets[4], object.type);
}

AttachmentCollection _attachmentCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AttachmentCollection();
  object.fileName = reader.readString(offsets[0]);
  object.filePath = reader.readString(offsets[1]);
  object.id = id;
  object.linkedEntityId = reader.readLong(offsets[2]);
  object.linkedEntityType = reader.readString(offsets[3]);
  object.type = reader.readString(offsets[4]);
  return object;
}

P _attachmentCollectionDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _attachmentCollectionGetId(AttachmentCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _attachmentCollectionGetLinks(
    AttachmentCollection object) {
  return [];
}

void _attachmentCollectionAttach(
    IsarCollection<dynamic> col, Id id, AttachmentCollection object) {
  object.id = id;
}

extension AttachmentCollectionQueryWhereSort
    on QueryBuilder<AttachmentCollection, AttachmentCollection, QWhere> {
  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhere>
      anyLinkedEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'linkedEntityId'),
      );
    });
  }
}

extension AttachmentCollectionQueryWhere
    on QueryBuilder<AttachmentCollection, AttachmentCollection, QWhereClause> {
  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
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

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
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

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityTypeEqualTo(String linkedEntityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'linkedEntityType',
        value: [linkedEntityType],
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityTypeNotEqualTo(String linkedEntityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityType',
              lower: [],
              upper: [linkedEntityType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityType',
              lower: [linkedEntityType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityType',
              lower: [linkedEntityType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityType',
              lower: [],
              upper: [linkedEntityType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityIdEqualTo(int linkedEntityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'linkedEntityId',
        value: [linkedEntityId],
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityIdNotEqualTo(int linkedEntityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityId',
              lower: [],
              upper: [linkedEntityId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityId',
              lower: [linkedEntityId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityId',
              lower: [linkedEntityId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'linkedEntityId',
              lower: [],
              upper: [linkedEntityId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityIdGreaterThan(
    int linkedEntityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'linkedEntityId',
        lower: [linkedEntityId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityIdLessThan(
    int linkedEntityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'linkedEntityId',
        lower: [],
        upper: [linkedEntityId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterWhereClause>
      linkedEntityIdBetween(
    int lowerLinkedEntityId,
    int upperLinkedEntityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'linkedEntityId',
        lower: [lowerLinkedEntityId],
        includeLower: includeLower,
        upper: [upperLinkedEntityId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AttachmentCollectionQueryFilter on QueryBuilder<AttachmentCollection,
    AttachmentCollection, QFilterCondition> {
  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      fileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      fileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> fileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fileName',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      filePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      filePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> filePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filePath',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
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

  QueryBuilder<AttachmentCollection, AttachmentCollection,
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

  QueryBuilder<AttachmentCollection, AttachmentCollection,
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

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedEntityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkedEntityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkedEntityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkedEntityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkedEntityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      linkedEntityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkedEntityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      linkedEntityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkedEntityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkedEntityType',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> linkedEntityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkedEntityType',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension AttachmentCollectionQueryObject on QueryBuilder<AttachmentCollection,
    AttachmentCollection, QFilterCondition> {}

extension AttachmentCollectionQueryLinks on QueryBuilder<AttachmentCollection,
    AttachmentCollection, QFilterCondition> {}

extension AttachmentCollectionQuerySortBy
    on QueryBuilder<AttachmentCollection, AttachmentCollection, QSortBy> {
  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByLinkedEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityId', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByLinkedEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityId', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByLinkedEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityType', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByLinkedEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityType', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AttachmentCollectionQuerySortThenBy
    on QueryBuilder<AttachmentCollection, AttachmentCollection, QSortThenBy> {
  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileName', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filePath', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByLinkedEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityId', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByLinkedEntityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityId', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByLinkedEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityType', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByLinkedEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkedEntityType', Sort.desc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AttachmentCollectionQueryWhereDistinct
    on QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct> {
  QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct>
      distinctByFileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct>
      distinctByFilePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct>
      distinctByLinkedEntityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkedEntityId');
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct>
      distinctByLinkedEntityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkedEntityType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AttachmentCollection, AttachmentCollection, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension AttachmentCollectionQueryProperty on QueryBuilder<
    AttachmentCollection, AttachmentCollection, QQueryProperty> {
  QueryBuilder<AttachmentCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AttachmentCollection, String, QQueryOperations>
      fileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileName');
    });
  }

  QueryBuilder<AttachmentCollection, String, QQueryOperations>
      filePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filePath');
    });
  }

  QueryBuilder<AttachmentCollection, int, QQueryOperations>
      linkedEntityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkedEntityId');
    });
  }

  QueryBuilder<AttachmentCollection, String, QQueryOperations>
      linkedEntityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkedEntityType');
    });
  }

  QueryBuilder<AttachmentCollection, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PatientInfoEmbedSchema = Schema(
  name: r'PatientInfoEmbed',
  id: 8779092156095608796,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'bloodGroup': PropertySchema(
      id: 1,
      name: r'bloodGroup',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 3,
      name: r'gender',
      type: IsarType.string,
    ),
    r'height': PropertySchema(
      id: 4,
      name: r'height',
      type: IsarType.double,
    ),
    r'issueDate': PropertySchema(
      id: 5,
      name: r'issueDate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'nationality': PropertySchema(
      id: 7,
      name: r'nationality',
      type: IsarType.string,
    ),
    r'passportNumber': PropertySchema(
      id: 8,
      name: r'passportNumber',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 9,
      name: r'phone',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 10,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'placeOfIssue': PropertySchema(
      id: 11,
      name: r'placeOfIssue',
      type: IsarType.string,
    ),
    r'position': PropertySchema(
      id: 12,
      name: r'position',
      type: IsarType.string,
    ),
    r'visaNumber': PropertySchema(
      id: 13,
      name: r'visaNumber',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 14,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _patientInfoEmbedEstimateSize,
  serialize: _patientInfoEmbedSerialize,
  deserialize: _patientInfoEmbedDeserialize,
  deserializeProp: _patientInfoEmbedDeserializeProp,
);

int _patientInfoEmbedEstimateSize(
  PatientInfoEmbed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bloodGroup;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nationality;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.passportNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.placeOfIssue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.position;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.visaNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _patientInfoEmbedSerialize(
  PatientInfoEmbed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.bloodGroup);
  writer.writeString(offsets[2], object.email);
  writer.writeString(offsets[3], object.gender);
  writer.writeDouble(offsets[4], object.height);
  writer.writeDateTime(offsets[5], object.issueDate);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.nationality);
  writer.writeString(offsets[8], object.passportNumber);
  writer.writeString(offsets[9], object.phone);
  writer.writeString(offsets[10], object.photoPath);
  writer.writeString(offsets[11], object.placeOfIssue);
  writer.writeString(offsets[12], object.position);
  writer.writeString(offsets[13], object.visaNumber);
  writer.writeDouble(offsets[14], object.weight);
}

PatientInfoEmbed _patientInfoEmbedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PatientInfoEmbed();
  object.age = reader.readLongOrNull(offsets[0]);
  object.bloodGroup = reader.readStringOrNull(offsets[1]);
  object.email = reader.readStringOrNull(offsets[2]);
  object.gender = reader.readStringOrNull(offsets[3]);
  object.height = reader.readDoubleOrNull(offsets[4]);
  object.issueDate = reader.readDateTimeOrNull(offsets[5]);
  object.name = reader.readStringOrNull(offsets[6]);
  object.nationality = reader.readStringOrNull(offsets[7]);
  object.passportNumber = reader.readStringOrNull(offsets[8]);
  object.phone = reader.readStringOrNull(offsets[9]);
  object.photoPath = reader.readStringOrNull(offsets[10]);
  object.placeOfIssue = reader.readStringOrNull(offsets[11]);
  object.position = reader.readStringOrNull(offsets[12]);
  object.visaNumber = reader.readStringOrNull(offsets[13]);
  object.weight = reader.readDoubleOrNull(offsets[14]);
  return object;
}

P _patientInfoEmbedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PatientInfoEmbedQueryFilter
    on QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QFilterCondition> {
  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      ageBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodGroup',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodGroup',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodGroup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      bloodGroupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderEqualTo(
    String? value, {
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderGreaterThan(
    String? value, {
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderLessThan(
    String? value, {
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightEqualTo(
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightGreaterThan(
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightLessThan(
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      heightBetween(
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

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issueDate',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issueDate',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      issueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      nationalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'passportNumber',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'passportNumber',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passportNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passportNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passportNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passportNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      passportNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passportNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'placeOfIssue',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'placeOfIssue',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placeOfIssue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeOfIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeOfIssue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeOfIssue',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      placeOfIssueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeOfIssue',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'position',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visaNumber',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visaNumber',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visaNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visaNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visaNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visaNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      visaNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visaNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QAfterFilterCondition>
      weightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PatientInfoEmbedQueryObject
    on QueryBuilder<PatientInfoEmbed, PatientInfoEmbed, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MedicalExamEmbedSchema = Schema(
  name: r'MedicalExamEmbed',
  id: 3081318472932886025,
  properties: {
    r'abdomen': PropertySchema(
      id: 0,
      name: r'abdomen',
      type: IsarType.string,
    ),
    r'bloodPressure': PropertySchema(
      id: 1,
      name: r'bloodPressure',
      type: IsarType.string,
    ),
    r'cardiovascular': PropertySchema(
      id: 2,
      name: r'cardiovascular',
      type: IsarType.string,
    ),
    r'chestXRay': PropertySchema(
      id: 3,
      name: r'chestXRay',
      type: IsarType.string,
    ),
    r'clinicalRemarks': PropertySchema(
      id: 4,
      name: r'clinicalRemarks',
      type: IsarType.string,
    ),
    r'deformities': PropertySchema(
      id: 5,
      name: r'deformities',
      type: IsarType.string,
    ),
    r'earLeft': PropertySchema(
      id: 6,
      name: r'earLeft',
      type: IsarType.string,
    ),
    r'earRemarks': PropertySchema(
      id: 7,
      name: r'earRemarks',
      type: IsarType.string,
    ),
    r'earRight': PropertySchema(
      id: 8,
      name: r'earRight',
      type: IsarType.string,
    ),
    r'extremities': PropertySchema(
      id: 9,
      name: r'extremities',
      type: IsarType.string,
    ),
    r'eyeLeft': PropertySchema(
      id: 10,
      name: r'eyeLeft',
      type: IsarType.string,
    ),
    r'eyeRemarks': PropertySchema(
      id: 11,
      name: r'eyeRemarks',
      type: IsarType.string,
    ),
    r'eyeRight': PropertySchema(
      id: 12,
      name: r'eyeRight',
      type: IsarType.string,
    ),
    r'gastroIntestinal': PropertySchema(
      id: 13,
      name: r'gastroIntestinal',
      type: IsarType.string,
    ),
    r'heart': PropertySchema(
      id: 14,
      name: r'heart',
      type: IsarType.string,
    ),
    r'hernia': PropertySchema(
      id: 15,
      name: r'hernia',
      type: IsarType.string,
    ),
    r'respiratory': PropertySchema(
      id: 16,
      name: r'respiratory',
      type: IsarType.string,
    ),
    r'skin': PropertySchema(
      id: 17,
      name: r'skin',
      type: IsarType.string,
    ),
    r'tuberculosis': PropertySchema(
      id: 18,
      name: r'tuberculosis',
      type: IsarType.string,
    ),
    r'varicoseVeins': PropertySchema(
      id: 19,
      name: r'varicoseVeins',
      type: IsarType.string,
    ),
    r'venerealDiseases': PropertySchema(
      id: 20,
      name: r'venerealDiseases',
      type: IsarType.string,
    )
  },
  estimateSize: _medicalExamEmbedEstimateSize,
  serialize: _medicalExamEmbedSerialize,
  deserialize: _medicalExamEmbedDeserialize,
  deserializeProp: _medicalExamEmbedDeserializeProp,
);

int _medicalExamEmbedEstimateSize(
  MedicalExamEmbed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.abdomen;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bloodPressure;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cardiovascular;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chestXRay;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.clinicalRemarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deformities;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.earLeft;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.earRemarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.earRight;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.extremities;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eyeLeft;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eyeRemarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eyeRight;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gastroIntestinal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.heart;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hernia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.respiratory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.skin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tuberculosis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.varicoseVeins;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.venerealDiseases;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _medicalExamEmbedSerialize(
  MedicalExamEmbed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.abdomen);
  writer.writeString(offsets[1], object.bloodPressure);
  writer.writeString(offsets[2], object.cardiovascular);
  writer.writeString(offsets[3], object.chestXRay);
  writer.writeString(offsets[4], object.clinicalRemarks);
  writer.writeString(offsets[5], object.deformities);
  writer.writeString(offsets[6], object.earLeft);
  writer.writeString(offsets[7], object.earRemarks);
  writer.writeString(offsets[8], object.earRight);
  writer.writeString(offsets[9], object.extremities);
  writer.writeString(offsets[10], object.eyeLeft);
  writer.writeString(offsets[11], object.eyeRemarks);
  writer.writeString(offsets[12], object.eyeRight);
  writer.writeString(offsets[13], object.gastroIntestinal);
  writer.writeString(offsets[14], object.heart);
  writer.writeString(offsets[15], object.hernia);
  writer.writeString(offsets[16], object.respiratory);
  writer.writeString(offsets[17], object.skin);
  writer.writeString(offsets[18], object.tuberculosis);
  writer.writeString(offsets[19], object.varicoseVeins);
  writer.writeString(offsets[20], object.venerealDiseases);
}

MedicalExamEmbed _medicalExamEmbedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicalExamEmbed();
  object.abdomen = reader.readStringOrNull(offsets[0]);
  object.bloodPressure = reader.readStringOrNull(offsets[1]);
  object.cardiovascular = reader.readStringOrNull(offsets[2]);
  object.chestXRay = reader.readStringOrNull(offsets[3]);
  object.clinicalRemarks = reader.readStringOrNull(offsets[4]);
  object.deformities = reader.readStringOrNull(offsets[5]);
  object.earLeft = reader.readStringOrNull(offsets[6]);
  object.earRemarks = reader.readStringOrNull(offsets[7]);
  object.earRight = reader.readStringOrNull(offsets[8]);
  object.extremities = reader.readStringOrNull(offsets[9]);
  object.eyeLeft = reader.readStringOrNull(offsets[10]);
  object.eyeRemarks = reader.readStringOrNull(offsets[11]);
  object.eyeRight = reader.readStringOrNull(offsets[12]);
  object.gastroIntestinal = reader.readStringOrNull(offsets[13]);
  object.heart = reader.readStringOrNull(offsets[14]);
  object.hernia = reader.readStringOrNull(offsets[15]);
  object.respiratory = reader.readStringOrNull(offsets[16]);
  object.skin = reader.readStringOrNull(offsets[17]);
  object.tuberculosis = reader.readStringOrNull(offsets[18]);
  object.varicoseVeins = reader.readStringOrNull(offsets[19]);
  object.venerealDiseases = reader.readStringOrNull(offsets[20]);
  return object;
}

P _medicalExamEmbedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MedicalExamEmbedQueryFilter
    on QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QFilterCondition> {
  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'abdomen',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'abdomen',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abdomen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abdomen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abdomen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abdomen',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      abdomenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abdomen',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodPressure',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodPressure',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodPressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodPressure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodPressure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodPressure',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      bloodPressureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodPressure',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardiovascular',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardiovascular',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardiovascular',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardiovascular',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardiovascular',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardiovascular',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      cardiovascularIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardiovascular',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chestXRay',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chestXRay',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chestXRay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chestXRay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chestXRay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chestXRay',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      chestXRayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chestXRay',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clinicalRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clinicalRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clinicalRemarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clinicalRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clinicalRemarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clinicalRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      clinicalRemarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clinicalRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deformities',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deformities',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deformities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deformities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deformities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deformities',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      deformitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deformities',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'earLeft',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'earLeft',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earLeft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'earLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'earLeft',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earLeftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'earLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'earRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'earRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earRemarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'earRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'earRemarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRemarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'earRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'earRight',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'earRight',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earRight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'earRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'earRight',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earRight',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      earRightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'earRight',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'extremities',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'extremities',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extremities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extremities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extremities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extremities',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      extremitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extremities',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eyeLeft',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eyeLeft',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eyeLeft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eyeLeft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eyeLeft',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeLeftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eyeLeft',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eyeRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eyeRemarks',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eyeRemarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eyeRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eyeRemarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRemarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eyeRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eyeRight',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eyeRight',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eyeRight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eyeRight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eyeRight',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eyeRight',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      eyeRightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eyeRight',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gastroIntestinal',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gastroIntestinal',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gastroIntestinal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gastroIntestinal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gastroIntestinal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gastroIntestinal',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      gastroIntestinalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gastroIntestinal',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'heart',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'heart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'heart',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'heart',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'heart',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      heartIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'heart',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hernia',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hernia',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hernia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hernia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hernia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hernia',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      herniaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hernia',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'respiratory',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'respiratory',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'respiratory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'respiratory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'respiratory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'respiratory',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      respiratoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'respiratory',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skin',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skin',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skin',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      skinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skin',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tuberculosis',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tuberculosis',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tuberculosis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tuberculosis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tuberculosis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tuberculosis',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      tuberculosisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tuberculosis',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'varicoseVeins',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'varicoseVeins',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'varicoseVeins',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'varicoseVeins',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'varicoseVeins',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'varicoseVeins',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      varicoseVeinsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'varicoseVeins',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'venerealDiseases',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'venerealDiseases',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'venerealDiseases',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'venerealDiseases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'venerealDiseases',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venerealDiseases',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QAfterFilterCondition>
      venerealDiseasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'venerealDiseases',
        value: '',
      ));
    });
  }
}

extension MedicalExamEmbedQueryObject
    on QueryBuilder<MedicalExamEmbed, MedicalExamEmbed, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LabInvestigationEmbedSchema = Schema(
  name: r'LabInvestigationEmbed',
  id: -3659861229412624261,
  properties: {
    r'bloodEsr': PropertySchema(
      id: 0,
      name: r'bloodEsr',
      type: IsarType.double,
    ),
    r'bloodHemoglobin': PropertySchema(
      id: 1,
      name: r'bloodHemoglobin',
      type: IsarType.double,
    ),
    r'bloodMalaria': PropertySchema(
      id: 2,
      name: r'bloodMalaria',
      type: IsarType.string,
    ),
    r'bloodMicroFilaria': PropertySchema(
      id: 3,
      name: r'bloodMicroFilaria',
      type: IsarType.string,
    ),
    r'bloodSgpt': PropertySchema(
      id: 4,
      name: r'bloodSgpt',
      type: IsarType.double,
    ),
    r'bloodTlc': PropertySchema(
      id: 5,
      name: r'bloodTlc',
      type: IsarType.double,
    ),
    r'bloodUrea': PropertySchema(
      id: 6,
      name: r'bloodUrea',
      type: IsarType.double,
    ),
    r'bloodUricAcid': PropertySchema(
      id: 7,
      name: r'bloodUricAcid',
      type: IsarType.double,
    ),
    r'bloodWbc': PropertySchema(
      id: 8,
      name: r'bloodWbc',
      type: IsarType.double,
    ),
    r'elisaAntiHcv': PropertySchema(
      id: 9,
      name: r'elisaAntiHcv',
      type: IsarType.string,
    ),
    r'elisaHbsAg': PropertySchema(
      id: 10,
      name: r'elisaHbsAg',
      type: IsarType.string,
    ),
    r'elisaHiv': PropertySchema(
      id: 11,
      name: r'elisaHiv',
      type: IsarType.string,
    ),
    r'elisaTpha': PropertySchema(
      id: 12,
      name: r'elisaTpha',
      type: IsarType.string,
    ),
    r'elisaVdrl': PropertySchema(
      id: 13,
      name: r'elisaVdrl',
      type: IsarType.string,
    ),
    r'lipidCholesterol': PropertySchema(
      id: 14,
      name: r'lipidCholesterol',
      type: IsarType.double,
    ),
    r'lipidG6pd': PropertySchema(
      id: 15,
      name: r'lipidG6pd',
      type: IsarType.string,
    ),
    r'lipidHdl': PropertySchema(
      id: 16,
      name: r'lipidHdl',
      type: IsarType.double,
    ),
    r'lipidLdl': PropertySchema(
      id: 17,
      name: r'lipidLdl',
      type: IsarType.double,
    ),
    r'lipidTry': PropertySchema(
      id: 18,
      name: r'lipidTry',
      type: IsarType.double,
    ),
    r'serologyCreatinine': PropertySchema(
      id: 19,
      name: r'serologyCreatinine',
      type: IsarType.double,
    ),
    r'serologyFbs': PropertySchema(
      id: 20,
      name: r'serologyFbs',
      type: IsarType.double,
    ),
    r'serologyLft': PropertySchema(
      id: 21,
      name: r'serologyLft',
      type: IsarType.string,
    ),
    r'serologyPlateletCount': PropertySchema(
      id: 22,
      name: r'serologyPlateletCount',
      type: IsarType.double,
    ),
    r'serologyPp2bs': PropertySchema(
      id: 23,
      name: r'serologyPp2bs',
      type: IsarType.double,
    ),
    r'stoolBilharziasis': PropertySchema(
      id: 24,
      name: r'stoolBilharziasis',
      type: IsarType.string,
    ),
    r'stoolBlood': PropertySchema(
      id: 25,
      name: r'stoolBlood',
      type: IsarType.string,
    ),
    r'stoolCholera': PropertySchema(
      id: 26,
      name: r'stoolCholera',
      type: IsarType.string,
    ),
    r'stoolCyst': PropertySchema(
      id: 27,
      name: r'stoolCyst',
      type: IsarType.string,
    ),
    r'stoolGiardia': PropertySchema(
      id: 28,
      name: r'stoolGiardia',
      type: IsarType.string,
    ),
    r'stoolHelminthes': PropertySchema(
      id: 29,
      name: r'stoolHelminthes',
      type: IsarType.string,
    ),
    r'stoolOva': PropertySchema(
      id: 30,
      name: r'stoolOva',
      type: IsarType.string,
    ),
    r'stoolSalmonella': PropertySchema(
      id: 31,
      name: r'stoolSalmonella',
      type: IsarType.string,
    ),
    r'stoolShigella': PropertySchema(
      id: 32,
      name: r'stoolShigella',
      type: IsarType.string,
    ),
    r'urineAlbumin': PropertySchema(
      id: 33,
      name: r'urineAlbumin',
      type: IsarType.string,
    ),
    r'urineBilharziasis': PropertySchema(
      id: 34,
      name: r'urineBilharziasis',
      type: IsarType.string,
    ),
    r'urineSugar': PropertySchema(
      id: 35,
      name: r'urineSugar',
      type: IsarType.string,
    )
  },
  estimateSize: _labInvestigationEmbedEstimateSize,
  serialize: _labInvestigationEmbedSerialize,
  deserialize: _labInvestigationEmbedDeserialize,
  deserializeProp: _labInvestigationEmbedDeserializeProp,
);

int _labInvestigationEmbedEstimateSize(
  LabInvestigationEmbed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bloodMalaria;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bloodMicroFilaria;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elisaAntiHcv;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elisaHbsAg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elisaHiv;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elisaTpha;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elisaVdrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lipidG6pd;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serologyLft;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolBilharziasis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolBlood;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolCholera;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolCyst;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolGiardia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolHelminthes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolOva;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolSalmonella;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stoolShigella;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.urineAlbumin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.urineBilharziasis;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.urineSugar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _labInvestigationEmbedSerialize(
  LabInvestigationEmbed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bloodEsr);
  writer.writeDouble(offsets[1], object.bloodHemoglobin);
  writer.writeString(offsets[2], object.bloodMalaria);
  writer.writeString(offsets[3], object.bloodMicroFilaria);
  writer.writeDouble(offsets[4], object.bloodSgpt);
  writer.writeDouble(offsets[5], object.bloodTlc);
  writer.writeDouble(offsets[6], object.bloodUrea);
  writer.writeDouble(offsets[7], object.bloodUricAcid);
  writer.writeDouble(offsets[8], object.bloodWbc);
  writer.writeString(offsets[9], object.elisaAntiHcv);
  writer.writeString(offsets[10], object.elisaHbsAg);
  writer.writeString(offsets[11], object.elisaHiv);
  writer.writeString(offsets[12], object.elisaTpha);
  writer.writeString(offsets[13], object.elisaVdrl);
  writer.writeDouble(offsets[14], object.lipidCholesterol);
  writer.writeString(offsets[15], object.lipidG6pd);
  writer.writeDouble(offsets[16], object.lipidHdl);
  writer.writeDouble(offsets[17], object.lipidLdl);
  writer.writeDouble(offsets[18], object.lipidTry);
  writer.writeDouble(offsets[19], object.serologyCreatinine);
  writer.writeDouble(offsets[20], object.serologyFbs);
  writer.writeString(offsets[21], object.serologyLft);
  writer.writeDouble(offsets[22], object.serologyPlateletCount);
  writer.writeDouble(offsets[23], object.serologyPp2bs);
  writer.writeString(offsets[24], object.stoolBilharziasis);
  writer.writeString(offsets[25], object.stoolBlood);
  writer.writeString(offsets[26], object.stoolCholera);
  writer.writeString(offsets[27], object.stoolCyst);
  writer.writeString(offsets[28], object.stoolGiardia);
  writer.writeString(offsets[29], object.stoolHelminthes);
  writer.writeString(offsets[30], object.stoolOva);
  writer.writeString(offsets[31], object.stoolSalmonella);
  writer.writeString(offsets[32], object.stoolShigella);
  writer.writeString(offsets[33], object.urineAlbumin);
  writer.writeString(offsets[34], object.urineBilharziasis);
  writer.writeString(offsets[35], object.urineSugar);
}

LabInvestigationEmbed _labInvestigationEmbedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LabInvestigationEmbed();
  object.bloodEsr = reader.readDoubleOrNull(offsets[0]);
  object.bloodHemoglobin = reader.readDoubleOrNull(offsets[1]);
  object.bloodMalaria = reader.readStringOrNull(offsets[2]);
  object.bloodMicroFilaria = reader.readStringOrNull(offsets[3]);
  object.bloodSgpt = reader.readDoubleOrNull(offsets[4]);
  object.bloodTlc = reader.readDoubleOrNull(offsets[5]);
  object.bloodUrea = reader.readDoubleOrNull(offsets[6]);
  object.bloodUricAcid = reader.readDoubleOrNull(offsets[7]);
  object.bloodWbc = reader.readDoubleOrNull(offsets[8]);
  object.elisaAntiHcv = reader.readStringOrNull(offsets[9]);
  object.elisaHbsAg = reader.readStringOrNull(offsets[10]);
  object.elisaHiv = reader.readStringOrNull(offsets[11]);
  object.elisaTpha = reader.readStringOrNull(offsets[12]);
  object.elisaVdrl = reader.readStringOrNull(offsets[13]);
  object.lipidCholesterol = reader.readDoubleOrNull(offsets[14]);
  object.lipidG6pd = reader.readStringOrNull(offsets[15]);
  object.lipidHdl = reader.readDoubleOrNull(offsets[16]);
  object.lipidLdl = reader.readDoubleOrNull(offsets[17]);
  object.lipidTry = reader.readDoubleOrNull(offsets[18]);
  object.serologyCreatinine = reader.readDoubleOrNull(offsets[19]);
  object.serologyFbs = reader.readDoubleOrNull(offsets[20]);
  object.serologyLft = reader.readStringOrNull(offsets[21]);
  object.serologyPlateletCount = reader.readDoubleOrNull(offsets[22]);
  object.serologyPp2bs = reader.readDoubleOrNull(offsets[23]);
  object.stoolBilharziasis = reader.readStringOrNull(offsets[24]);
  object.stoolBlood = reader.readStringOrNull(offsets[25]);
  object.stoolCholera = reader.readStringOrNull(offsets[26]);
  object.stoolCyst = reader.readStringOrNull(offsets[27]);
  object.stoolGiardia = reader.readStringOrNull(offsets[28]);
  object.stoolHelminthes = reader.readStringOrNull(offsets[29]);
  object.stoolOva = reader.readStringOrNull(offsets[30]);
  object.stoolSalmonella = reader.readStringOrNull(offsets[31]);
  object.stoolShigella = reader.readStringOrNull(offsets[32]);
  object.urineAlbumin = reader.readStringOrNull(offsets[33]);
  object.urineBilharziasis = reader.readStringOrNull(offsets[34]);
  object.urineSugar = reader.readStringOrNull(offsets[35]);
  return object;
}

P _labInvestigationEmbedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LabInvestigationEmbedQueryFilter on QueryBuilder<
    LabInvestigationEmbed, LabInvestigationEmbed, QFilterCondition> {
  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodEsr',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodEsr',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodEsr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodEsr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodEsr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodEsrBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodEsr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodHemoglobin',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodHemoglobin',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodHemoglobin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodHemoglobin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodHemoglobin',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodHemoglobinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodHemoglobin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodMalaria',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodMalaria',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodMalaria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      bloodMalariaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodMalaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      bloodMalariaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodMalaria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodMalaria',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMalariaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodMalaria',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodMicroFilaria',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodMicroFilaria',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodMicroFilaria',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      bloodMicroFilariaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bloodMicroFilaria',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      bloodMicroFilariaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bloodMicroFilaria',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodMicroFilaria',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodMicroFilariaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bloodMicroFilaria',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodSgpt',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodSgpt',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodSgpt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodSgpt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodSgpt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodSgptBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodSgpt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodTlc',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodTlc',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodTlc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodTlc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodTlc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodTlcBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodTlc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodUrea',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodUrea',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodUrea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodUrea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodUrea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodUrea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodUricAcid',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodUricAcid',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodUricAcid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodUricAcid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodUricAcid',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodUricAcidBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodUricAcid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bloodWbc',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bloodWbc',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bloodWbc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bloodWbc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bloodWbc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> bloodWbcBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bloodWbc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elisaAntiHcv',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elisaAntiHcv',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elisaAntiHcv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaAntiHcvContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elisaAntiHcv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaAntiHcvMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elisaAntiHcv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaAntiHcv',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaAntiHcvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elisaAntiHcv',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elisaHbsAg',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elisaHbsAg',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elisaHbsAg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaHbsAgContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elisaHbsAg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaHbsAgMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elisaHbsAg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaHbsAg',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHbsAgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elisaHbsAg',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elisaHiv',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elisaHiv',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elisaHiv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaHivContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elisaHiv',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaHivMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elisaHiv',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaHiv',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaHivIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elisaHiv',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elisaTpha',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elisaTpha',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elisaTpha',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaTphaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elisaTpha',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaTphaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elisaTpha',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaTpha',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaTphaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elisaTpha',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'elisaVdrl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'elisaVdrl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elisaVdrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaVdrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'elisaVdrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      elisaVdrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'elisaVdrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elisaVdrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> elisaVdrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'elisaVdrl',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipidCholesterol',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipidCholesterol',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidCholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipidCholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipidCholesterol',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidCholesterolBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipidCholesterol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipidG6pd',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipidG6pd',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipidG6pd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      lipidG6pdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lipidG6pd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      lipidG6pdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lipidG6pd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidG6pd',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidG6pdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lipidG6pd',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipidHdl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipidHdl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidHdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipidHdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipidHdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidHdlBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipidHdl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipidLdl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipidLdl',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidLdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipidLdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipidLdl',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidLdlBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipidLdl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lipidTry',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lipidTry',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lipidTry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lipidTry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lipidTry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> lipidTryBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lipidTry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serologyCreatinine',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serologyCreatinine',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyCreatinine',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serologyCreatinine',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serologyCreatinine',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyCreatinineBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serologyCreatinine',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serologyFbs',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serologyFbs',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyFbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serologyFbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serologyFbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyFbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serologyFbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serologyLft',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serologyLft',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serologyLft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      serologyLftContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serologyLft',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      serologyLftMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serologyLft',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyLft',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyLftIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serologyLft',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serologyPlateletCount',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serologyPlateletCount',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyPlateletCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serologyPlateletCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serologyPlateletCount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPlateletCountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serologyPlateletCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serologyPp2bs',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serologyPp2bs',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serologyPp2bs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serologyPp2bs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serologyPp2bs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> serologyPp2bsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serologyPp2bs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolBilharziasis',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolBilharziasis',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolBilharziasis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolBilharziasisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolBilharziasisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolBilharziasis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolBilharziasis',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBilharziasisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolBilharziasis',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolBlood',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolBlood',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolBlood',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolBloodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolBlood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolBloodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolBlood',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolBlood',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolBloodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolBlood',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolCholera',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolCholera',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolCholera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolCholeraContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolCholera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolCholeraMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolCholera',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolCholera',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCholeraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolCholera',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolCyst',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolCyst',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolCyst',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolCystContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolCyst',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolCystMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolCyst',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolCyst',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolCystIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolCyst',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolGiardia',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolGiardia',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolGiardia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolGiardiaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolGiardia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolGiardiaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolGiardia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolGiardia',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolGiardiaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolGiardia',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolHelminthes',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolHelminthes',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolHelminthes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolHelminthesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolHelminthes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolHelminthesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolHelminthes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolHelminthes',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolHelminthesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolHelminthes',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolOva',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolOva',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolOva',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolOvaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolOva',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolOvaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolOva',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolOva',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolOvaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolOva',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolSalmonella',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolSalmonella',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolSalmonella',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolSalmonellaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolSalmonella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolSalmonellaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolSalmonella',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolSalmonella',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolSalmonellaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolSalmonella',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stoolShigella',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stoolShigella',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stoolShigella',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolShigellaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stoolShigella',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      stoolShigellaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stoolShigella',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stoolShigella',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> stoolShigellaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stoolShigella',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urineAlbumin',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urineAlbumin',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urineAlbumin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineAlbuminContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urineAlbumin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineAlbuminMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urineAlbumin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineAlbumin',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineAlbuminIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urineAlbumin',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urineBilharziasis',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urineBilharziasis',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urineBilharziasis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineBilharziasisContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urineBilharziasis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineBilharziasisMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urineBilharziasis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineBilharziasis',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineBilharziasisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urineBilharziasis',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'urineSugar',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'urineSugar',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'urineSugar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineSugarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'urineSugar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
          QAfterFilterCondition>
      urineSugarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'urineSugar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'urineSugar',
        value: '',
      ));
    });
  }

  QueryBuilder<LabInvestigationEmbed, LabInvestigationEmbed,
      QAfterFilterCondition> urineSugarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'urineSugar',
        value: '',
      ));
    });
  }
}

extension LabInvestigationEmbedQueryObject on QueryBuilder<
    LabInvestigationEmbed, LabInvestigationEmbed, QFilterCondition> {}
