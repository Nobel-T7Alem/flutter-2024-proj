import 'package:Sebawi/agency_home.dart';
import 'package:Sebawi/login_page.dart';
import 'package:Sebawi/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_home.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/signup': (context) => const SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: UserHomePage(),
      theme: ThemeData(
        // fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
