import 'package:flutter/material.dart';

/// [Navi] is navigation helper,
/// Help user to move from one screen to another
///
class Navi {
  final GlobalKey<NavigatorState> navKey;
  Navi({required this.navKey});

  Future<dynamic>? navigateToNamed(String route, {Object? arguments}) {
    return navKey.currentState?.pushNamed(route, arguments: arguments);
  }

  Future<dynamic>? navigateToNamedAndRemoveUntil(
    String route,
    String predicateRoute, {
    Object? arguments,
  }) {
    return navKey.currentState?.pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(predicateRoute),
      arguments: arguments,
    );
  }

  Future<dynamic>? navigateToNamedAndRemoveElse(
    String route, {
    Object? arguments,
  }) {
    return navKey.currentState?.pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic>? navigateTo(
    Widget newPage,
    String routeName, {
    Object? arguments,
  }) {
    return navKey.currentState?.push(
      MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
        ),
        builder: (context) => newPage,
      ),
    );
  }

  Future<dynamic>? replaceNamed(String route, {Object? arguments}) {
    return navKey.currentState?.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  void pop({Object? result}) {
    navKey.currentState?.pop(result);
  }

  void popUntil(String predicatePath) {
    return navKey.currentState?.popUntil(ModalRoute.withName(predicatePath));
  }
}
