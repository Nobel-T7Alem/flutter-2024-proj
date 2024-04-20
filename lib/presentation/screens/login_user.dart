import 'package:Sebawi/presentation/screens/admin_login.dart';
import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Log In',
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
                          'Welcome back ,',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4.0),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 31, 78, 33),
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(213, 213, 213, 1))),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 165, 165, 165),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4.0),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 31, 78, 33),
                            style: BorderStyle.solid,
                            width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(213, 213, 213, 1))),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 165, 165, 165),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 40.0),
              CustomButton(
                buttonText: 'Log In',
                buttonColor: Color.fromARGB(255, 83, 171, 71),
                buttonTextColor: Colors.white,
                buttonAction: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminLoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
