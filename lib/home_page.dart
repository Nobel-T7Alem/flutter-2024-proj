import 'package:Sebawi/login_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          bodyText2: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
