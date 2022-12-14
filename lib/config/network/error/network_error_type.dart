// ignore_for_file: constant_identifier_names

import 'package:cloudy/config/network/constant/constant.dart';

enum NetworkErrorType {
  ServerError, // Maintenance, Error >= 500
  UnprocessableEntity,
  BadRequest,
  ValidationFailed,
  Unauthenticated,
  NoConnection,
  Timeout,
  Undefined,
  Emulator,
}

class NetworkErrorTypeParser {
  static NetworkErrorType httpToErrorType(int http) {
    if (http >= 500) return NetworkErrorType.ServerError;
    switch (http) {
      case NetworkConstant.NoConnectionErrorCode:
        return NetworkErrorType.NoConnection;
      case NetworkConstant.ConnectionTimeoutErrorCode:
        return NetworkErrorType.Timeout;
      case 401:
        return NetworkErrorType.Unauthenticated;
      case 400:
        return NetworkErrorType.BadRequest;
      case 422:
        return NetworkErrorType.UnprocessableEntity;
      default:
        return NetworkErrorType.Undefined;
    }
  }
}
