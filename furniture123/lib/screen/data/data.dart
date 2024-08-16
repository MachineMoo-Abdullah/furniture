
import 'package:myapp/screen/screen.dart';

class Category {
  final String imagePath;
  final String label;

  Category({required this.imagePath, required this.label});
}

final List<Category> categories = [
  Category(imagePath: "assets/images/home_images/living.png", label: "Living Area"),
  Category(imagePath: "assets/images/home_images/hotel.png", label: "Bed Room"),
  Category(imagePath: "assets/images/home_images/garden.png", label: "Garden"),
  Category(imagePath: "assets/images/home_images/workplace.png", label: "Office"),
  Category(imagePath: "assets/images/home_images/dining.png", label: "Dining"),
  Category(imagePath: "assets/images/home_images/ancient.png", label: "Ancient"),
];

final Map<String, List<String>> bannerImagePaths = {
  "Living Area": ['assets/images/categories/livingarea.jpg'],
  "Bed Room": ['assets/images/categories/bedroom.jpg'],
  "Garden": ['assets/images/categories/garden.jpg'],
  "Office": ['assets/images/categories/office.jpg'],
  "Dining": ['assets/images/categories/diningarea.jpg'],
  "Ancient": ['assets/images/categories/ancientfurniture.jpg'],
};
final Map<String, List<String>> categoryTabs = {
        'Living Area': ['Chair', 'Table', 'Sofa'],
        'Bed Room': ['Cupboard', 'Bed', 'Chair', 'Sofa'],
        'Garden': ['Chair', 'Table', 'Swing'],
        'Office': ['Desk', 'Chair', 'Sofa'],
        'Dining': ['Table', 'Chair', 'Cabinet'],
        'Ancient': ['Table', 'Chair', 'Sofa', 'Bed'],
};

final List<ProductItem> products = [
  const ProductItem(
    id: '1',
    imagePath: 'assets/images/products/chair.jpg',
    name: 'Chair',
    description: 'A comfortable chair',
    price: 59.99,
  ),
  // Add more products as needed
];
