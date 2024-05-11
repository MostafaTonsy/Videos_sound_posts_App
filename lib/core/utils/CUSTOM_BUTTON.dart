import 'package:flutter/material.dart';

class CUSTOM_BUTTON extends StatelessWidget {
  final VoidCallback ON_PRESSED;
  final Color Background_color;
  final Color foreground_color;
  final String text;
  const CUSTOM_BUTTON(
      {super.key,
      required this.ON_PRESSED,
      required this.Background_color,
      required this.foreground_color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: ON_PRESSED,
      style: TextButton.styleFrom(
          foregroundColor: foreground_color,
          backgroundColor: Background_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Text(text),
    );
  }
}
