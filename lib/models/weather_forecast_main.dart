import 'package:equatable/equatable.dart';

class WeatherForecastMain extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? groundLevel;
  final int? humidity;
  final double? tempKF;

  const WeatherForecastMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.groundLevel,
    this.humidity,
    this.tempKF,
  });

  static WeatherForecastMain? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return WeatherForecastMain(
      temp: (json['tem'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKF: (json['temp_kf'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        groundLevel,
        humidity,
        tempKF,
      ];
}
