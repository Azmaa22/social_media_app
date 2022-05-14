import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/screens/home_screen/widgets/post_components/post_components.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key}) : super(key: key);

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
            const PostHeader(
                networkPicture: ImageManager.profileImage,
                userName: 'Asmaa Khaled',
                dateOfPublishing: 'jan 21, 2022',
                timeOfPublishing: '11:00 pm'),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const PostBody(
              postText:
                  ' Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
              postHashtag: '#softwear_development',
              postImage: ImageManager.postImage,
              numberOfLikes: '1200',
              numberOfComments: '512 comments',
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            PostFooter(
              userImage: ImageManager.profileImage,
              writeComment: () {
                debugPrint('writeComment');
              },
              likePost: () {
                debugPrint('likePost');
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
