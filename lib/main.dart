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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define the routes
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginPage(),
        '/admin': (context) => AdminPage(), // Add the admin page route
      },
      initialRoute: '/', // Set the initial route
    );
  }
}
