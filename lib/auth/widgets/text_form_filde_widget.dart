import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? icon;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.icon,
    this.isObscure = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
