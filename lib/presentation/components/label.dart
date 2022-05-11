import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  final Color fontColor;
  final FontWeight fontWeight;
  final double fontSize;
  const Label(
      {Key? key,
      required this.title,
      this.fontColor = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
