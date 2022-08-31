import 'package:cloudy/di/injector.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/screens/detail/argument.dart';
import 'package:cloudy/utils/navi/navi.dart';
import 'package:flutter/material.dart';

class DetailInitiator {
  DetailArgument? _argument;

  /* ----------- PARAMETER ----------- */
  DetailArgument? get argument => _argument;
  WeatherForecast? get forecast => _argument?.weatherForecast;

  /* ----------- FUNCTION ----------- */
  /// [getArgument] is triggered when widget is initialized,
  /// To retrieve data used in this widget
  ///
  void getArgument(BuildContext context) {
    _argument = ModalRoute.of(context)?.settings.arguments as DetailArgument?;
  }

  /// [getArgument] is triggered when user tap back button,
  /// To go back to previous page
  ///
  void onBack() {
    Navi _navi = Injector().find();
    _navi.pop();
  }
}
