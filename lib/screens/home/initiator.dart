// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloudy/config/environment/env.dart';
import 'package:cloudy/di/injector.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/screens/detail/argument.dart';
import 'package:cloudy/screens/detail/page.dart';
import 'package:cloudy/screens/home/bloc/weather_forecast/bloc.dart';
import 'package:cloudy/screens/home/page.dart';
import 'package:cloudy/screens/home/service/service.dart';
import 'package:cloudy/utils/navi/navi.dart';

class HomeInitiator {
  final String _monasLat = '-6.175115064391812';
  final String _monasLon = '106.82708842419382';

  late WeatherForecastBloc _bloc;

  /* ----------- PARAMETER ----------- */
  WeatherForecastBloc get bloc => _bloc;

  /* ----------- FUNCTION ----------- */

  /// [init] is triggered when [HomePage] is inserted to the tree.
  /// It initialize object will be used in [HomePage]
  ///
  void init() {
    _bloc = WeatherForecastBloc(service: Injector().find<HomeService>());
    _bloc.add(WeatherForecastGetData(
      lat: _monasLat,
      lon: _monasLon,
      appId: Env().apiKey,
    ));
  }

  /// [dispose] is triggered when [HomePage] is removed from the tree.
  /// It discard & disable objects that no longer needed.
  ///
  void dispose() {
    _bloc.close();
  }

  /// [onTapWeather] is triggered whenever the user select a weather forecast from list
  /// This function will open weather detail page and display
  /// the detail of weather forecast.
  ///
  void onTapWeather(WeatherForecast forecast) {
    Navi _navi = Injector().find();
    _navi.navigateToNamed(
      DetailPage.PATH,
      arguments: DetailArgument(
        weatherForecast: forecast,
      ),
    );
  }
}
