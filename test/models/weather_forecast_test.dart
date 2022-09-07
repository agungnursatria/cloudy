// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:cloudy/models/Sys.dart';
import 'package:cloudy/models/city.dart';
import 'package:cloudy/models/cloud.dart';
import 'package:cloudy/models/coordinate.dart';
import 'package:cloudy/models/rain.dart';
import 'package:cloudy/models/weather.dart';
import 'package:cloudy/models/weather_forecast.dart';
import 'package:cloudy/models/weather_forecast_main.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/models/wind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> _response;
  final WeatherResponse _weatherResponse = WeatherResponse(
    cod: '200',
    message: 0,
    cnt: 1,
    list: [
      WeatherForecast(
        dt: 1661968800,
        main: WeatherForecastMain(
          temp: 300.6,
          feelsLike: 303.11,
          tempMin: 300.23,
          tempMax: 300.6,
          pressure: 1009,
          seaLevel: 1009,
          groundLevel: 1008,
          humidity: 73,
          tempKF: 0.37,
        ),
        weather: [
          Weather(
            id: 500,
            main: 'Rain',
            description: 'light rain',
            icon: '10n',
          ),
        ],
        clouds: Cloud(all: 32),
        wind: Wind(
          speed: 3.04,
          degree: 104,
          gust: 4.52,
        ),
        visibility: 10000,
        pop: 0.5,
        rain: Rain(threeH: 0.72),
        sys: Sys(pod: 'n'),
        dtTxt: "2022-08-31 18:00:00",
      ),
    ],
    city: City(
      id: 1631845,
      name: "Pecenongan",
      coord: Coordinate(
        lat: -6.1751,
        lon: 106.8271,
      ),
      country: "ID",
      population: 0,
      timezone: 25200,
      sunrise: 1661900030,
      sunset: 1661943177,
    ),
  );

  setUp(() {
    _response = {
      "cod": "200",
      "message": 0,
      "cnt": 1,
      "list": [
        {
          "dt": 1661968800,
          "main": {
            "temp": 300.6,
            "feels_like": 303.11,
            "temp_min": 300.23,
            "temp_max": 300.6,
            "pressure": 1009,
            "sea_level": 1009,
            "grnd_level": 1008,
            "humidity": 73,
            "temp_kf": 0.37
          },
          "weather": [
            {
              "id": 500,
              "main": "Rain",
              "description": "light rain",
              "icon": "10n"
            }
          ],
          "clouds": {"all": 32},
          "wind": {"speed": 3.04, "deg": 104, "gust": 4.52},
          "visibility": 10000,
          "pop": 0.5,
          "rain": {"3h": 0.72},
          "sys": {"pod": "n"},
          "dt_txt": "2022-08-31 18:00:00"
        },
      ],
      "city": {
        "id": 1631845,
        "name": "Pecenongan",
        "coord": {"lat": -6.1751, "lon": 106.8271},
        "country": "ID",
        "population": 0,
        "timezone": 25200,
        "sunrise": 1661900030,
        "sunset": 1661943177
      }
    };
  });

  test('Positive Case: should be a class of WeatherResponse', () {
    expect(_weatherResponse, isA<WeatherResponse>());
  });

  test('Positive Case: Parse data from response to model', () {
    WeatherResponse _wResponse = WeatherResponse.fromJson(_response)!;
    expect(_weatherResponse, _wResponse);
  });
}
