import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/image_manager.dart';

class CoverContainer extends StatelessWidget {
  const CoverContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: size.height * 0.25,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: NetworkImage(
                ImageManager.coverImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Communicate with Friends',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: ColorManager.kBlackColor.withOpacity(
                    0.6,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
