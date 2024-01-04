import 'package:calculator_responsive/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({
    super.key,
    required this.button1Clicked,
    required this.button2Clicked,
    required this.button3Clicked,
    required this.button4Clicked,
    required this.button1Value,
    required this.button2Value,
    required this.button3Value,
    required this.button4Value,
    required this.button1Color,
    required this.button2Color,
    required this.button3Color,
    required this.button4Color,
  });
  final Function button1Clicked;
  final Function button2Clicked;
  final Function button3Clicked;
  final Function button4Clicked;
  final String button1Value;
  final String button2Value;
  final String button3Value;
  final String button4Value;
  final Color button1Color;
  final Color button2Color;
  final Color button3Color;
  final Color button4Color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          buttonColor: button1Color,
          title: button1Value,
          onPressed: () => button1Clicked(),
        ),
        CustomButton(
          buttonColor: button2Color,
          title: button2Value,
          onPressed: () => button2Clicked(),
        ),
        CustomButton(
          buttonColor: button3Color,
          title: button3Value,
          onPressed: () => button3Clicked(),
        ),
        CustomButton(
          buttonColor: button4Color,
          title: button4Value,
          onPressed: () => button4Clicked(),
        ),
      ],
    );
  }
}
