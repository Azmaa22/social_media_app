import 'package:flutter/material.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/data/models/post_model.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_components/post_components.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({
    Key? key,
    required this.post,
    required this.numberOfLikes,
  }) : super(key: key);
  final PostModel post;
  final int numberOfLikes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor.withOpacity(
          0.8,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(
              userImage: post.userImage!,
              userName: post.userName!,
              dateOfPublishing: post.date!,
              timeOfPublishing: post.time!,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            PostBody(
              postText: post.postContent!,
              postHashtag: '',
              postImage: post.postImage == null ? '' : post.postImage!,
              numberOfLikes: numberOfLikes.toString(),
              numberOfComments: '0 comments',
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            PostFooter(
              userImage: post.userImage!,
              writeComment: () {
                debugPrint('writeComment');
              },
              likePost: () {
                PostCubit.get(context).likePost(
                  postId: post.postId!,
                  userId: post.userId!,
                );
              },
              sharePost: () {
                debugPrint('sharePost');
              },
            ),
          ],
        ),
      ),
    );
  }
}
