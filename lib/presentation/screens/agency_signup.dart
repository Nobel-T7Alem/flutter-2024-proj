import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:Sebawi/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgencySignup extends StatefulWidget {
  const AgencySignup({super.key});

  @override
  _AgencySignupState createState() => _AgencySignupState();
}

class _AgencySignupState extends State<AgencySignup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                        'Share your volunteering opportunities.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                 CustomTextFormField(
                  labelText: 'Agency name',
                  obscureText: true, controller: _fullNameController,
                ),
                const SizedBox(height: 10.0),
                 CustomTextFormField(
                  labelText: 'Enter Email',
                  obscureText: true, controller: _emailController,
                ),
                const SizedBox(height: 10.0),
                 CustomTextFormField(
                  labelText: 'Create Username',
                  obscureText: true, controller: _usernameController,
                ),
                const SizedBox(height: 10.0),
                CustomTextFormField(
                  labelText: 'Create Password',
                  obscureText: true, controller: _passwordController,
                ),
                const SizedBox(height: 10.0),
                 CustomTextFormField(
                  labelText: 'Confirm Password',
                  obscureText: true, controller: _confirmPasswordController,
                ),
                const SizedBox(height: 40.0),
                CustomButton(
                    buttonText: 'Signup',
                    buttonColor: const Color.fromARGB(255, 83, 171, 71),
                    buttonTextColor: Colors.white,
                    buttonAction: () {
                      context.go('/agency_home');
                    }),
                Padding(
                  padding: const EdgeInsets.all(17),
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
                            context.go('/user_login');
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
