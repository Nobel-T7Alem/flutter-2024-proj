import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  const CustomButton({required this.buttonText});

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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            // Add your button's onPressed logic here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 83, 171, 71),
          ),
        ),
      ),
    );
  }
}
