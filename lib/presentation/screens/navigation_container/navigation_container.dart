import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_states.dart';
import 'package:social_media_app/constants/icon_broken.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
      builder: (context, state) {
        NavigationCubit myCubit = NavigationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
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
