
import '../pages/home/components/product_items.dart';

final Map<String, List<ProductItem>> productsMap = {
  'Chair': [
    const ProductItem(
      id: '1',
      imagePath: 'assets/images/products/chair.jpg',
      name: 'Chair',
      description: 'A comfortable chair',
      price: 59.99,
    ),
  ],
  // Add other products as needed
};
