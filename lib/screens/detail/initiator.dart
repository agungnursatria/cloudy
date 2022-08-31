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
  void getArgument(BuildContext context) {
    _argument = ModalRoute.of(context)?.settings.arguments as DetailArgument?;
  }

  void onBack() {
    Navi _navi = Injector().find();
    _navi.pop();
  }
}
