import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/cover_container.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CoverContainer(),
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
          ],
        ),
      ),
    );
  }
}
