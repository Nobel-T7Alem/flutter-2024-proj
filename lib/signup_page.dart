import 'package:Sebawi/agency_signup.dart';
import 'package:Sebawi/custom_button.dart';
import 'package:Sebawi/agency_home.dart';
import 'package:Sebawi/volunteer-signup.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/volunteer': (context) => VolunteerSignup(),
        '/agency': (context) => AgencyHomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Image.asset(
                        'assets/images/sebawilogo.png',
                        width: 120.0,
                        height: 120.0,
                      ),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Are you a volunteer or an agency?',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                CustomButton(
                  buttonText: 'Volunteer',
                  buttonColor: Color.fromARGB(255, 83, 171, 71),
                  buttonTextColor: Colors.white,
                  buttonAction: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => VolunteerSignup()),
                    );
                  },
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[400],
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomButton(
                  buttonText: 'Agency',
                  buttonColor: Colors.white,
                  buttonTextColor: Color.fromARGB(255, 83, 171, 71),
                  buttonAction: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AgencySignup()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
