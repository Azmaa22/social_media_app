import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/components/button.dart';
import 'package:social_media_app/presentation/components/label.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          print('current state $state');
        },
        builder: (context, state) {
          ProfileCubit myCubit = ProfileCubit.get(context);
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.kPrimaryColor,
              ),
            );
          }
          if (state is ProfileErrorState) {
            return const Center(
              child: Text('Something Error'),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: height * 0.25,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: width,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                              myCubit.user!.cover ??
                                  ImageManager.coverPlaceholder,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: width * 0.12,
                      backgroundColor: ColorManager.kWhiteColor,
                      child: CircleAvatar(
                        radius: width * 0.11,
                        backgroundImage: NetworkImage(
                          myCubit.user!.image ??
                              ImageManager.profilePlaceholder,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Label(
                title: myCubit.user!.username,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              Label(
                title: myCubit.user!.bio ?? 'Write Your Bio...',
                fontSize: 15.0,
                fontWeight: FontWeight.w100,
                fontColor: ColorManager.kLightPrimaryColor,
              ),
              SizedBox(
                width: width,
                height: height * 0.15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Button(
                        title: 'Add Post',
                        onPress: () {},
                        textColor: ColorManager.kPrimaryColor,
                        buttonColor: ColorManager.kOffWhiteColor,
                        borderColor: ColorManager.kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: ColorManager.kOffWhiteColor,
                            border: Border.all(
                              color: ColorManager.kPrimaryColor,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
                              color: ColorManager.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
