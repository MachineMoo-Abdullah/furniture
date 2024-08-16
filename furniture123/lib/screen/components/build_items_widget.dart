import 'package:flutter/material.dart';
import 'package:myapp/screen/pages/home/components/product_items.dart'; // Import ProductItem class

class BuildWidgetItems extends StatelessWidget {
  final List<ProductItem> items;

  const BuildWidgetItems({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final product = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ProductItem(
            id: product.id,
            imagePath: product.imagePath,
            name: product.name,
            description: product.description,
            price: product.price,
           ),
        );
      },
    );
  }
}
