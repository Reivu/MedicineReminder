// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// ignore_for_file: type=lint
class $MedicinesTable extends Medicines with TableInfo<$MedicinesTable, Medicine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>('start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _repeatDailyMeta = const VerificationMeta('repeatDaily');
  @override
  late final GeneratedColumn<bool> repeatDaily = GeneratedColumn<bool>('repeat_daily', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("repeat_daily" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, name, startDate, repeatDaily];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicines';
  @override
  VerificationContext validateIntegrity(Insertable<Medicine> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta, startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('repeat_daily')) {
      context.handle(_repeatDailyMeta, repeatDaily.isAcceptableOrUnknown(data['repeat_daily']!, _repeatDailyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medicine(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      repeatDaily: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}repeat_daily'])!,
    );
  }

  @override
  $MedicinesTable createAlias(String alias) {
    return $MedicinesTable(attachedDatabase, alias);
  }
}

class Medicine extends DataClass implements Insertable<Medicine> {
  final int id;
  final String name;
  final DateTime startDate;
  final bool repeatDaily;
  const Medicine({required this.id, required this.name, required this.startDate, required this.repeatDaily});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['start_date'] = Variable<DateTime>(startDate);
    map['repeat_daily'] = Variable<bool>(repeatDaily);
    return map;
  }

  MedicinesCompanion toCompanion(bool nullToAbsent) {
    return MedicinesCompanion(
      id: Value(id),
      name: Value(name),
      startDate: Value(startDate),
      repeatDaily: Value(repeatDaily),
    );
  }

  factory Medicine.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medicine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      repeatDaily: serializer.fromJson<bool>(json['repeatDaily']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'startDate': serializer.toJson<DateTime>(startDate),
      'repeatDaily': serializer.toJson<bool>(repeatDaily),
    };
  }

  Medicine copyWith({int? id, String? name, DateTime? startDate, bool? repeatDaily}) => Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        repeatDaily: repeatDaily ?? this.repeatDaily,
      );
  Medicine copyWithCompanion(MedicinesCompanion data) {
    return Medicine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      repeatDaily: data.repeatDaily.present ? data.repeatDaily.value : this.repeatDaily,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medicine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('repeatDaily: $repeatDaily')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, startDate, repeatDaily);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.id == this.id &&
          other.name == this.name &&
          other.startDate == this.startDate &&
          other.repeatDaily == this.repeatDaily);
}

class MedicinesCompanion extends UpdateCompanion<Medicine> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> startDate;
  final Value<bool> repeatDaily;
  const MedicinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startDate = const Value.absent(),
    this.repeatDaily = const Value.absent(),
  });
  MedicinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime startDate,
    this.repeatDaily = const Value.absent(),
  })  : name = Value(name),
        startDate = Value(startDate);
  static Insertable<Medicine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? startDate,
    Expression<bool>? repeatDaily,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startDate != null) 'start_date': startDate,
      if (repeatDaily != null) 'repeat_daily': repeatDaily,
    });
  }

  MedicinesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<DateTime>? startDate, Value<bool>? repeatDaily}) {
    return MedicinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      repeatDaily: repeatDaily ?? this.repeatDaily,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (repeatDaily.present) {
      map['repeat_daily'] = Variable<bool>(repeatDaily.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startDate: $startDate, ')
          ..write('repeatDaily: $repeatDaily')
          ..write(')'))
        .toString();
  }
}

class $MedicineTimesTable extends MedicineTimes with TableInfo<$MedicineTimesTable, MedicineTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicineIdMeta = const VerificationMeta('medicineId');
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>('medicine_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES medicines (id)'));
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour =
      GeneratedColumn<int>('hour', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute =
      GeneratedColumn<int>('minute', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, medicineId, hour, minute];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_times';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineTime> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(_medicineIdMeta, medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta));
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(_hourMeta, hour.isAcceptableOrUnknown(data['hour']!, _hourMeta));
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(_minuteMeta, minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta));
    } else if (isInserting) {
      context.missing(_minuteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineTime map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineTime(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicineId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}medicine_id'])!,
      hour: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}hour'])!,
      minute: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}minute'])!,
    );
  }

  @override
  $MedicineTimesTable createAlias(String alias) {
    return $MedicineTimesTable(attachedDatabase, alias);
  }
}

class MedicineTime extends DataClass implements Insertable<MedicineTime> {
  final int id;
  final int medicineId;
  final int hour;
  final int minute;
  const MedicineTime({required this.id, required this.medicineId, required this.hour, required this.minute});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medicine_id'] = Variable<int>(medicineId);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    return map;
  }

  MedicineTimesCompanion toCompanion(bool nullToAbsent) {
    return MedicineTimesCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      hour: Value(hour),
      minute: Value(minute),
    );
  }

  factory MedicineTime.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineTime(
      id: serializer.fromJson<int>(json['id']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineId': serializer.toJson<int>(medicineId),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
    };
  }

  MedicineTime copyWith({int? id, int? medicineId, int? hour, int? minute}) => MedicineTime(
        id: id ?? this.id,
        medicineId: medicineId ?? this.medicineId,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );
  MedicineTime copyWithCompanion(MedicineTimesCompanion data) {
    return MedicineTime(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present ? data.medicineId.value : this.medicineId,
      hour: data.hour.present ? data.hour.value : this.hour,
      minute: data.minute.present ? data.minute.value : this.minute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineTime(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineId, hour, minute);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineTime &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.hour == this.hour &&
          other.minute == this.minute);
}

class MedicineTimesCompanion extends UpdateCompanion<MedicineTime> {
  final Value<int> id;
  final Value<int> medicineId;
  final Value<int> hour;
  final Value<int> minute;
  const MedicineTimesCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
  });
  MedicineTimesCompanion.insert({
    this.id = const Value.absent(),
    required int medicineId,
    required int hour,
    required int minute,
  })  : medicineId = Value(medicineId),
        hour = Value(hour),
        minute = Value(minute);
  static Insertable<MedicineTime> custom({
    Expression<int>? id,
    Expression<int>? medicineId,
    Expression<int>? hour,
    Expression<int>? minute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
    });
  }

  MedicineTimesCompanion copyWith({Value<int>? id, Value<int>? medicineId, Value<int>? hour, Value<int>? minute}) {
    return MedicineTimesCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineTimesCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MedicinesTable medicines = $MedicinesTable(this);
  late final $MedicineTimesTable medicineTimes = $MedicineTimesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [medicines, medicineTimes];
}

typedef $$MedicinesTableCreateCompanionBuilder = MedicinesCompanion Function({
  Value<int> id,
  required String name,
  required DateTime startDate,
  Value<bool> repeatDaily,
});
typedef $$MedicinesTableUpdateCompanionBuilder = MedicinesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> startDate,
  Value<bool> repeatDaily,
});

final class $$MedicinesTableReferences extends BaseReferences<_$AppDatabase, $MedicinesTable, Medicine> {
  $$MedicinesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MedicineTimesTable, List<MedicineTime>> _medicineTimesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.medicineTimes,
          aliasName: $_aliasNameGenerator(db.medicines.id, db.medicineTimes.medicineId));

  $$MedicineTimesTableProcessedTableManager get medicineTimesRefs {
    final manager =
        $$MedicineTimesTableTableManager($_db, $_db.medicineTimes).filter((f) => f.medicineId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_medicineTimesRefsTable($_db));
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MedicinesTableFilterComposer extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get repeatDaily =>
      $composableBuilder(column: $table.repeatDaily, builder: (column) => ColumnFilters(column));

  Expression<bool> medicineTimesRefs(Expression<bool> Function($$MedicineTimesTableFilterComposer f) f) {
    final $$MedicineTimesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medicineTimes,
        getReferencedColumn: (t) => t.medicineId,
        builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
            $$MedicineTimesTableFilterComposer(
              $db: $db,
              $table: $db.medicineTimes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicinesTableOrderingComposer extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get repeatDaily =>
      $composableBuilder(column: $table.repeatDaily, builder: (column) => ColumnOrderings(column));
}

class $$MedicinesTableAnnotationComposer extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name => $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate => $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<bool> get repeatDaily => $composableBuilder(column: $table.repeatDaily, builder: (column) => column);

  Expression<T> medicineTimesRefs<T extends Object>(
      Expression<T> Function($$MedicineTimesTableAnnotationComposer a) f) {
    final $$MedicineTimesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.medicineTimes,
        getReferencedColumn: (t) => t.medicineId,
        builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
            $$MedicineTimesTableAnnotationComposer(
              $db: $db,
              $table: $db.medicineTimes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MedicinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicinesTable,
    Medicine,
    $$MedicinesTableFilterComposer,
    $$MedicinesTableOrderingComposer,
    $$MedicinesTableAnnotationComposer,
    $$MedicinesTableCreateCompanionBuilder,
    $$MedicinesTableUpdateCompanionBuilder,
    (Medicine, $$MedicinesTableReferences),
    Medicine,
    PrefetchHooks Function({bool medicineTimesRefs})> {
  $$MedicinesTableTableManager(_$AppDatabase db, $MedicinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$MedicinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$MedicinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$MedicinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<bool> repeatDaily = const Value.absent(),
          }) =>
              MedicinesCompanion(
            id: id,
            name: name,
            startDate: startDate,
            repeatDaily: repeatDaily,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required DateTime startDate,
            Value<bool> repeatDaily = const Value.absent(),
          }) =>
              MedicinesCompanion.insert(
            id: id,
            name: name,
            startDate: startDate,
            repeatDaily: repeatDaily,
          ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable(table), $$MedicinesTableReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({medicineTimesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (medicineTimesRefs) db.medicineTimes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (medicineTimesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$MedicinesTableReferences._medicineTimesRefsTable(db),
                        managerFromTypedResult: (p0) => $$MedicinesTableReferences(db, table, p0).medicineTimesRefs,
                        referencedItemsForCurrentItem: (item, referencedItems) =>
                            referencedItems.where((e) => e.medicineId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MedicinesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicinesTable,
    Medicine,
    $$MedicinesTableFilterComposer,
    $$MedicinesTableOrderingComposer,
    $$MedicinesTableAnnotationComposer,
    $$MedicinesTableCreateCompanionBuilder,
    $$MedicinesTableUpdateCompanionBuilder,
    (Medicine, $$MedicinesTableReferences),
    Medicine,
    PrefetchHooks Function({bool medicineTimesRefs})>;
typedef $$MedicineTimesTableCreateCompanionBuilder = MedicineTimesCompanion Function({
  Value<int> id,
  required int medicineId,
  required int hour,
  required int minute,
});
typedef $$MedicineTimesTableUpdateCompanionBuilder = MedicineTimesCompanion Function({
  Value<int> id,
  Value<int> medicineId,
  Value<int> hour,
  Value<int> minute,
});

final class $$MedicineTimesTableReferences extends BaseReferences<_$AppDatabase, $MedicineTimesTable, MedicineTime> {
  $$MedicineTimesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MedicinesTable _medicineIdTable(_$AppDatabase db) =>
      db.medicines.createAlias($_aliasNameGenerator(db.medicineTimes.medicineId, db.medicines.id));

  $$MedicinesTableProcessedTableManager? get medicineId {
    final manager = $$MedicinesTableTableManager($_db, $_db.medicines).filter((f) => f.id($_item.medicineId));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MedicineTimesTableFilterComposer extends Composer<_$AppDatabase, $MedicineTimesTable> {
  $$MedicineTimesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hour => $composableBuilder(column: $table.hour, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => ColumnFilters(column));

  $$MedicinesTableFilterComposer get medicineId {
    final $$MedicinesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicineId,
        referencedTable: $db.medicines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
            $$MedicinesTableFilterComposer(
              $db: $db,
              $table: $db.medicines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicineTimesTableOrderingComposer extends Composer<_$AppDatabase, $MedicineTimesTable> {
  $$MedicineTimesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => ColumnOrderings(column));

  $$MedicinesTableOrderingComposer get medicineId {
    final $$MedicinesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicineId,
        referencedTable: $db.medicines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
            $$MedicinesTableOrderingComposer(
              $db: $db,
              $table: $db.medicines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicineTimesTableAnnotationComposer extends Composer<_$AppDatabase, $MedicineTimesTable> {
  $$MedicineTimesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id => $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get hour => $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<int> get minute => $composableBuilder(column: $table.minute, builder: (column) => column);

  $$MedicinesTableAnnotationComposer get medicineId {
    final $$MedicinesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicineId,
        referencedTable: $db.medicines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, {$addJoinBuilderToRootComposer, $removeJoinBuilderFromRootComposer}) =>
            $$MedicinesTableAnnotationComposer(
              $db: $db,
              $table: $db.medicines,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MedicineTimesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicineTimesTable,
    MedicineTime,
    $$MedicineTimesTableFilterComposer,
    $$MedicineTimesTableOrderingComposer,
    $$MedicineTimesTableAnnotationComposer,
    $$MedicineTimesTableCreateCompanionBuilder,
    $$MedicineTimesTableUpdateCompanionBuilder,
    (MedicineTime, $$MedicineTimesTableReferences),
    MedicineTime,
    PrefetchHooks Function({bool medicineId})> {
  $$MedicineTimesTableTableManager(_$AppDatabase db, $MedicineTimesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$MedicineTimesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () => $$MedicineTimesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$MedicineTimesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> medicineId = const Value.absent(),
            Value<int> hour = const Value.absent(),
            Value<int> minute = const Value.absent(),
          }) =>
              MedicineTimesCompanion(
            id: id,
            medicineId: medicineId,
            hour: hour,
            minute: minute,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int medicineId,
            required int hour,
            required int minute,
          }) =>
              MedicineTimesCompanion.insert(
            id: id,
            medicineId: medicineId,
            hour: hour,
            minute: minute,
          ),
          withReferenceMapper: (p0) =>
              p0.map((e) => (e.readTable(table), $$MedicineTimesTableReferences(db, table, e))).toList(),
          prefetchHooksCallback: ({medicineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
                      dynamic, dynamic, dynamic>>(state) {
                if (medicineId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.medicineId,
                    referencedTable: $$MedicineTimesTableReferences._medicineIdTable(db),
                    referencedColumn: $$MedicineTimesTableReferences._medicineIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MedicineTimesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MedicineTimesTable,
    MedicineTime,
    $$MedicineTimesTableFilterComposer,
    $$MedicineTimesTableOrderingComposer,
    $$MedicineTimesTableAnnotationComposer,
    $$MedicineTimesTableCreateCompanionBuilder,
    $$MedicineTimesTableUpdateCompanionBuilder,
    (MedicineTime, $$MedicineTimesTableReferences),
    MedicineTime,
    PrefetchHooks Function({bool medicineId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MedicinesTableTableManager get medicines => $$MedicinesTableTableManager(_db, _db.medicines);
  $$MedicineTimesTableTableManager get medicineTimes => $$MedicineTimesTableTableManager(_db, _db.medicineTimes);
}
