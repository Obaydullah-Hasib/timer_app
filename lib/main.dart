import 'package:flutter/material.dart';
import 'package:timer_app_rashad_vai/pages/MyHomePage.dart';
import 'package:timer_app_rashad_vai/pages/QuickTimer.dart';
import 'package:timer_app_rashad_vai/pages/createNewTimer.dart';
import 'package:timer_app_rashad_vai/pages/optionPage.dart';
import 'package:timer_app_rashad_vai/widget/buildCupertinoTimerPicker.dart';
import 'package:timer_app_rashad_vai/widget/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.dark
      ),
      home:  MyHomePage(),
    );
  }
}
