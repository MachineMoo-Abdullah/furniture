import 'package:flutter/material.dart';
import '../../../../constants.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({super.key, required this.child});
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.01),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
        border: Border.all(
          color: _isFocused ? kPrimaryColor : kPrimaryLightColor,
          width: 2.0,
        ),
      ),
      child: Focus(
        focusNode: _focusNode,
        child: widget.child,
      ),
    );
  }
}