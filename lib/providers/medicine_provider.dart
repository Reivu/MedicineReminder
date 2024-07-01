import 'dart:typed_data';

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
      ));
    }

    notifyListeners();
  }

  Future<void> addMedicine(med.Medicine medicine) async {
    final medicineId = await database.insertMedicine(MedicinesCompanion(
      name: Value(medicine.name),
      startDate: Value(medicine.startDate),
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
    ));
    scheduleMedicineNotifications(medicineId, medicine);
    notifyListeners();
  }

  Future<void> updateMedicine(med.Medicine medicine) async {
    if (medicine.id == null) {
      throw Exception("Medicine id is null");
    }

    await database.updateMedicine(MedicinesCompanion(
      id: Value(medicine.id!),
      name: Value(medicine.name),
      startDate: Value(medicine.startDate),
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

    await cancelMedicineNotifications(medicine.id!);
    scheduleMedicineNotifications(medicine.id!, medicine);
    notifyListeners();
  }

  void scheduleMedicineNotifications(int medicineId, med.Medicine medicine) {
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
      final scheduledDate = DateTime(now.year, now.month, now.day, time.hour, time.minute);

      if (scheduledDate.isAfter(now)) {
        flutterLocalNotificationsPlugin.zonedSchedule(
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
          matchDateTimeComponents: DateTimeComponents.time,
        );
      }
    }
  }

  Future<void> cancelMedicineNotifications(int medicineId) async {
    for (final time in _medicines.firstWhere((m) => m.id == medicineId).timesPerDay) {
      await flutterLocalNotificationsPlugin.cancel(medicineId + time.hashCode);
    }
  }
}
