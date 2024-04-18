import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          ElevatedButton(
            child: const Text('Signup'),
            onPressed: () {
              String username = _usernameController.text;
              String password = _passwordController.text;
            },
          ),
        ],
      ),
    );
  }
}
