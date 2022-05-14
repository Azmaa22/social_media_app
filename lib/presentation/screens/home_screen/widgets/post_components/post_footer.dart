import 'package:flutter/material.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_label.dart';

class PostFooter extends StatelessWidget {
  final String userImage;
  final Function writeComment, likePost, sharePost;
  const PostFooter({
    Key? key,
    required this.userImage,
    required this.writeComment,
    required this.likePost,
    required this.sharePost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(
                    userImage,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                const Text(
                  'write a comment ...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            onTap: () {
              writeComment();
            },
          ),
        ),
        InkWell(
          onTap: () {
            likePost();
          },
          child: const PostLabel(
            icon: IconBroken.Heart,
            color: Colors.red,
            title: 'like',
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        InkWell(
          onTap: () {
            sharePost();
          },
          child: const PostLabel(
            icon: IconBroken.Send,
            color: Colors.green,
            title: 'share',
          ),
        ),
      ],
    );
  }
}
