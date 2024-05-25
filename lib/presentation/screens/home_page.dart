
import 'package:Sebawi/presentation/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
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
