import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;


  CalculatorButton({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
 });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
