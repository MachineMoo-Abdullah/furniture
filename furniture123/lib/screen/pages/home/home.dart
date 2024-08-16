import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';
import 'package:myapp/screen/data/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void navigateToCategoryPage(String category, List<String> bannerImages) {
      final bannerText = category.split(' ').first;

      final tabs = categoryTabs[category] ?? [];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            categoryName: category,
            tabItems: tabs,
            bannerText: bannerText,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EllipticalSearchBar(pageName: "Home"),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: const Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.18,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryItem(
                          imagePath: category.imagePath,
                          label: category.label,
                          bannerImages: bannerImagePaths[category.label] ?? [],
                          onTap: () => navigateToCategoryPage(
                            category.label,
                            bannerImagePaths[category.label] ?? [],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Featured Images",
                    style: AppWidget.boldTextFieldStyle()
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  BannerSection(
                    pageController: widget._pageController,
                    imagePaths:
                        bannerImagePaths.values.expand((x) => x).toList(),
                    showPoint: true,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "New products",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: ProductList(products: products),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
