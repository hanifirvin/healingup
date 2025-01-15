import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime> getAvailSlots(
  List<DateTime> reservedSlots,
  DateTime startDateArg,
) {
  List<DateTime> availableBookings = [];
  DateTime now = startDateArg;
  DateTime startTime = DateTime(now.year, now.month, now.day, now.hour, 0);
  DateTime endTime = startTime.add(const Duration(days: 2)); // now+2days

  for (DateTime currentTime = startTime;
      currentTime.isBefore(endTime);
      currentTime = currentTime.add(const Duration(hours: 1))) {
    bool isReserved = false;

    for (DateTime reservedTime in reservedSlots) {
      if (currentTime.year == reservedTime.year &&
          currentTime.month == reservedTime.month &&
          currentTime.day == reservedTime.day &&
          currentTime.hour == reservedTime.hour) {
        isReserved = true;
        break;
      }
    }

    if (!isReserved && currentTime.hour >= 9 && currentTime.hour <= 17) {
      availableBookings.add(currentTime);
    }
  }

  List<DateTime> availableSlots = availableBookings
      .where((dateTime) => dateTime.day == availableBookings[0].day)
      .toList();

  return availableSlots;
}

int stringToInt(String arg1) {
  return int.parse(arg1);
}

double getAverage(List<int> reviews) {
  int sum = reviews.reduce(((int value, int element) => value + element));
  return sum / reviews.length;
}

DateTime scheduledFunction(DateTime availableSlots) {
  // set scheduled time  15 minutes before the time chosen on availableSlots item function
  DateTime scheduledTime = availableSlots.subtract(const Duration(minutes: 15));
  return scheduledTime;
}

String? getScheduledTime(
  DateTime? createdAt,
  String? scheduledTime,
  DateTime? scheduledDate,
) {
  if (createdAt == null || scheduledTime == null || scheduledDate == null) {
    return 'Waktu tidak valid';
  }

  // Parse scheduled time (format "HH:mm")
  final timeParts = scheduledTime.split(':');
  final scheduledDateTime = DateTime(
    scheduledDate.year,
    scheduledDate.month,
    scheduledDate.day,
    int.parse(timeParts[0]),
    int.parse(timeParts[1]),
  );

  final now = DateTime.now();
  final difference = scheduledDateTime.difference(now);
  final minutes = difference.inMinutes;

  // Jika lebih dari 60 menit setelah jadwal
  if (minutes < -60) {
    return 'Waktu telah habis';
  }

  // Jika tepat pada waktunya (dari jadwal sampai 60 menit setelahnya)
  if (minutes <= 0 && minutes >= -60) {
    return 'Mulai video call';
  }

  // Jika masih ada waktu tersisa
  final days = difference.inHours ~/ 24;
  final remainingHours = difference.inHours.remainder(24);
  final remainingMinutes = minutes.remainder(60);

  String timeString = '';
  if (days > 0) {
    timeString += '$days hari';
    if (remainingHours > 0) timeString += ' $remainingHours jam';
    if (remainingMinutes > 0) timeString += ' $remainingMinutes menit';
  } else if (remainingHours > 0) {
    timeString += '$remainingHours jam';
    if (remainingMinutes > 0) timeString += ' $remainingMinutes menit';
  } else {
    timeString += '$remainingMinutes menit';
  }
  return timeString;
}

String? getCurrentDayInIndonesian() {
  final now = DateTime.now();
  final days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
  return days[now.weekday == 7 ? 0 : now.weekday];
}

String? getCurrentHoursNow() {
  final now = DateTime.now();
  return '${now.hour.toString().padLeft(2, '0')}:00';
}

DateTime? getStartOfDay() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime? getEndOfDay() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, 23, 59, 59);
}

DateTime getEndOfWeek() {
  final now = DateTime.now();
  // Calculate days until next Sunday
  final daysUntilSunday = DateTime.sunday - now.weekday;
  // If today is Sunday, we want this Sunday not next week
  final daysToAdd = daysUntilSunday <= 0 ? 7 + daysUntilSunday : daysUntilSunday;
  return DateTime(now.year, now.month, now.day + daysToAdd);
}

String? documentReferenceToString() {
  // document Reference To String
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection('users').doc('user1');
  return documentReference.path;
}

String? greetingsTime() {
  // Get the current hour
  final now = DateTime.now();
  final currentHour = now.hour;

  // Check the time of the day
  if (currentHour >= 0 && currentHour < 12) {
    return 'Selamat pagi';
  } else if (currentHour >= 12 && currentHour < 18) {
    return 'Selamat siang';
  } else {
    return 'Selamat malam';
  }
}

double? progressBarChangeDurationFunction(int? selectedCycles) {
  // progress bar = selectedCycles/240
  if (selectedCycles == null || selectedCycles <= 0) {
    return 0.0;
  }

  double progress = selectedCycles / 240;
  return progress;
}

int changeDurationTimeFunction(
  int? selectedCycles,
  String? breathType,
) {
  // Handle null values
  if (selectedCycles == null || breathType == null) {
    return 0;
  }

  int totalSeconds = 0;

  switch (breathType.toLowerCase()) {  // Make case-insensitive
    case 'equal':
      // Equal breath: 4s inhale + 4s exhale = 8s per cycle
      totalSeconds = selectedCycles * 8;
      break;
      
    case 'box':
      // Box breath: 4s inhale + 4s hold + 4s exhale + 4s hold = 16s per cycle
      totalSeconds = selectedCycles * 16;
      break;
      
    default:
      // Default to equal breathing if type not recognized
      totalSeconds = selectedCycles * 8;
      break;
  }

  return totalSeconds;
}

String formatDuration(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;

  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

String displayBreath(
  String? breathType,
  int? currentSecond,
) {
  // Handle null values
  if (breathType == null || currentSecond == null) {
    return 'Bersiap';
  }

  switch (breathType.toLowerCase()) {
    case 'equal':
      // Equal breath: 4s inhale + 4s exhale = 8s per cycle
      int cycleLength = 8;
      int currentSecondInCycle = currentSecond % cycleLength;
      
      if (currentSecondInCycle < 4) {
        return 'Tarik Napas';
      } else {
        return 'Buang Napas';
      }

    case 'box':
      // Box breath: 4s inhale + 4s hold + 4s exhale + 4s hold = 16s per cycle
      int cycleLength = 16;
      int currentSecond = DateTime.now().second % cycleLength;
      
      if (currentSecond < 4) {
        return 'Tarik Napas';
      } else if (currentSecond < 8) {
        return 'Tahan Napas';
      } else if (currentSecond < 12) {
        return 'Buang Napas';
      } else {
        return 'Tahan Napas';
      }

    default:
      return 'Bersiap';
  }
}

String getIndonesianMonth(int month) {
  const months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  return months[month - 1];
}

String getIndonesianDay(int weekday) {
  const days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];
  return days[weekday - 1];
}

String formatDateIndonesian(DateTime date) {
  final day = getIndonesianDay(date.weekday);
  final month = getIndonesianMonth(date.month);
  return '$day, ${date.day} $month ${date.year}';
}

String formatTimeIndonesian(DateTime date) {
  return DateFormat('HH:mm').format(date);
}

String formatDateTimeIndonesian(DateTime date) {
  return '${getIndonesianDay(date.weekday)}, ${date.day} ${getIndonesianMonth(date.month)} ${date.year} ${DateFormat('HH:mm').format(date)}';
}
