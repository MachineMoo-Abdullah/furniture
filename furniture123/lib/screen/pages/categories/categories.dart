import 'package:flutter/material.dart';
import 'package:myapp/screen/data/data.dart'; // Import the data.dart file
import 'package:myapp/screen/screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onCategoryTap(BuildContext context, String categoryLabel) {
    final bannerText = categoryLabel.split(' ').first;
    final tabs = categoryTabs[categoryLabel] ?? [];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(
          categoryName: categoryLabel,
          bannerText: bannerText,
          tabItems: tabs,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EllipticalSearchBar(pageName: "Categories"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.02,
              ),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: size.width * 0.03,
                  mainAxisSpacing: size.height * 0.02,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final bannerImagePath = bannerImagePaths[category.label]?.first ?? ''; // Get the first image path

                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        _onCategoryTap(context, category.label);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15.0),
                              ),
                              child: Image.asset(
                                bannerImagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(child: Text('Image not found'));
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category.label,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
