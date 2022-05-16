import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onPress;
  final double width, height;
  final Color buttonColor, borderColor, textColor;

  const Button({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = double.infinity,
    this.height = 50,
    this.buttonColor = ColorManager.kPrimaryColor,
    this.borderColor = ColorManager.kPrimaryColor,
    this.textColor = ColorManager.kOffWhiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
