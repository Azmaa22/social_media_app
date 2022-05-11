import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    );
  }
}
