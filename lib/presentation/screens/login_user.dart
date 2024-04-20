import 'package:Sebawi/presentation/screens/admin_login.dart';
import 'package:Sebawi/presentation/widgets/custom_button.dart';
import 'package:Sebawi/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
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
                    'Login',
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
                        'Welcome back.',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Username',
                ),
                SizedBox(height: 10.0),
                const CustomTextFormField(
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 40.0),
                CustomButton(
                    buttonText: 'Login',
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
                          child: Text('No account?'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            'Signup',
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
