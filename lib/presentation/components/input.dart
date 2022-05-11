import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final String placeholder;
  final String label;
  final TextInputType textInputType;
  final bool isPassword;
  final String passwordCharacter;
  const Input({
    Key? key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    required this.label,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.passwordCharacter = '*',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: SvgPicture.asset(
          icon,
          height: 25.0,
          width: 25.0,
          color: Colors.grey,
        ),
        hintText: placeholder,
        labelText: label,
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
      obscuringCharacter: passwordCharacter,
    );
  }
}
