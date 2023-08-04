import 'package:flutter/material.dart';
import 'package:flutter_application_444/gridex.dart';
import 'package:flutter_application_444/login_screen.dart';
import 'package:flutter_application_444/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
