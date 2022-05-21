import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:social_media_app/presentation/screens/login_screen/login_screen.dart';
import 'package:social_media_app/presentation/screens/navigation_container/navigation_container.dart';
import 'package:social_media_app/presentation/screens/profile_screen/profile_screen.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

class RoutesManager {
  static Map<String, Widget Function(BuildContext)> routes = {
    RegistrationScreen.id: (context) => RegistrationScreen(),
    LoginScreen.id: (context) => LoginScreen(),
    ProfileScreen.id: (context) => const ProfileScreen(),
    NavigationContainer.id: (context) => const NavigationContainer(),
    EditProfileScreen.id: (context) => EditProfileScreen(),
  };
}
