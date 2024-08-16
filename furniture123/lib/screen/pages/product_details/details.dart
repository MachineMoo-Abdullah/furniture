import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;          // Add this line
  final String imagePath;
  final String name;
  final String description;
  final double price;

  const ProductDetailPage({
    super.key,
    required this.id,       // Add this line
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(color: kPrimaryColor),
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change back icon color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(imagePath: widget.imagePath),
              SizedBox(height: size.height * 0.02), // 2% of screen height
              ProductDetails(
                name: widget.name,
                description: widget.description,
                price: widget.price,
                quantity: _quantity,
                incrementQuantity: _incrementQuantity,
                decrementQuantity: _decrementQuantity,
              ),
              SizedBox(height: size.height * 0.01), // Space between description and line
              Divider(
                color: Colors.grey[300], // Line color
                thickness: 1.0, // Line thickness
              ),
              SizedBox(height: size.height * 0.02), // 2% of screen height
            ],
          ),
        ),
      ),
      bottomNavigationBar: ProductBottomBar(
        id: widget.id,               // Pass the product ID
        name: widget.name,           // Pass the product name
        imagePath: widget.imagePath, // Pass the product image path
        price: widget.price,
        quantity: _quantity,
      ),
    );
  }
}

