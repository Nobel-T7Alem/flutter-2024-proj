import 'package:Sebawi/login_page.dart';
import 'package:Sebawi/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          bodyText2: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
