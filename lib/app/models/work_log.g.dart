// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_log.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkLogCollection on Isar {
  IsarCollection<WorkLog> get workLogs => this.collection();
}

const WorkLogSchema = CollectionSchema(
  name: r'WorkLog',
  id: 9172451265745087192,
  properties: {
    r'dailyWage': PropertySchema(
      id: 0,
      name: r'dailyWage',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'eveningWorked': PropertySchema(
      id: 2,
      name: r'eveningWorked',
      type: IsarType.bool,
    ),
    r'getTotalWage': PropertySchema(
      id: 3,
      name: r'getTotalWage',
      type: IsarType.double,
    ),
    r'isPaid': PropertySchema(
      id: 4,
      name: r'isPaid',
      type: IsarType.bool,
    ),
    r'morningWorked': PropertySchema(
      id: 5,
      name: r'morningWorked',
      type: IsarType.bool,
    ),
    r'paidDate': PropertySchema(
      id: 6,
      name: r'paidDate',
      type: IsarType.dateTime,
    ),
    r'workSiteId': PropertySchema(
      id: 7,
      name: r'workSiteId',
      type: IsarType.long,
    )
  },
  estimateSize: _workLogEstimateSize,
  serialize: _workLogSerialize,
  deserialize: _workLogDeserialize,
  deserializeProp: _workLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workLogGetId,
  getLinks: _workLogGetLinks,
  attach: _workLogAttach,
  version: '3.1.0+1',
);

int _workLogEstimateSize(
  WorkLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workLogSerialize(
  WorkLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.dailyWage);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeBool(offsets[2], object.eveningWorked);
  writer.writeDouble(offsets[3], object.getTotalWage);
  writer.writeBool(offsets[4], object.isPaid);
  writer.writeBool(offsets[5], object.morningWorked);
  writer.writeDateTime(offsets[6], object.paidDate);
  writer.writeLong(offsets[7], object.workSiteId);
}

WorkLog _workLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkLog();
  object.dailyWage = reader.readDouble(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.eveningWorked = reader.readBool(offsets[2]);
  object.id = id;
  object.isPaid = reader.readBool(offsets[4]);
  object.morningWorked = reader.readBool(offsets[5]);
  object.paidDate = reader.readDateTimeOrNull(offsets[6]);
  object.workSiteId = reader.readLong(offsets[7]);
  return object;
}

P _workLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workLogGetId(WorkLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workLogGetLinks(WorkLog object) {
  return [];
}

void _workLogAttach(IsarCollection<dynamic> col, Id id, WorkLog object) {
  object.id = id;
}

extension WorkLogQueryWhereSort on QueryBuilder<WorkLog, WorkLog, QWhere> {
  QueryBuilder<WorkLog, WorkLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkLogQueryWhere on QueryBuilder<WorkLog, WorkLog, QWhereClause> {
  QueryBuilder<WorkLog, WorkLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<WorkLog, WorkLog, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterWhereClause> idBetween(
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

extension WorkLogQueryFilter
    on QueryBuilder<WorkLog, WorkLog, QFilterCondition> {
  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dailyWageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dailyWageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dailyWageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dailyWageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyWage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> eveningWorkedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eveningWorked',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> getTotalWageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getTotalWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> getTotalWageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'getTotalWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> getTotalWageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'getTotalWage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> getTotalWageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'getTotalWage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> isPaidEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> morningWorkedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'morningWorked',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> paidDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> workSiteIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> workSiteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> workSiteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workSiteId',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterFilterCondition> workSiteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workSiteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkLogQueryObject
    on QueryBuilder<WorkLog, WorkLog, QFilterCondition> {}

extension WorkLogQueryLinks
    on QueryBuilder<WorkLog, WorkLog, QFilterCondition> {}

extension WorkLogQuerySortBy on QueryBuilder<WorkLog, WorkLog, QSortBy> {
  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByDailyWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWage', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByDailyWageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWage', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByEveningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWorked', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByEveningWorkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWorked', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByGetTotalWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getTotalWage', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByGetTotalWageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getTotalWage', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByMorningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningWorked', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByMorningWorkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningWorked', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByWorkSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workSiteId', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> sortByWorkSiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workSiteId', Sort.desc);
    });
  }
}

extension WorkLogQuerySortThenBy
    on QueryBuilder<WorkLog, WorkLog, QSortThenBy> {
  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByDailyWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWage', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByDailyWageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyWage', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByEveningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWorked', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByEveningWorkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eveningWorked', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByGetTotalWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getTotalWage', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByGetTotalWageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getTotalWage', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByMorningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningWorked', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByMorningWorkedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'morningWorked', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByWorkSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workSiteId', Sort.asc);
    });
  }

  QueryBuilder<WorkLog, WorkLog, QAfterSortBy> thenByWorkSiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workSiteId', Sort.desc);
    });
  }
}

extension WorkLogQueryWhereDistinct
    on QueryBuilder<WorkLog, WorkLog, QDistinct> {
  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByDailyWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyWage');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByEveningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eveningWorked');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByGetTotalWage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'getTotalWage');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaid');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByMorningWorked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'morningWorked');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidDate');
    });
  }

  QueryBuilder<WorkLog, WorkLog, QDistinct> distinctByWorkSiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workSiteId');
    });
  }
}

extension WorkLogQueryProperty
    on QueryBuilder<WorkLog, WorkLog, QQueryProperty> {
  QueryBuilder<WorkLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkLog, double, QQueryOperations> dailyWageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyWage');
    });
  }

  QueryBuilder<WorkLog, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<WorkLog, bool, QQueryOperations> eveningWorkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eveningWorked');
    });
  }

  QueryBuilder<WorkLog, double, QQueryOperations> getTotalWageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'getTotalWage');
    });
  }

  QueryBuilder<WorkLog, bool, QQueryOperations> isPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaid');
    });
  }

  QueryBuilder<WorkLog, bool, QQueryOperations> morningWorkedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'morningWorked');
    });
  }

  QueryBuilder<WorkLog, DateTime?, QQueryOperations> paidDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidDate');
    });
  }

  QueryBuilder<WorkLog, int, QQueryOperations> workSiteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workSiteId');
    });
  }
}
