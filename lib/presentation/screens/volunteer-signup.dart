import 'dart:convert';

import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:Sebawi/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
final _formKey = GlobalKey<FormState>();

class VolunteerSignup extends StatefulWidget {
  @override
  _VolunteerSignupState createState() => _VolunteerSignupState();
}

class _VolunteerSignupState extends State<VolunteerSignup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> signUp(String fullName, String email, String username, String password, String confirmPassword) async {
    final response = await http.post(
      Uri.parse('http://192.168.1.7:3000/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': fullName,
        "username": username,
        'email': email,
        'password': password,
        'role': "user"
      }),
    );
    if (response.statusCode == 201) {
      print("success");
      context.go('/user_home');
      return jsonDecode(response.body);

    } else {
      print("status code:");
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to sign up');
    }
  }

  void submitData() {
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    signUp(fullName, email, username, password, confirmPassword);
    print('Full name: $fullName');
    print('Email: $email');
    print('Username: $username');
    print('Password: $password');
    print('Confirm Password: $confirmPassword');
  }
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isValidEmail = emailRegex.hasMatch(email ?? '');
    if (!isValidEmail) {
      return 'Invalid email';
    }
    return null;
  }
  String? confirmEmail(String? confirmPassword) {
    if (confirmPassword != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                  child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  CustomTextFormField(
                    labelText: 'Full name',
                    obscureText: false,
                    controller: _fullNameController,
                    validator: (name) => name!.isEmpty ? 'Name field cannot be empty!' : null,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    labelText: 'Enter Email',
                    obscureText: false,
                    controller: _emailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    labelText: 'Create Username',
                    obscureText: false,
                    controller: _usernameController,
                    validator: (username) => username!.isEmpty ? 'Username field cannot be empty!' : null,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    labelText: 'Create Password',
                    obscureText: true,
                    controller: _passwordController,
                    validator: (password) => password!.isEmpty ? 'Password field cannot be empty!' : null,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormField(
                    labelText: 'Confirm Password',
                    obscureText: true,
                    controller: _confirmPasswordController,
                    validator: confirmEmail,
                  ),
                  const SizedBox(height: 40.0),
                  CustomButton(
                      buttonText: 'Sign up',
                      buttonColor: const Color.fromARGB(255, 83, 171, 71),
                      buttonTextColor: Colors.white,
                      buttonAction: () {
                        _formKey.currentState!.validate();
                        submitData();
                      }),
                ],
              )),
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
    );
  }
}
