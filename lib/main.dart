// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sasing_prelims/constants.dart';
import 'package:sasing_prelims/screens/home_screen.dart';
import 'package:sasing_prelims/screens/intro_carousel.dart';
import 'package:sasing_prelims/screens/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: introCarousel(),
    );
  }
}
