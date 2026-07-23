import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// String extension helpers.
extension StringX on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String truncate(int maxChars, {String suffix = '...'}) {
    if (length <= maxChars) return this;
    return '${substring(0, maxChars)}$suffix';
  }

  String? get nullIfEmpty => trim().isEmpty ? null : this;
}

/// DateTime extension helpers.
extension DateTimeX on DateTime {
  String toDisplayDate() => DateFormat('dd/MM/yyyy').format(this);
  String toDisplayDateTime() => DateFormat('dd/MM/yyyy HH:mm').format(this);
  String toIsoDate() => DateFormat('yyyy-MM-dd').format(this);
}

/// BuildContext extension helpers for theme access.
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

/// Common form field validators.
class Validators {
  Validators._();

  static String? required(String? value, [String message = 'This field is required']) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final regex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!regex.hasMatch(value.replaceAll(' ', ''))) return 'Enter a valid phone number';
    return null;
  }

  static String? passport(String? value) {
    if (value == null || value.trim().isEmpty) return 'Passport number is required';
    if (value.trim().length < 5) return 'Passport number too short';
    return null;
  }

  static String? numericRange(String? value, double min, double max) {
    if (value == null || value.trim().isEmpty) return null;
    final numVal = double.tryParse(value);
    if (numVal == null) return 'Must be a valid number';
    if (numVal < min || numVal > max) return 'Value must be between $min and $max';
    return null;
  }
}

/// Common date, number, and serial formatters.
class Formatters {
  Formatters._();

  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  static String generateSerialNumber(int sequence, {int? year}) {
    final y = year ?? DateTime.now().year;
    final seqStr = sequence.toString().padLeft(4, '0');
    return '$y/$seqStr';
  }
}

/// Enterprise constants and master dropdown choices.
class AppConstants {
  AppConstants._();

  static const List<String> bloodGroups = [
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'
  ];

  static const List<String> genders = ['Male', 'Female', 'Other'];

  static const List<String> nationalities = [
    'Indian', 'Nepalese', 'Bangladeshi', 'Sri Lankan', 'Filipino', 'Indonesian', 'Pakistani', 'Egyptian', 'Other'
  ];

  static const List<String> resultOptions = [
    'NORMAL', 'NAD', 'ABNORMAL', 'NIL', 'ABSENT'
  ];

  static const List<String> elisaOptions = [
    'NEGATIVE', 'POSITIVE', 'NON-REACTIVE', 'REACTIVE'
  ];
}

/// Global keyboard shortcut intents.
class NewReportIntent extends Intent { const NewReportIntent(); }
class PrintReportIntent extends Intent { const PrintReportIntent(); }
class SaveReportIntent extends Intent { const SaveReportIntent(); }
class SearchIntent extends Intent { const SearchIntent(); }

class AppShortcuts {
  AppShortcuts._();

  static final Map<ShortcutActivator, Intent> shortcuts = {
    const SingleActivator(LogicalKeyboardKey.keyN, control: true): const NewReportIntent(),
    const SingleActivator(LogicalKeyboardKey.keyP, control: true): const PrintReportIntent(),
    const SingleActivator(LogicalKeyboardKey.keyS, control: true): const SaveReportIntent(),
    const SingleActivator(LogicalKeyboardKey.keyF, control: true): const SearchIntent(),
  };
}
