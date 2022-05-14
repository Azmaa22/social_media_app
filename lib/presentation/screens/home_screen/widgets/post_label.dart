import 'package:flutter/material.dart';

class PostLabel extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  const PostLabel({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
