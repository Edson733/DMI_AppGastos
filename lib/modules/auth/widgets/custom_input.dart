import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  const CustomInput({super.key, required this.controller, required this.hintText, required this.labelText, this.validator, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(fontSize: 16, color: Colors.white38),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
    );
  }
}