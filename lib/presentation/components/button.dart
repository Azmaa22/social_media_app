import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onPress;
  final double width, height;
  const Button({
    Key? key,
    required this.title,
    required this.onPress,
    this.width = double.infinity,
    this.height = 60,
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
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }
}
