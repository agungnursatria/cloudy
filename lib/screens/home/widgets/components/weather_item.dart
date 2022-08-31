// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloudy/models/weather.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/utils/constant/unicode.dart';
import 'package:cloudy/utils/formatter_time.dart';
import 'package:flutter/material.dart';

class WeatherItemView extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final Function(WeatherForecast) onTapWeather;

  const WeatherItemView({
    Key? key,
    required this.weatherForecast,
    required this.onTapWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Weather? _weather = weatherForecast.weather?[0];
    String? _weatherIcon = _weather?.icon;
    return InkWell(
      onTap: () => onTapWeather(weatherForecast),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Weather Icon
            (_weatherIcon != null)
                ? Image.network(
                    'http://openweathermap.org/img/wn/$_weatherIcon@2x.png',
                    width: 64,
                    height: 64,
                  )
                : Container(
                    color: Colors.grey,
                    width: 64,
                    height: 64,
                  ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Time
                  Text(
                    FormatterTime.formatStringDate(
                      weatherForecast.dtTxt ?? '',
                      format: 'EEE, MMM d, yyyy hh:mm aaa',
                      locale: 'en',
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),
                  // Weather
                  Text(
                    _weather?.main ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),
                  // Temperature
                  Text(
                    'Temp: ${weatherForecast.main?.temp}${UnicodeConstant.DEGREE}C',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
