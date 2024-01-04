import 'package:calculator_responsive/config/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonColor,
    required this.title,
    required this.onPressed,
  });
  final Color buttonColor;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () => onPressed(),
        minWidth: 75.0,
        height: 80.0,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.height20(context) * 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
