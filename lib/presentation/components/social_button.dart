import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final Function onPress;
  final double width, height;
  const SocialButton({
    Key? key,
    required this.icon,
    required this.onPress,
    this.width = 100,
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
