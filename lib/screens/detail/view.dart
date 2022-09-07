// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloudy/models/weather.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/utils/constant/unicode.dart';
import 'package:cloudy/utils/formatter_time.dart';
import 'package:cloudy/utils/helper.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final WeatherForecast? forecast;
  final VoidCallback onBack;

  const DetailView({
    Key? key,
    this.forecast,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Weather? _weather = forecast?.weather?[0];
    String? _weatherIcon = _weather?.icon;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12.0),
            Text(
              FormatterTime.formatStringDate(
                forecast?.dtTxt ?? '',
                format: 'EEEE, MMMM d, yyyy',
                locale: 'en',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              FormatterTime.formatStringDate(
                forecast?.dtTxt ?? '',
                format: 'hh:mm aaa',
                locale: 'en',
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${Helper.kelvinToCelcius(forecast?.main?.temp)}${UnicodeConstant.DEGREE}C',
                  style: const TextStyle(
                    fontSize: 32,
                  ),
                ),
                Image.network(
                  'http://openweathermap.org/img/wn/$_weatherIcon@2x.png',
                  width: 80,
                  height: 80,
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${_weather?.main} (${_weather?.description})',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Temp (min)',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${Helper.kelvinToCelcius(forecast?.main?.tempMin).toStringAsFixed(1)}${UnicodeConstant.DEGREE}C',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Temp (max)',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${Helper.kelvinToCelcius(forecast?.main?.tempMax).toStringAsFixed(1)}${UnicodeConstant.DEGREE}C',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
