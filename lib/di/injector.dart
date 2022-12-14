import 'package:cloudy/screens/home/service/service.dart';
import 'package:cloudy/config/navi/navi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:cloudy/config/network/http/network_http_interface.dart';
import 'package:cloudy/config/network/http/network_http_library.dart';

/// [Injector] is a Service Locator for Dart and Flutter.
/// It can be used instead of InheritedWidget or Provider to access objects.
class Injector {
  Injector._();
  static final Injector _instance = Injector._();
  factory Injector() => _instance;

  /* ----------- PARAMETER ----------- */
  final _container = GetIt.instance;

  /* ----------- FUNCTION ----------- */

  void init() {
    /// Register Network
    _container
      ..registerLazySingleton(
        () => NetworkLibrary(),
      )
      ..registerLazySingleton(
        () => NetworkHttpInterface(library: _container()),
      );

    /// Register Navigator
    _container
      ..registerLazySingleton(() => GlobalKey<NavigatorState>())
      ..registerLazySingleton(() => Navi(navKey: _container()));

    /// Register Service
    _container.registerLazySingleton(() => HomeService(network: _container()));
  }

  T find<T extends Object>() => _container.get<T>();
}
