import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.white,
            color: kPrimaryColor,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (int index) {
              navigationProvider.setIndex(index);
            },
            items: const [
              Icon(Icons.home_outlined, color: Colors.white),
              Icon(Icons.category_outlined, color: Colors.white),
              Icon(Icons.shopping_bag_outlined, color: Colors.white),
              Icon(Icons.person_outline, color: Colors.white),
            ],
            index: navigationProvider.currentIndex,
          ),
          body: _getPage(navigationProvider.currentIndex),
        );
      },
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return const Order();
      case 3:
        return const ProfilePage();
      default:
        return HomeScreen(); // Default case
    }
  }
}
