import 'package:flutter/material.dart';
import 'package:social_media_app/presentation/screens/registration_screen/registration_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RegistrationScreen.id,
          );
        },
        child: Text('Settings'));
  }
}
