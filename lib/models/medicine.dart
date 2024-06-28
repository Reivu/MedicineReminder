import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final DateTime startDate;
  final List<TimeOfDay> timesPerDay;

  Medicine({
    required this.name,
    required this.startDate,
    required this.timesPerDay,
  });
}
