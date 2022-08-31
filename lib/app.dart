// ignore_for_file: equal_keys_in_map, prefer_const_constructors

import 'package:cloudy/di/injector.dart';
import 'package:cloudy/screens/detail/page.dart';
import 'package:cloudy/screens/home/page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudy',
      navigatorKey: Injector().find<GlobalKey<NavigatorState>>(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.PATH,
      routes: <String, WidgetBuilder>{
        HomePage.PATH: (_) => HomePage(),
        DetailPage.PATH: (_) => DetailPage(),
      },
      home: const HomePage(),
    );
  }
}
