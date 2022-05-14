import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/presentation/components/label.dart';

class LabelContainer extends StatelessWidget {
  final String icon, value;
  const LabelContainer({Key? key, required this.icon, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 25.0,
          width: 25.0,
          color: ColorManager.kPrimaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Label(
          title: value,
          fontSize: 25.0,
        ),
      ],
    );
  }
}
