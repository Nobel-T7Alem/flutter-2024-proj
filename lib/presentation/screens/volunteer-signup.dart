import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:Sebawi/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  padding: const EdgeInsets.only(top: 35),
                  child: Image.asset(
                    'assets/images/sebawilogo.png',
                    width: 140.0,
                    height: 140.0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        'Do something good today.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                const CustomTextFormField(
                  labelText: 'Full name',
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Enter Email',
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Create Username',
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Create Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 40.0),
                CustomButton(
                    buttonText: 'Sign up',
                    buttonColor: const Color.fromARGB(255, 83, 171, 71),
                    buttonTextColor: Colors.white,
                    buttonAction: () {
                      context.go('/user_home');
                    }),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                           const Text('Already signed up?'),
                        TextButton(
                          onPressed: () {
                            context.go('/user_login');
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 66, 148, 69)),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          child: const Text('Log In'),
                        ),
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
