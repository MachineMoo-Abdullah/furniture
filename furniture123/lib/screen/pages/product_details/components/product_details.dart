import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ProductDetails({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
                Text(
                  name,
                  style: TextStyle(
                    fontSize: size.height * 0.045, // 6% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: size.width * 0.02), // Space between title and price
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 35, // Smaller container width
                  height: 35, // Smaller container height
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: decrementQuantity,
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02), // Space between buttons
                Text(
                  '$quantity',
                  style: TextStyle(
                    fontSize: size.height * 0.035, // 5% of screen width
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: size.width * 0.02), // Space between buttons
                Container(
                  width: 35, // Smaller container width
                  height: 35,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: incrementQuantity,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
              "\$${price.toStringAsFixed(2)}/pcs",
              style: TextStyle(
                fontSize: size.height * 0.04, // 4.5% of screen width
                color: kPrimaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
        SizedBox(height: size.height * 0.01), // 1% of screen height
        Text(
          'About Product',
          style: TextStyle(
            fontSize: size.height * 0.033, // 5% of screen width
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.01), // Space between heading and description
        Text(
          description,
          style: TextStyle(
            fontSize: size.height * 0.03, // 4.5% of screen width
          ),
        ),
      ],
    );
  }
}
