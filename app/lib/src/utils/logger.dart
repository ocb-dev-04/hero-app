import 'dart:developer';
import 'package:flutter/foundation.dart';

/// Class to show data in console
class DebugLogger {
  static void show(
    String message, {
    String fileName = 'Generic',
  }) {
    if (kDebugMode) log(message, name: fileName);
  }
}
