import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData inputIcon;
  final String inputLabel;
  final bool isTextHidden;
  const CustomTextField({
    Key? key,
    required this.inputIcon,
    required this.inputLabel,
    this.isTextHidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        obscureText: isTextHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(inputIcon),
          labelText: inputLabel,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
