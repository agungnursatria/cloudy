import 'package:cloudy/config/network/error/network_error.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/screens/home/bloc/weather_forecast/bloc.dart';
import 'package:cloudy/screens/home/initiator.dart';
import 'package:cloudy/screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomePage] is [StatefulWidget] has a responsibility as
/// a bridge between [HomeView] and [HomeInitiator],
///
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeInitiator _i;

  @override
  void initState() {
    super.initState();
    _i = HomeInitiator()..init();
  }

  @override
  void dispose() {
    _i.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _i.bloc,
      builder: (context, state) {
        NetworkError? _error;
        WeatherResponse? _weatherResponse;
        bool _isLoading = false;

        if (state is WeatherForecastInit) {
          _isLoading = true;
        }
        if (state is WeatherForecastLoading) {
          _isLoading = true;
        }
        if (state is WeatherForecastError) {
          _error = state.error;
        }
        if (state is WeatherForecastLoaded) {
          _weatherResponse = state.weatherResponse;
        }

        return HomeView(
          isLoading: _isLoading,
          error: _error,
          onTapWeather: _i.onTapWeather,
          weatherResponse: _weatherResponse,
        );
      },
    );
  }
}
