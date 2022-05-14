import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/business_logic/cubits/navigation_cubit/navigation_states.dart';
import 'package:social_media_app/constants/icon_broken.dart';
import 'package:social_media_app/presentation/screens/chats_screen/chats_screen.dart';
import 'package:social_media_app/presentation/screens/home_screen/home_screen.dart';
import 'package:social_media_app/presentation/screens/settings_screen/settings_screen.dart';
import 'package:social_media_app/presentation/screens/users_screen/users_screen.dart';

class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigateToInitialScreenState());

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ChatsScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Chat,
      ),
      label: 'Chats',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Location,
      ),
      label: 'Users',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        IconBroken.Setting,
      ),
      label: 'Settings',
    ),
  ];
  List<String> titles = [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];
  static NavigationCubit get(context) => BlocProvider.of(context);

  void navigateToOtherScreen(int index) {
    currentIndex = index;

    emit(NavigateToOtherScreenState());
  }
}
