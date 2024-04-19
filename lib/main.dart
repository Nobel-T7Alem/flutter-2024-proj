import "package:google_fonts/google_fonts.dart";
import 'package:Sebawi/admin_page.dart';
import 'package:Sebawi/login_page.dart';
import 'package:Sebawi/login_user.dart';
import 'package:Sebawi/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:Sebawi/home_page.dart';
import 'package:Sebawi/user_home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sebawi',
    theme: ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.green[800],
          surface: Colors.lightGreen.withOpacity(0.5), 
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen.withOpacity(0.5), 
            foregroundColor: Colors.white, 
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.green[800]!, width: 3),
            ),
            shadowColor: Colors.greenAccent,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800], 
          foregroundColor: Colors.white, 
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors
                .green[800], 
          ),
        ),
    ),
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginPage(),
        '/admin': (context) => AdminPage(),
        '/user': (context) => LoginUser(),
      },
      initialRoute: '/', 
    );
  }
}
