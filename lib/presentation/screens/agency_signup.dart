import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AgencySignup extends StatefulWidget {
  @override
  _AgencySignupState createState() => _AgencySignupState();
}

class _AgencySignupState extends State<AgencySignup> {
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
                        'Share your volunteering opportunities.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      labelText: 'Agency Name',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 165, 165, 165),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 165, 165, 165),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      labelText: 'Create Username',
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
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      labelText: 'Create Password',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 165, 165, 165),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
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
                      labelText: 'Confirm Password',
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
                    buttonText: 'Signup',
                    buttonColor: Color.fromARGB(255, 83, 171, 71),
                    buttonTextColor: Colors.white,
                    buttonAction: () {
                      Navigator.pushNamed(context, '/agency_page');
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
