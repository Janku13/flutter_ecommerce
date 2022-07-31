import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData inputIcon;
  final String inputLabel;
  final bool isPasswordInput;

  const CustomTextField({
    Key? key,
    required this.inputIcon,
    required this.inputLabel,
    this.isPasswordInput = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTextHidden = false;
  @override
  void initState() {
    super.initState();
    isTextHidden = widget.isPasswordInput;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        obscureText: isTextHidden,
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordInput
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isTextHidden = !isTextHidden;
                      },
                    );
                  },
                  icon: Icon(
                    isTextHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          prefixIcon: Icon(widget.inputIcon),
          labelText: widget.inputLabel,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
