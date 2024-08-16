import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class Upside extends StatelessWidget {
  const Upside({super.key, required this.imgUrl, this.img2});
  final String imgUrl;
  final String? img2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 3,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Image.asset(
              imgUrl,
              alignment: Alignment.center,
              scale: 2.5,
            ),
          ),
        ),
        if (img2 != null)
          Positioned(
            left: 10,
            top: 55,
            child: Image.asset(
              img2!,
              scale: 6,
            ),
          ),
      ],
    );
  }
}
