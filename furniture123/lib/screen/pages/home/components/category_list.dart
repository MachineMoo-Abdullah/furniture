import 'package:flutter/material.dart';
import '../../../data/banner_manager.dart';
import '../widgets/widgets.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final BannerImagesManager bannerImagesManager;
  final Function(String, List<String>) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.bannerImagesManager,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bannerImages = bannerImagesManager.getBannerImages(
            category.label, // Use label to get banner images
            [], // Pass an empty list as items are no longer needed
          );

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CategoryItem(
              imagePath: category.imagePath,
              label: category.label,
              bannerImages: bannerImages,
              onTap: () => onCategorySelected(category.label, bannerImages),
            ),
          );
        },
      ),
    );
  }
}
