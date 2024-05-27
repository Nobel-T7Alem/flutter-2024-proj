import 'package:Sebawi/presentation/screens/admin_login.dart';
import 'package:Sebawi/presentation/screens/admin_page.dart';
import 'package:Sebawi/presentation/screens/agency_home.dart';
import 'package:Sebawi/presentation/screens/agency_signup.dart';
import 'package:Sebawi/presentation/screens/agency_update.dart';
import 'package:Sebawi/presentation/screens/login_page.dart';
import 'package:Sebawi/presentation/screens/login_user.dart';
import 'package:Sebawi/presentation/screens/signup_page.dart';
import 'package:Sebawi/presentation/screens/user_update.dart';
import 'package:Sebawi/presentation/screens/volunteer-signup.dart';
import 'package:flutter/material.dart';
import 'package:Sebawi/presentation/screens/home_page.dart';
import 'package:Sebawi/presentation/screens/user_home.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/signup',
      name: "signup",
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/login',
      name: "login",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/admin',
      name: "admin",
      builder: (context, state) => const AdminPage(),
    ),
    GoRoute(
      path: '/user_login',
      name: "user_login",
      builder: (context, state) => const LoginUser(),
    ),
    GoRoute(
      path: '/admin_login',
      name: "admin_login",
      builder: (context, state) => const AdminLoginPage(),
    ),
    GoRoute(
      path: '/user_home',
      name: "user_home",
      builder: (context, state) => const UserHomePage(),
    ),
    GoRoute(
      path: '/volunteer_signup',
      name: "volunteer_signup",
      builder: (context, state) => VolunteerSignup(),
    ),
    GoRoute(
      path: '/agency_signup',
      name: "agency_signup",
      builder: (context, state) => const AgencySignup(),
    ),
    GoRoute(
        path: '/agency_home',
        name: "agency_home",
        builder: (context, state) => const AgencyHomePage()),
    GoRoute(
      path: '/user_update',
      name: "user_update",
      builder: (context, state) => const UserUpdate(),
    ),
    GoRoute(
      path: '/agency_update',
      name: "agency_update",
      builder: (context, state) => const AgencyUpdate(),
    ),
    GoRoute(
      path: '/admin_page',
      name: "admin_page",
      builder: (context, state) => const AdminPage(),
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Error: ${state.error}',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text(
                'Return to Home Page',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sebawi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.green[800],
          surface: Colors.lightGreen.withOpacity(0.5),
        ),
        scaffoldBackgroundColor: Colors.white,
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
            foregroundColor: Colors.green[800],
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
