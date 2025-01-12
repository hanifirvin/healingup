// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

List<String> sortAvailableDays(List<String>? unsortedDays) {
  if (unsortedDays == null) return [];

  final dayOrder = {
    'Senin': 1,
    'Selasa': 2,
    'Rabu': 3,
    'Kamis': 4,
    'Jumat': 5,
  };

  final sortedDays = List<String>.from(unsortedDays);
  sortedDays.sort((a, b) => (dayOrder[a] ?? 0).compareTo(dayOrder[b] ?? 0));

  return sortedDays;
}
