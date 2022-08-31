import 'package:cloudy/app.dart';
import 'package:cloudy/config/environment/env.dart';
import 'package:cloudy/di/injector.dart';
import 'package:flutter/material.dart';

void main() {
  Injector().init();
  Env().initEnv();
  runApp(const MyApp());
}
