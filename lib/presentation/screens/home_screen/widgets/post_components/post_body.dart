import 'package:flutter/material.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_label.dart';

class PostBody extends StatelessWidget {
  final String postText,
      postHashtag,
      postImage,
      numberOfLikes,
      numberOfComments;
  const PostBody({
    Key? key,
    required this.postText,
    required this.postHashtag,
    required this.postImage,
    required this.numberOfLikes,
    required this.numberOfComments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          postText,
        ),
        Text(
          postHashtag,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
        Container(
          height: size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: NetworkImage(
                postImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostLabel(
              icon: IconBroken.Heart,
              color: Colors.red,
              title: numberOfLikes,
            ),
            PostLabel(
              icon: IconBroken.Chat,
              color: Colors.yellow,
              title: numberOfComments,
            ),
          ],
        ),
      ],
    );
  }
}
