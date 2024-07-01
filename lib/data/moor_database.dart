import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'dart:io';

import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'moor_database.g.dart';

class Medicines extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get startDate => dateTime()();
}

class MedicineTimes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicineId => integer().references(Medicines, #id)();
  IntColumn get hour => integer()();
  IntColumn get minute => integer()();
}

@DriftDatabase(tables: [Medicines, MedicineTimes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Medicine>> getAllMedicines() => select(medicines).get();
  Future<int> insertMedicine(MedicinesCompanion medicine) => into(medicines).insert(medicine);
  Future<bool> updateMedicine(MedicinesCompanion medicine) => update(medicines).replace(medicine);
  Future<int> deleteMedicineTimes(int medicineId) =>
      (delete(medicineTimes)..where((tbl) => tbl.medicineId.equals(medicineId))).go();
  Future<List<MedicineTime>> getMedicineTimes(int medicineId) {
    return (select(medicineTimes)..where((tbl) => tbl.medicineId.equals(medicineId))).get();
  }

  Future<int> insertMedicineTime(MedicineTimesCompanion medicineTime) =>
      into(medicineTimes).insert(medicineTime);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
