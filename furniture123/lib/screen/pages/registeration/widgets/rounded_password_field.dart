import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'widgets.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const RoundedPasswordField({
    super.key,
    this.controller,
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller, // Set the controller
        validator: widget.validator, // Set the validator
        obscureText: _obscureText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
            onPressed: _toggleVisibility,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
