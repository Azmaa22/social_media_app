import 'dart:convert';

import 'package:flutter/material.dart';

class UserContainer extends StatelessWidget {
  final String userImage, userName, lastMessage;
  const UserContainer({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.lastMessage,
  }) : super(key: key);

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
            ),
            Text(
              '$lastMessage ',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
