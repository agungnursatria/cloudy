import 'package:cloudy/config/network/error/network_error.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/screens/home/widgets/components/shimmer_list.dart';
import 'package:cloudy/screens/home/widgets/components/weather_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final bool isLoading;
  final NetworkError? error;
  final WeatherResponse? weatherResponse;
  final Function(WeatherForecast) onTapWeather;

  const HomeView({
    Key? key,
    required this.isLoading,
    this.error,
    this.weatherResponse,
    required this.onTapWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: isLoading
          ? const ShimmerList()
          : (error != null)
              ? Center(child: Text(error!.message))
              : weatherResponse?.list?.isNotEmpty == true
                  ? WeatherListView(
                      onTapWeather: onTapWeather,
                      weatherResponse: weatherResponse,
                    )
                  : const Center(child: Text('No data found')),
    );
  }
}
