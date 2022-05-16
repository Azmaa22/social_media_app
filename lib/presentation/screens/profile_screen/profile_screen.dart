import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/components/label.dart';
import 'package:social_media_app/presentation/screens/profile_screen/widgets/avatar_image.dart';
import 'package:social_media_app/presentation/screens/profile_screen/widgets/info_container.dart';
import 'package:social_media_app/presentation/screens/profile_screen/widgets/label_container.dart';
import 'package:social_media_app/presentation/screens/profile_screen/widgets/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile,'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.25,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: width,
                    height: height * 0.2,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(
                          ImageManager.postImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: width * 0.12,
                  backgroundColor: ColorManager.kWhiteColor,
                  child: CircleAvatar(
                    radius: width * 0.11,
                    backgroundImage: const NetworkImage(
                      ImageManager.profileImage,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Label(
            title: 'Asmaa khaled',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
