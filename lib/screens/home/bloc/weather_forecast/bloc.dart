import 'package:cloudy/config/network/error/network_error.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/screens/home/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

/// [WeatherForecastBloc] is a state management.
/// This BLoC function is to fetch weather forecast data from API
///
class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final HomeService _service;

  WeatherForecastBloc({required HomeService service})
      : _service = service,
        super(WeatherForecastInit()) {
    on<WeatherForecastGetData>(_onWeatherForecastListen);
  }

  Future<void> _onWeatherForecastListen(
    WeatherForecastGetData event,
    Emitter<WeatherForecastState> emit,
  ) async {
    if (state is WeatherForecastLoading) return;

    emit(WeatherForecastLoading());

    await _service
        .getWeatherForecast(
          appId: event.appId,
          lat: event.lat,
          lon: event.lon,
        )
        .then(
          (foldable) => foldable.fold(
            (networkModel) => emit(WeatherForecastLoaded(
              weatherResponse: WeatherResponse.fromJson(networkModel.response),
            )),
            (networkError) => emit(WeatherForecastError(error: networkError)),
          ),
        );
  }
}
