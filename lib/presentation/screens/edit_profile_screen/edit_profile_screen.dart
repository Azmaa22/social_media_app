import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/data/models/user_model.dart';
import 'package:social_media_app/presentation/components/components.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';

class EditProfileScreen extends StatelessWidget {
  static const String id = 'EditProfileScreen';
  EditProfileScreen({Key? key}) : super(key: key);
  final String userName = 'userName', bio = 'bio';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  print(
                    _formKey.currentState!.instantValue,
                  );
                  ProfileCubit.get(context).editUserProfile(
                    UserModel(
                      userId: ProfileCubit.get(context).user!.userId,
                      bio: _formKey.currentState!.instantValue[bio],
                      username: _formKey.currentState!.instantValue[userName],
                      email: ProfileCubit.get(context).user!.email,
                      password: ProfileCubit.get(context).user!.password,
                      image: ProfileCubit.get(context).profilePhoto ??
                          ProfileCubit.get(context).user!.image!,
                      cover: ProfileCubit.get(context).coverPhoto ??
                          ProfileCubit.get(context).user!.cover!,
                    ),
                  );
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    color: ColorManager.kWhiteColor,
                    fontFamily: 'jana',
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(
              context,
              ProfileScreen.id,
            );
          },
          child: const Icon(
            IconBroken.Arrow___Left_2,
            color: ColorManager.kOffWhiteColor,
          ),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit myCubit = ProfileCubit.get(context);

          if (state is EditProfileErrorState) {
            return const Center(
              child: Text('Something Error'),
            );
          } else {
            return Column(
              children: [
                if (state is EditProfileLoadingState)
                  const LinearProgressIndicator(
                    color: ColorManager.kPrimaryColor,
                  ),
                SizedBox(
                  height: height * 0.25,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              width: width,
                              height: height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: MemoryImage(
                                    myCubit.coverPhoto == null
                                        ? base64Decode(myCubit.user!.cover!)
                                        : base64Decode(
                                            myCubit.coverPhoto!,
                                          ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              8.0,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: InkWell(
                                onTap: () {
                                  myCubit.chooseCoverImage();
                                },
                                child: const CircleAvatar(
                                  backgroundColor: ColorManager.kPrimaryColor,
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    color: ColorManager.kOffWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          CircleAvatar(
                            radius: width * 0.12,
                            backgroundColor: ColorManager.kWhiteColor,
                            child: CircleAvatar(
                              radius: width * 0.11,
                              backgroundImage: MemoryImage(
                                myCubit.profilePhoto == null
                                    ? base64Decode(myCubit.user!.image!)
                                    : base64Decode(
                                        myCubit.profilePhoto!,
                                      ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                myCubit.chooseProfileImage();
                              },
                              child: const CircleAvatar(
                                radius: 20.0,
                                backgroundColor: ColorManager.kPrimaryColor,
                                child: Icon(
                                  IconBroken.Camera,
                                  color: ColorManager.kOffWhiteColor,
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
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilder(
                    key: _formKey,
                    initialValue: {
                      userName: myCubit.user!.username,
                      bio: myCubit.user!.bio,
                    },
                    child: Column(
                      children: [
                        Input(
                          initialValue: myCubit.user!.username,
                          name: userName,
                          placeholder: '',
                          icon: ImageManager.userIcon,
                          iconColor: ColorManager.kPrimaryColor,
                          label: 'userName',
                          onChange: (value) {},
                          onValidate: (value) {},
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Input(
                          initialValue:
                              myCubit.user!.bio ?? 'Write Your Bio...',
                          name: bio,
                          placeholder: '',
                          icon: ImageManager.infoIcon,
                          iconColor: ColorManager.kPrimaryColor,
                          label: 'bio',
                          onChange: (value) {},
                          onValidate: (value) {},
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Input(
                          initialValue: myCubit.user!.email,
                          name: 'email',
                          placeholder: '',
                          icon: ImageManager.emailIcon,
                          iconColor: ColorManager.kPrimaryColor,
                          label: 'email',
                          onChange: (value) {},
                          onValidate: (value) {},
                          isReadOnly: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
