import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../data/moor_database.dart';
import '../models/medicine.dart' as med;

class MedicineProvider with ChangeNotifier {
  final database = AppDatabase();
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  List<med.Medicine> _medicines = [];
  List<med.Medicine> get medicines => _medicines;

  MedicineProvider() {
    _loadMedicines();
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _loadMedicines() async {
    final dbMedicines = await database.getAllMedicines();
    _medicines = [];

    for (var dbMedicine in dbMedicines) {
      final times = await database.getMedicineTimes(dbMedicine.id);

      _medicines.add(med.Medicine(
        id: dbMedicine.id,
        name: dbMedicine.name,
        startDate: dbMedicine.startDate,
        timesPerDay: times.map((t) => TimeOfDay(hour: t.hour, minute: t.minute)).toList(),
        repeatDaily: dbMedicine.repeatDaily,
      ));
    }

    notifyListeners();
  }

  Future<void> addMedicine(med.Medicine medicine) async {
    final medicineId = await database.insertMedicine(MedicinesCompanion(
      name: Value(medicine.name),
      startDate: Value(medicine.startDate),
      repeatDaily: Value(medicine.repeatDaily),
    ));

    for (var time in medicine.timesPerDay) {
      await database.insertMedicineTime(MedicineTimesCompanion(
        medicineId: Value(medicineId),
        hour: Value(time.hour),
        minute: Value(time.minute),
      ));
    }

    _medicines.add(med.Medicine(
      id: medicineId,
      name: medicine.name,
      startDate: medicine.startDate,
      timesPerDay: medicine.timesPerDay,
      repeatDaily: medicine.repeatDaily,
    ));

    scheduleMedicineNotifications(medicineId, medicine);
    notifyListeners();
  }

  Future<void> updateMedicine(med.Medicine medicine) async {
    if (medicine.id == null) {
      throw Exception("Medicine id is null");
    }

    await cancelMedicineNotifications(medicine.id!);

    await database.updateMedicine(MedicinesCompanion(
      id: Value(medicine.id!),
      name: Value(medicine.name),
      startDate: Value(medicine.startDate),
      repeatDaily: Value(medicine.repeatDaily),
    ));

    await database.deleteMedicineTimes(medicine.id!);

    for (var time in medicine.timesPerDay) {
      await database.insertMedicineTime(MedicineTimesCompanion(
        medicineId: Value(medicine.id!),
        hour: Value(time.hour),
        minute: Value(time.minute),
      ));
    }

    final index = _medicines.indexWhere((m) => m.id == medicine.id);
    if (index != -1) {
      _medicines[index] = medicine;
    }

    scheduleMedicineNotifications(medicine.id!, medicine);
    notifyListeners();
  }

  Future<void> deleteMedicine(int medicineId) async {
    await cancelMedicineNotifications(medicineId);
    await database.deleteMedicine(medicineId);
    _medicines.removeWhere((m) => m.id == medicineId);
    notifyListeners();
  }

  Future<void> scheduleMedicineNotifications(int medicineId, med.Medicine medicine) async {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));

    const int insistentFlag = 4;

    final Int64List vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 2000;
    vibrationPattern[2] = 4000;
    vibrationPattern[2] = 4000;

    for (final time in medicine.timesPerDay) {
      final now = DateTime.now();
      var scheduledDate = DateTime(
        medicine.startDate.year,
        medicine.startDate.month,
        medicine.startDate.day,
        time.hour,
        time.minute,
      );

      if (scheduledDate.isBefore(now)) {
        scheduledDate = DateTime(
          now.year,
          now.month,
          now.day,
          time.hour,
          time.minute,
        );

        if (scheduledDate.isBefore(now)) {
          scheduledDate = scheduledDate.add(const Duration(days: 1));
        }
      }

      await flutterLocalNotificationsPlugin.zonedSchedule(
        medicineId + time.hashCode, // unique id
        'Waktunya minum obat ${medicine.name}',
        'Saatnya minum obat',
        tz.TZDateTime.from(scheduledDate, tz.local),
        NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
            playSound: true,
            sound: const RawResourceAndroidNotificationSound('alarm'),
            additionalFlags: Int32List.fromList(<int>[insistentFlag]),
            vibrationPattern: vibrationPattern,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: medicine.repeatDaily ? DateTimeComponents.time : null,
      );
    }
  }

  Future<void> cancelMedicineNotifications(int medicineId) async {
    final medicine = _medicines.firstWhereOrNull((m) => m.id == medicineId);

    if (medicine != null) {
      for (final time in medicine.timesPerDay) {
        await flutterLocalNotificationsPlugin.cancel(medicineId + time.hashCode);
      }
    }
  }
}
