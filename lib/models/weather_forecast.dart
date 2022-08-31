import 'package:cloudy/models/Sys.dart';
import 'package:cloudy/models/cloud.dart';
import 'package:cloudy/models/weather.dart';
import 'package:cloudy/models/weather_forecast_main.dart';
import 'package:cloudy/models/wind.dart';
import 'package:equatable/equatable.dart';

class WeatherForecast extends Equatable {
  final int? dt;
  final WeatherForecastMain? main;
  final List<Weather>? weather;
  final Cloud? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final String? dtTxt;

  const WeatherForecast({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  static List<WeatherForecast> parseList(List<dynamic>? response) {
    return (response != null)
        ? List<WeatherForecast>.from(
            response.map((r) => WeatherForecast.fromJson(r)),
          )
        : [];
  }

  static WeatherForecast? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return WeatherForecast(
      dt: json['dt'],
      main: WeatherForecastMain.fromJson(json['main']),
      weather: Weather.parseList(json['weather']),
      clouds: Cloud.fromJson(json['clouds']),
      wind: Wind.fromJson(json['wind']),
      visibility: json['visibility'],
      pop: (json['pop'] as num?)?.toDouble(),
      sys: Sys.fromJson(json['sys']),
      dtTxt: json['dt_txt'],
    );
  }

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dtTxt,
      ];
}
