import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart'; // Ensure correct import path for Cart

class OrderSummary extends StatelessWidget {
  final double totalAmount;
  final void Function() onOrderNow;

  const OrderSummary({
    super.key,
    required this.totalAmount,
    required this.onOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get screen size

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total',
            style: AppWidget.boldTextFieldStyle().copyWith(fontSize: 23),
          ),
          Chip(
            label: Text(
              '\$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: size.height * 0.025), // Adjust font size
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SizedBox(width: size.width * 0.1), // Adjust spacing
          ElevatedButton(
            onPressed: onOrderNow,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02), // Adjust padding
            ),
            child: Text(
              'ORDER NOW',
              style: TextStyle(fontSize: size.height * 0.025), // Adjust font size
            ),
          )
        ],
      ),
    );
  }
}
