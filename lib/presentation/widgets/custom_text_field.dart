import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;

  const CustomTextFormField({
    required this.labelText,
    this.obscureText = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 4.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 31, 78, 33),
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(213, 213, 213, 1),
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color.fromARGB(255, 165, 165, 165),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}