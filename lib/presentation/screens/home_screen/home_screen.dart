import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/components/components.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/cover_container.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_container.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_label.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: ColorManager.kWhiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          ImageManager.profileImage,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  40.0,
                                ),
                              ),
                            ),
                            hintText: 'create an new post...',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          debugPrint('cancel');
                        },
                        child: const PostLabel(
                          color: Colors.red,
                          icon: IconBroken.Delete,
                          title: 'Discard',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          debugPrint('create');
                        },
                        child: const PostLabel(
                          color: ColorManager.kPrimaryColor,
                          icon: IconBroken.Send,
                          title: 'Add',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const PostContainer(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8.0,
              ),
              itemCount: 10,
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}