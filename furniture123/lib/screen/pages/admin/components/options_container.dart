import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class AdminButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;

  const AdminButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left : 30.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black, // Background color of the icon
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  iconData,
                  size: size.width * 0.1, // Adjust the icon size as needed
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 30), // Space between icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: size.width * 0.06,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
