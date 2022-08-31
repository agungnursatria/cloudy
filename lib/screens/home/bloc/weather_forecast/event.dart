part of 'bloc.dart';

/// [WeatherForecastEvent] is the state of the [WeatherForecastBloc]
///
@immutable
abstract class WeatherForecastEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherForecastGetData extends WeatherForecastEvent {
  final String lat;
  final String lon;
  final String appId;

  WeatherForecastGetData({
    required this.lat,
    required this.lon,
    required this.appId,
  });

  @override
  List<Object?> get props => [lat, lon, appId];
}
