import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  Input(
      {super.key,
      required this.controller,
      required this.labelText,
      this.suffixIcon,
      this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(8),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
