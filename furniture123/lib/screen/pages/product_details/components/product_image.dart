import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imagePath;

  const ProductImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Image.asset(
      imagePath,
      height: size.height * 0.45, // 45% of screen height
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
