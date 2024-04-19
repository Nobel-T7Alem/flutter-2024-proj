import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final buttonAction;

  const CustomButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 500.0,
        height: 50.0,
        child: ElevatedButton(
          child: Text(
            buttonText,
            style: TextStyle(
                color: buttonTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: buttonAction,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
        ),
      ),
    );
  }
}
