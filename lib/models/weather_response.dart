import 'package:cloudy/models/city.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:equatable/equatable.dart';

class WeatherResponse extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherForecast>? list;
  final City? city;

  const WeatherResponse({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  static WeatherResponse? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return WeatherResponse(
      cod: json["cod"],
      message: json["message"],
      cnt: json["cnt"],
      list: WeatherForecast.parseList(json["list"]),
      city: City.fromJson(json["city"]),
    );
  }

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
