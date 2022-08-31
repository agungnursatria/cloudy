import 'package:cloudy/config/network/error/network_error.dart';
import 'package:cloudy/config/network/http/network_http_interface.dart';
import 'package:cloudy/config/network/http/network_http_model.dart';
import 'package:dartz/dartz.dart';

/// [HomeService] has responsibility to fetch the data from the API
///
class HomeService {
  NetworkHttpInterface network;
  HomeService({required this.network});

  /// This function to fetch weather forcast from API
  Future<Either<NetworkModel, NetworkError>> getWeatherForecast({
    required String lat,
    required String lon,
    required String appId,
  }) async {
    return await network.requestGetNoAuth(
      path: '/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appId': appId,
      },
    );
  }
}
