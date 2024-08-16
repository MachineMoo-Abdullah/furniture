import 'package:flutter/material.dart';


class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      
      fontFamily: 'OpenSans',
    );
  }
  // ignore: non_constant_identifier_names
  static TextStyle TextFieldStyle2() {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      letterSpacing: 1,
      fontFamily: 'OpenSans',
    );
  }
}
class Category {
  final String imagePath;
  final String label;

  Category({required this.imagePath, required this.label});
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final List<String> bannerImages;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.bannerImages,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                     return const Center(child: Text('Image not found'));
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(label, style: AppWidget.TextFieldStyle2()),
          ),
        ],
      ),
    );
  }
}
