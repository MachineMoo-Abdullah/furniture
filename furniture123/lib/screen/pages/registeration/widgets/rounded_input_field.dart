  import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screen/pages/registeration/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const RoundedInputField({
    super.key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,  // Set the controller
        validator: validator,    // Set the validator
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}