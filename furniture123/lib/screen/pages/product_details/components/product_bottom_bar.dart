import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';

class ProductBottomBar extends StatelessWidget {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final int quantity;

  const ProductBottomBar({
    super.key,
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double totalPrice = price * quantity; // Calculate total price

    return Container(
      height: size.height * 0.14, // Fixed height for bottom navigation bar
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 20, // 4% of screen width
                  color: Colors.black,
                ),
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18, // 5% of screen width
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (quantity > 0) {
                // Add item to cart if quantity is greater than 0
                Provider.of<Cart>(context, listen: false).addItem(
                  id,
                  price,
                  name,
                  imagePath,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$name added to cart!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } else {
                // Show snackbar if quantity is 0
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Select a quantity'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: size.height * 0.02),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: size.height * 0.03, // 5% of screen width
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.card_travel, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
