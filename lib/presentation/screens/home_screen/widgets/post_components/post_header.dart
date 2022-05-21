import 'dart:convert';

import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String userImage, userName, dateOfPublishing, timeOfPublishing;
  const PostHeader({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.dateOfPublishing,
    required this.timeOfPublishing,
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
            Row(
              children: [
                Text(
                  userName,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
              ],
            ),
            Text(
              '$dateOfPublishing at $timeOfPublishing',
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
