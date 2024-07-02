// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// ignore_for_file: type=lint
class $MedicinesTable extends Medicines
    with TableInfo<$MedicinesTable, Medicine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _repeatDailyMeta =
      const VerificationMeta('repeatDaily');
  @override
  late final GeneratedColumn<bool> repeatDaily = GeneratedColumn<bool>(
      'repeat_daily', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("repeat_daily" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, name, startDate, repeatDaily];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicines';
  @override
  VerificationContext validateIntegrity(Insertable<Medicine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('repeat_daily')) {
      context.handle(
          _repeatDailyMeta,
          repeatDaily.isAcceptableOrUnknown(
              data['repeat_daily']!, _repeatDailyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medicine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      repeatDaily: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}repeat_daily'])!,
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
  const Medicine(
      {required this.id,
      required this.name,
      required this.startDate,
      required this.repeatDaily});
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

  factory Medicine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  Medicine copyWith(
          {int? id, String? name, DateTime? startDate, bool? repeatDaily}) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        repeatDaily: repeatDaily ?? this.repeatDaily,
      );
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
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? startDate,
      Value<bool>? repeatDaily}) {
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

class $MedicineTimesTable extends MedicineTimes
    with TableInfo<$MedicineTimesTable, MedicineTime> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineTimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicineIdMeta =
      const VerificationMeta('medicineId');
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>(
      'medicine_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES medicines (id)'));
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
      'hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
      'minute', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, medicineId, hour, minute];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_times';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineTime> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
          _medicineIdMeta,
          medicineId.isAcceptableOrUnknown(
              data['medicine_id']!, _medicineIdMeta));
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('hour')) {
      context.handle(
          _hourMeta, hour.isAcceptableOrUnknown(data['hour']!, _hourMeta));
    } else if (isInserting) {
      context.missing(_hourMeta);
    }
    if (data.containsKey('minute')) {
      context.handle(_minuteMeta,
          minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta));
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
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medicine_id'])!,
      hour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hour'])!,
      minute: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minute'])!,
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
  const MedicineTime(
      {required this.id,
      required this.medicineId,
      required this.hour,
      required this.minute});
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

  factory MedicineTime.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
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

  MedicineTime copyWith({int? id, int? medicineId, int? hour, int? minute}) =>
      MedicineTime(
        id: id ?? this.id,
        medicineId: medicineId ?? this.medicineId,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );
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

  MedicineTimesCompanion copyWith(
      {Value<int>? id,
      Value<int>? medicineId,
      Value<int>? hour,
      Value<int>? minute}) {
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
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MedicinesTable medicines = $MedicinesTable(this);
  late final $MedicineTimesTable medicineTimes = $MedicineTimesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [medicines, medicineTimes];
}

typedef $$MedicinesTableInsertCompanionBuilder = MedicinesCompanion Function({
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

class $$MedicinesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicinesTable,
    Medicine,
    $$MedicinesTableFilterComposer,
    $$MedicinesTableOrderingComposer,
    $$MedicinesTableProcessedTableManager,
    $$MedicinesTableInsertCompanionBuilder,
    $$MedicinesTableUpdateCompanionBuilder> {
  $$MedicinesTableTableManager(_$AppDatabase db, $MedicinesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MedicinesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MedicinesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MedicinesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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
        ));
}

class $$MedicinesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MedicinesTable,
    Medicine,
    $$MedicinesTableFilterComposer,
    $$MedicinesTableOrderingComposer,
    $$MedicinesTableProcessedTableManager,
    $$MedicinesTableInsertCompanionBuilder,
    $$MedicinesTableUpdateCompanionBuilder> {
  $$MedicinesTableProcessedTableManager(super.$state);
}

class $$MedicinesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get repeatDaily => $state.composableBuilder(
      column: $state.table.repeatDaily,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter medicineTimesRefs(
      ComposableFilter Function($$MedicineTimesTableFilterComposer f) f) {
    final $$MedicineTimesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.medicineTimes,
        getReferencedColumn: (t) => t.medicineId,
        builder: (joinBuilder, parentComposers) =>
            $$MedicineTimesTableFilterComposer(ComposerState($state.db,
                $state.db.medicineTimes, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MedicinesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get repeatDaily => $state.composableBuilder(
      column: $state.table.repeatDaily,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MedicineTimesTableInsertCompanionBuilder = MedicineTimesCompanion
    Function({
  Value<int> id,
  required int medicineId,
  required int hour,
  required int minute,
});
typedef $$MedicineTimesTableUpdateCompanionBuilder = MedicineTimesCompanion
    Function({
  Value<int> id,
  Value<int> medicineId,
  Value<int> hour,
  Value<int> minute,
});

class $$MedicineTimesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicineTimesTable,
    MedicineTime,
    $$MedicineTimesTableFilterComposer,
    $$MedicineTimesTableOrderingComposer,
    $$MedicineTimesTableProcessedTableManager,
    $$MedicineTimesTableInsertCompanionBuilder,
    $$MedicineTimesTableUpdateCompanionBuilder> {
  $$MedicineTimesTableTableManager(_$AppDatabase db, $MedicineTimesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MedicineTimesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MedicineTimesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MedicineTimesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
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
          getInsertCompanionBuilder: ({
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
        ));
}

class $$MedicineTimesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MedicineTimesTable,
    MedicineTime,
    $$MedicineTimesTableFilterComposer,
    $$MedicineTimesTableOrderingComposer,
    $$MedicineTimesTableProcessedTableManager,
    $$MedicineTimesTableInsertCompanionBuilder,
    $$MedicineTimesTableUpdateCompanionBuilder> {
  $$MedicineTimesTableProcessedTableManager(super.$state);
}

class $$MedicineTimesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MedicineTimesTable> {
  $$MedicineTimesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get hour => $state.composableBuilder(
      column: $state.table.hour,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get minute => $state.composableBuilder(
      column: $state.table.minute,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$MedicinesTableFilterComposer get medicineId {
    final $$MedicinesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicineId,
        referencedTable: $state.db.medicines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MedicinesTableFilterComposer(ComposerState(
                $state.db, $state.db.medicines, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MedicineTimesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MedicineTimesTable> {
  $$MedicineTimesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get hour => $state.composableBuilder(
      column: $state.table.hour,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get minute => $state.composableBuilder(
      column: $state.table.minute,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$MedicinesTableOrderingComposer get medicineId {
    final $$MedicinesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.medicineId,
        referencedTable: $state.db.medicines,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MedicinesTableOrderingComposer(ComposerState(
                $state.db, $state.db.medicines, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MedicinesTableTableManager get medicines =>
      $$MedicinesTableTableManager(_db, _db.medicines);
  $$MedicineTimesTableTableManager get medicineTimes =>
      $$MedicineTimesTableTableManager(_db, _db.medicineTimes);
}
