import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'component/card_widget_item.dart';
import 'component/order_summary.dart';
import 'component/top_bar.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: const OrderAppBar(),
      body: cart.itemCount == 0
          ? const Center(
              child: Text('No items in the cart'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) => CartItemWidget(
                      id: cartItems[i].id,
                      name: cartItems[i].name,
                      quantity: cartItems[i].quantity,
                      price: cartItems[i].price,
                      imagePath: cartItems[i].imagePath,
                      productId: cart.items.keys.toList()[i],
                    ),
                  ),
                ),
                const Divider(),
                OrderSummary(
                  totalAmount: cart.totalAmount,
                  onOrderNow: () {
                    cart.clear(); // Clear the cart after placing the order
                  },
                ),
              ],
            ),
    );
  }
}
