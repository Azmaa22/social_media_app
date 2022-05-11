import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors.dart';
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
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(
            onBackPress: () {
              print('back to home');
            },
            onEditPress: () {
              print('edit  profile');
            },
          ),
        ),
        Positioned(
          top: height * 0.12,
          child: const InfoContainer(),
        ),
        Positioned(
          top: height * 0.02,
          left: width * 0.35,
          child: Column(
            children: const [
              AvatarImage(
                image:
                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80',
              ),
              Label(
                title: 'Asmaa khaled',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontColor: profileColor,
              ),
            ],
          ),
        ),
        Positioned(
            top: height * 0.3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: const [
                  LabelContainer(
                    icon: 'assets/svgs/email-svgrepo-com-2.svg',
                    value: 'asmaakhaled603@gmail.com',
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
