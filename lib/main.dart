import 'package:flutter/material.dart';
import 'package:Sebawi/admin_page.dart'; // Import admin page
import 'package:Sebawi/home_page.dart';
import 'package:Sebawi/signup_page.dart';
import 'package:Sebawi/login_page.dart'; // Assume you have this page

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
        // Base color scheme
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.green[800],
          surface: Colors.lightGreen.withOpacity(0.5), // Used for backgrounds
        ),
        // Elevated button theming
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen.withOpacity(0.5), // Button color
            foregroundColor: Colors.white, // Text color
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.green[800]!, width: 3),
            ),
            shadowColor: Colors.greenAccent,
          ),
        ),
        // AppBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800], // AppBar color
          foregroundColor: Colors.white, // AppBar text and icons color
        ),
        // TextButton theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors
                .green[800], // Corrected from 'primary' to 'foregroundColor'
          ),
        ),
      ),
      // Define the routes
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginPage(),
        '/admin': (context) => AdminPage(),
      },
      initialRoute: '/', // Set the initial route
    );
  }
}
