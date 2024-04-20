import 'package:Sebawi/presentation/screens/agency_home.dart';
import 'package:Sebawi/presentation/screens/agency_signup.dart';
import 'package:Sebawi/presentation/screens/login_page.dart';
import 'package:Sebawi/presentation/screens/login_user.dart';
import 'package:Sebawi/presentation/screens/signup_page.dart';
import 'package:Sebawi/presentation/screens/volunteer-signup.dart';
import 'package:flutter/material.dart';
import 'user_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/volunteer': (context) => VolunteerSignup(),
        '/agency': (context) => AgencySignup(),
        '/agency_page': (context) => AgencyHomePage(),
        '/volunteer_page': (context) => UserHomePage(),
        '/login_user': (context) => LoginUser()
      },
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
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
