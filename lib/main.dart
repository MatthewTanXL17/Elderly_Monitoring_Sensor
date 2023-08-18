import 'package:appcode/pages/history/fall_history.dart';
import 'package:appcode/pages/history/heartrate_history.dart';
import 'package:appcode/pages/history/oxygen_history.dart';
import 'package:appcode/pages/history/temperature_history.dart';
import 'package:appcode/pages/realtime/heartrate_realtime.dart';
import 'package:appcode/pages/realtime/oxygen_realtime.dart';
import 'package:appcode/pages/realtime/temperature_realtime.dart';
import 'package:flutter/material.dart';
import 'package:appcode/pages/Screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Elderly Monitoring System",
      theme: ThemeData(
        fontFamily: 'Poppins', //set font for whole application
        brightness: Brightness.dark, //set dark theme for application
      ),
      home: Home(),
      routes: { //routes for app to navigate to
        '/pulseRealtime': (context) => HeartRateRealtime(),
        '/oxygenRealtime': (context) => OxygenRealTime(),
        '/tempRealtime': (context) => TemperatureRealTime(),
        '/pulseHistory': (context) => HeartRateHistory(),
        '/oxygenHistory': (context) => OxygenHistory(),
        '/tempHistory': (context) => TemperatureHistory(),
        '/fallHistory': (context) => FallHistory()
      },
    ));
}
