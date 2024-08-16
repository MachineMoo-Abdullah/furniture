import 'package:flutter/material.dart';
import 'commonpage.dart'; 
import 'package:myapp/screen/screen.dart';

import 'components/options_container.dart';

class HomeAdminPage extends StatelessWidget {
  final List<String> categories = [
    'Living area',
    'Bedroom',
    'Garden',
    'Office',
    'Ancient',
    'Dining area'
  ];

  final List<String> subcategories = [
    'Chair',
    'Sofa',
    'Bed'
  ];

  HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home', style: TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            AdminButton(
              text: 'Add Item',
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonAdminPage(
                    title: 'Add Item',
                    requiresImage: true,
                    requiresName: true,
                    requiresPrice: true,
                    requiresDescription: true,
                    categories: categories,
                    subcategories: subcategories,
                  ),
                ),
              );
              },
              iconData: Icons.add, // Pass IconData directly
              ),
            const SizedBox(height: 20),
            AdminButton(
              text: 'Update Item',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommonAdminPage(
                      title: 'Update Item',
                      requiresImage: true,
                      requiresName: true,
                      requiresPrice: true,
                      requiresDescription: true,
                      categories: categories,
                      subcategories: subcategories,
                    ),
                  ),
                );
              },
              iconData: Icons.update_outlined, // Pass IconData directly
            ),
            const SizedBox(height: 20),
            AdminButton(
              text: 'Remove Item',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommonAdminPage(
                      title: 'Remove Item',
                      requiresImage: true,
                      requiresName: true,
                      requiresPrice: true,
                      requiresDescription: true,
                      categories: categories,
                      subcategories: subcategories,
                    ),
                  ),
                );
              },
              iconData: Icons.remove, // Pass IconData directly
            ),

          ],
        ),
      ),
    );
  }
}
