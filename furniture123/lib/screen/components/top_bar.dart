import 'package:flutter/material.dart';
import 'package:myapp/screen/screen.dart';

class EllipticalSearchBar extends StatelessWidget {
  final String pageName; // Page name passed as a parameter

  const EllipticalSearchBar({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.15, // Increased height for the new row
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kPrimaryColor, Colors.brown],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 40.0,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 100.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, color: Colors.white), // Back arrow icon
                      const SizedBox(width: 10.0),
                      Text(
                        pageName,
                        style: AppWidget.boldTextFieldStyle().copyWith(color:Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05), // Space for the search bar
          ],
        ),
        Positioned(
          top: size.height * 0.1, // Adjust position as needed
          left: size.width * 0.05,
          right: size.width * 0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

