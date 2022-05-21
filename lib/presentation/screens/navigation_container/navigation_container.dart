import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_states.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_cubit.dart';
import 'package:social_media_app/business_logic/cubits/profile_cubit/profile_states.dart';
import 'package:social_media_app/constants/colors_manager.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/constants/image_manager.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({Key? key}) : super(key: key);
  static const id = 'NavigationContainer';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
      builder: (context, state) {
        NavigationCubit myCubit = NavigationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProfileScreen.id,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<ProfileCubit, ProfileStates>(
                    listener: (context, state) {
                      if (state is ProfileSuccessState) {
                        print(ProfileCubit.get(context).user!.bio);
                      }
                    },
                    builder: (context, state) {
                      if (state is ProfileLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      if (state is ProfileLoadingState) {
                        return const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ColorManager.kSecondaryColor,
                        );
                      }
                      return CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                          ProfileCubit.get(context).user!.image ??
                              ImageManager.profilePlaceholder,
                        ),
                      );
                    },
                  ),
                )),
            title: Text(
              myCubit.titles[myCubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  IconBroken.Notification,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  IconBroken.Search,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: myCubit.screens[myCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: myCubit.currentIndex,
            items: myCubit.bottomNavigationBarItems,
            onTap: (int index) {
              myCubit.navigateToOtherScreen(index);
            },
          ),
        );
      },
    );
  }
}
