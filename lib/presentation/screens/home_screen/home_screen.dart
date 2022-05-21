import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app/business_logic/cubits/post_cubit/post_states.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/screens/create_new_post/create_new_post.dart';
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
                    children: [
                      BlocBuilder<ProfileCubit, ProfileStates>(
                        builder: (context, state) {
                          if (state is ProfileLoadingState) {
                            return const CircularProgressIndicator();
                          }
                          if (state is ProfileErrorState) {
                            return const CircleAvatar(
                              radius: 20.0,
                              backgroundColor: ColorManager.kSecondaryColor,
                            );
                          }
                          return CircleAvatar(
                            radius: 20.0,
                            backgroundImage: MemoryImage(
                              base64Decode(
                                ProfileCubit.get(context).user!.image!,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CreatePost.id);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  15.0,
                                ),
                              ),
                              border: Border.all(
                                color: ColorManager.kLightPrimaryColor,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 8.0,
                              ),
                              child: Text(
                                'create an new post ...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'jana',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            BlocBuilder<PostCubit, PostStates>(
              builder: (context, state) {
                if (state is GetAllPostsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.kPrimaryColor,
                    ),
                  );
                }
                if (state is GetAllPostsErrorState) {
                  return const Center(
                    child: Text(
                      'something error',
                    ),
                  );
                }
                return PostCubit.get(context).posts.isEmpty
                    ? const Center(
                        child: Text(
                          'No posts Found -_- ',
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PostContainer(
                          post: PostCubit.get(context).posts[index],
                          numberOfLikes:
                              PostCubit.get(context).postLikes[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8.0,
                        ),
                        itemCount: PostCubit.get(context).posts.length,
                      );
              },
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
