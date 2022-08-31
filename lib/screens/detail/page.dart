import 'package:cloudy/screens/detail/initiator.dart';
import 'package:cloudy/screens/detail/view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static const String PATH = '/detail';
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailInitiator _i;

  @override
  void initState() {
    super.initState();
    _i = DetailInitiator();
  }

  @override
  void didChangeDependencies() {
    _i.getArgument(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DetailView(
      forecast: _i.forecast,
      onBack: _i.onBack,
    );
  }
}
