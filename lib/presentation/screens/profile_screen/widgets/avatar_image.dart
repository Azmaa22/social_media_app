import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String image;
  const AvatarImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
