import 'package:flutter/material.dart';
import 'package:flutter_app/location/api/weather/loading.dart';

import '../location_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationData(),
    );
  }
}
