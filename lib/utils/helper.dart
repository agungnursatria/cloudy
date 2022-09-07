import 'package:flutter/material.dart';

class Helper {
  /// This method [catchError] is used to Prints a message to the
  /// console related to any error found on use
  ///
  static dynamic catchError(
    dynamic exception,
    StackTrace? stackTrace,
  ) {
    debugPrint('Error:\n${exception.toString()}');
    debugPrint('StackTrace:\n${stackTrace.toString()}');
  }

  static double kelvinToCelcius(double? kelvin) {
    if (kelvin == null) return 0;
    return kelvin - 273.15;
  }
}
