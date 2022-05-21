import 'dart:convert';

import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.userImage,
    required this.userName,
  }) : super(key: key);
  final String userImage, userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: MemoryImage(
            base64Decode(
              userImage,
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(
          userName,
        ),
      ],
    );
  }
}
