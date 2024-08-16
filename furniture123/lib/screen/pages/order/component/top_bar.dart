import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart'; // Ensure correct import path

class OrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrderAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(color: kPrimaryColor),
      title: const Text(
        'Your Cart',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Change back icon color to white
      ),
    );
  }
}
