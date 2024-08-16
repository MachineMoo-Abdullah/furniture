import 'package:flutter/material.dart';
import 'package:myapp/screen/pages/product_details/details.dart';


class ProductItem extends StatelessWidget {
  final String id;
  final String imagePath;
  final String name;
  final String description;
  final double price;

  const ProductItem({
    super.key,
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              id: id, 
              imagePath: imagePath,
              name: name,
              description: description,
              price: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 16.0, color: Colors.black87),
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
