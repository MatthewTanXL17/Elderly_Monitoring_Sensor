import 'package:appcode/pages/components/heartrate.dart';
import 'package:appcode/pages/components/oxygen.dart';
import 'package:appcode/pages/components/temperature.dart';
import 'package:flutter/material.dart';
import 'package:appcode/pages/home.dart';
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
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      home: Home(),
      routes: {
        '/pulse': (context) => HeartRate(),
        '/oxygen': (context) => Oxygen(),
        '/temp': (context) => Temperature(),
      },
    ));
}
