import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';

class ProductList extends StatelessWidget {
  final List<ProductItem> products;

  const ProductList({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ProductItem(
          id: product.id,
          imagePath: product.imagePath,
          name: product.name,
          description: product.description,
          price: product.price,
        ),
      )).toList(),
    );
  }
}
