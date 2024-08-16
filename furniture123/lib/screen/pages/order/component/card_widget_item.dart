import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String imagePath;
  final String productId;

  const CartItemWidget({
    super.key,
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 2.0),
          child: Stack(
            children: [
              ListTile(
                leading: imagePath.startsWith('http') || imagePath.startsWith('https')
                  ? Image.network(imagePath, width: 55, fit: BoxFit.cover)
                  : Image.asset(imagePath, width: 55, fit: BoxFit.cover),
                title: Text(name),
                subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cart.decreaseQuantity(productId);
                        },
                      ),
                      Text('$quantity x', style: const TextStyle(fontSize: 15)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cart.addItem(productId, price, name, imagePath);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cart.removeItem(productId);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
