

import 'package:bmi_calculator/design.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({
    super.key,
    required this.icon,
    required this.text,
  });

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: kmainTextStyle,
        ),
      ],
    );
  }
}
