import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({super.key, required this.color, required this.text, required this.action});

  Color color;
  String text;
  Function()? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        child: MaterialButton(
          onPressed: action,
          minWidth: 200.0,
          height: 50.0,
          child: Text(text),
        ),
      ),
    );
  }
}