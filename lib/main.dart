import 'package:flutter/material.dart';
import 'package:Sebawi/admin_page.dart'; 
import 'package:Sebawi/home_page.dart';
import 'package:Sebawi/signup_page.dart';
import 'package:Sebawi/login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sebawi',
      theme: ThemeData(
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
      },
      initialRoute: '/', 
    );
  }
}
