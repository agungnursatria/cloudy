// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_declarations

import 'package:bloc_test/bloc_test.dart';
import 'package:cloudy/config/network/error/network_error.dart';
import 'package:cloudy/config/network/http/network_http_model.dart';
import 'package:cloudy/models/weather_response.dart';
import 'package:cloudy/screens/home/bloc/weather_forecast/bloc.dart';
import 'package:cloudy/screens/home/service/service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_forecast_bloc_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  HomeService _service = MockHomeService();
  late WeatherForecastBloc _bloc;
  late WeatherForecastState _state;
  late Map<String, dynamic> _response;
  late NetworkError _error;
  WeatherResponse? _weatherResponse;

  final String _monasLat = '-6.175115064391812';
  final String _monasLon = '106.82708842419382';
  final String _apiKey = '1fda9a057f0e2e9f4faa7dad5213e153';

  setUp(
    () {
      _bloc = WeatherForecastBloc(service: _service);
      _state = WeatherForecastInit();
      _error = NetworkError();
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
      _weatherResponse = WeatherResponse.fromJson(_response);
    },
  );

  tearDown(() {
    _bloc.close();
  });

  test('Initial state is correct', () {
    expect(_state, _bloc.state);
  });

  blocTest<WeatherForecastBloc, WeatherForecastState>(
    'Close doesn\'t emit new states',
    build: () => _bloc,
    act: (bloc) => bloc.close(),
    expect: () => [],
  );
  group('WeatherForecastBloc', () {
    blocTest(
      'Success Case. emits [WeatherForecastLoaded] when [WeatherForecastGetData] is called',
      build: () => _bloc,
      act: (_) {
        when(_service.getWeatherForecast(
          appId: _apiKey,
          lat: _monasLat,
          lon: _monasLon,
        )).thenAnswer((_) async {
          return Left<NetworkModel, NetworkError>(
            NetworkModel(
              response: _response,
              code: 200,
            ),
          );
        });

        _bloc.add(WeatherForecastGetData(
          appId: _apiKey,
          lat: _monasLat,
          lon: _monasLon,
        ));
      },
      expect: () => [
        WeatherForecastLoading(),
        WeatherForecastLoaded(weatherResponse: _weatherResponse),
      ],
    );

    blocTest(
      'Failed Case. emits [WeatherForecastError] when [WeatherForecastGetData] is called',
      build: () => _bloc,
      act: (_) {
        when(_service.getWeatherForecast(
          appId: _apiKey,
          lat: _monasLat,
          lon: _monasLon,
        )).thenAnswer((_) async {
          return Right<NetworkModel, NetworkError>(_error);
        });

        _bloc.add(WeatherForecastGetData(
          appId: _apiKey,
          lat: _monasLat,
          lon: _monasLon,
        ));
      },
      expect: () => [
        WeatherForecastLoading(),
        WeatherForecastError(error: _error),
      ],
    );
  });
}
