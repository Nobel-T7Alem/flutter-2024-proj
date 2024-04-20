import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:Sebawi/presentation/screens/user_home.dart';
import 'package:Sebawi/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VolunteerSignup extends StatefulWidget {
  @override
  _VolunteerSignupState createState() => _VolunteerSignupState();
}

class _VolunteerSignupState extends State<VolunteerSignup> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Image.asset(
                    'assets/images/sebawilogo.png',
                    width: 140.0,
                    height: 140.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0),
                      Text(
                        'Do something good today.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                CustomTextFormField(
                  labelText: 'Full name',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  labelText: 'Enter Email',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  labelText: 'Create Username',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  labelText: 'Create Password',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 40.0),
                CustomButton(
                    buttonText: 'Signup',
                    buttonColor: Color.fromARGB(255, 83, 171, 71),
                    buttonTextColor: Colors.white,
                    buttonAction: () {
                      Navigator.pushNamed(context, '/volunteer_page');
                    }),
                Padding(
                  padding: EdgeInsets.all(17),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Text('Already signed up?'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login_user');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 66, 148, 69),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
