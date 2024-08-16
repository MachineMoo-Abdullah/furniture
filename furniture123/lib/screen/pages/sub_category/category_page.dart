import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';
import '../../data/banner_manager.dart';
import '../../data/tabsdata.dart'; // Import tabsdata.dart here

class CategoryPage extends StatefulWidget {
  final String categoryName;
  final List<String> tabItems;  // Add this to accept dynamic tabs
  final String? bannerText;

  const CategoryPage({
    required this.categoryName,
    required this.tabItems,  // Require the tab items
    this.bannerText,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  late List<String> currentBannerImages;

  final Map<String, bool> favourites = {};

  void toggleFavourite(String productId) {
    setState(() {
      favourites[productId] = !(favourites[productId] ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);

    final BannerImagesManager bannerManager = BannerImagesManager();
    currentBannerImages = bannerManager.getBannerImages(widget.categoryName, [widget.tabItems[0]]);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _updateBannerImages(_tabController.index);
      }
    });
  }

  void _updateBannerImages(int tabIndex) {
    final selectedItem = widget.tabItems[tabIndex];

    final BannerImagesManager bannerManager = BannerImagesManager();
    setState(() {
      currentBannerImages = bannerManager.getBannerImages(widget.categoryName, [selectedItem]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EllipticalSearchBar(pageName: widget.categoryName),
          BannerSection(
            pageController: _pageController,
            imagePaths: currentBannerImages,
            showPoint: false,
            bannerText: widget.bannerText,
          ),
          TabBar(
            controller: _tabController,
            tabs: widget.tabItems.map((item) => Tab(text: item)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabItems.map((item) {
                return BuildWidgetItems(items: productsMap[item] ?? []);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
