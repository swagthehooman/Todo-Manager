import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  VoidCallback onPressed;
  final String text;
  Mybuttons({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff4E6C50),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
