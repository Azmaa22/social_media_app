import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/constants/colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.onBackPress, required this.onEditPress})
      : super(key: key);
  final Function onBackPress, onEditPress;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.15,
      color: profileColor,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              onBackPress();
            },
            child: SvgPicture.asset(
              'assets/svgs/ios-arrow-left-svgrepo-com.svg',
              height: 25.0,
              width: 25.0,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              onEditPress();
            },
            child: SvgPicture.asset(
              'assets/svgs/edit-svgrepo-com.svg',
              height: 25.0,
              width: 25.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
