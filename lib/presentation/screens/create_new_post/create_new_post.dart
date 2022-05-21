import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_states.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/data/models/post_model.dart';
import 'package:social_media_app/data/models/user_model.dart';
import 'package:social_media_app/presentation/components/button.dart';
import 'package:social_media_app/presentation/screens/create_new_post/widgets/user_info.dart';
import 'package:social_media_app/presentation/screens/navigation_container/navigation_container.dart';
import 'package:intl/intl.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  static const String id = 'CreatePost';
  final TextEditingController _postContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserModel user = ProfileCubit.get(context).user!;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Center(
              child: Button(
                title: 'Post',
                onPress: () {
                  PostCubit.get(context).createNewPost(
                    post: PostModel(
                      userId: user.userId,
                      userName: user.username,
                      userImage: user.image,
                      date: DateFormat.yMMMd().format(DateTime.now()),
                      time: DateFormat.jm().format(DateTime.now()),
                      postContent: _postContent.text,
                      postImage: PostCubit.get(context).postPhoto,
                    ),
                  );
                },
                width: 70,
                height: 40,
                buttonColor: ColorManager.kOffWhiteColor,
                textColor: ColorManager.kPrimaryColor,
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              NavigationContainer.id,
            );
          },
          child: const Icon(
            IconBroken.Arrow___Left_2,
            color: ColorManager.kOffWhiteColor,
          ),
        ),
      ),
      body: BlocConsumer<PostCubit, PostStates>(
        listener: (context, state) {
          if (state is CreatePostSuccessState) {
            Navigator.pushNamed(context, NavigationContainer.id);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              if (state is CreatePostLoadingState)
                const LinearProgressIndicator(
                  color: ColorManager.kPrimaryColor,
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: UserInfo(
                  userImage: user.image!,
                  userName: user.username,
                ),
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: ColorManager.kBlackColor,
                      ),
                  controller: _postContent,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    hintText: 'What\'s on your mind ?',
                    hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: ColorManager.kBlackColor,
                        ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (state is PickedPostImageSuccessState)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: MemoryImage(
                            base64Decode(
                              PostCubit.get(context).postPhoto!,
                            ),
                          ),
                        )),
                      ),
                      InkWell(
                        onTap: () {
                          PostCubit.get(context).removePickedImage();
                        },
                        child: const Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.kOffWhiteColor,
                            radius: 20.0,
                            child: Icon(
                              IconBroken.Close_Square,
                              color: ColorManager.kBlackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else if (PostCubit.get(context).postPhoto == null)
                const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      PostCubit.get(context).uploadPostImage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            IconBroken.Image,
                            color: ColorManager.kPrimaryColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(
                              color: ColorManager.kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '# Tags',
                          style: TextStyle(
                            color: ColorManager.kPrimaryColor,
                          ),
                        )),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
