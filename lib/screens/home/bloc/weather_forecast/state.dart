part of 'bloc.dart';

/// [WeatherForecastState] is the state of the [WeatherForecastBloc]
///
@immutable
abstract class WeatherForecastState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherForecastInit extends WeatherForecastState {}

class WeatherForecastLoading extends WeatherForecastState {}

class WeatherForecastLoaded extends WeatherForecastState {
  final WeatherResponse? weatherResponse;
  WeatherForecastLoaded({this.weatherResponse});

  @override
  List<Object?> get props => [weatherResponse];
}

class WeatherForecastError extends WeatherForecastState {
  final NetworkError error;
  WeatherForecastError({required this.error});

  @override
  List<Object?> get props => [error];
}
