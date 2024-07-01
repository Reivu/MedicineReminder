import 'package:flutter/material.dart';

class Medicine {
  final int? id;
  final String name;
  final DateTime startDate;
  final List<TimeOfDay> timesPerDay;

  Medicine({
    this.id,
    required this.name,
    required this.startDate,
    required this.timesPerDay,
  });
}
