import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final double height, width;
  const ImageContainer({
    Key? key,
    required this.image,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: height == 0 ? size.height * 0.35 : height,
      width: width == 0 ? size.width : width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
