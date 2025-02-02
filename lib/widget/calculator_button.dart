import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  IconData? icon;


  CalculatorButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
  });

  CalculatorButton.icon({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.icon
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: icon == null
        ? Text(
          text,
          style: Theme.of(context).
          textTheme.displaySmall!.
          copyWith(color: foregroundColor),
        )
        : Icon(
          icon,
          color: foregroundColor,
        ),
      )
    );
  }
}
