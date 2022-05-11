import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
