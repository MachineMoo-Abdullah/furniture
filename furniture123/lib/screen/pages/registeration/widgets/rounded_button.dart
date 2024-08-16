import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.2, vertical: size.height * 0.01),
        backgroundColor: const Color(0xfff966f33),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.04, // Dynamic font size
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
