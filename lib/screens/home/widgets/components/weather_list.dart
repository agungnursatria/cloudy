// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/screens/home/widgets/components/weather_item.dart';
import 'package:flutter/material.dart';

class WeatherListView extends StatelessWidget {
  final WeatherResponse? weatherResponse;
  final Function(WeatherForecast) onTapWeather;

  const WeatherListView({
    Key? key,
    this.weatherResponse,
    required this.onTapWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<WeatherForecast>? _list = weatherResponse?.list;
    return ListView.separated(
      itemCount: _list?.length ?? 0,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: ((_, i) => WeatherItemView(
            weatherForecast: _list![i],
            onTapWeather: onTapWeather,
          )),
    );
  }
}
