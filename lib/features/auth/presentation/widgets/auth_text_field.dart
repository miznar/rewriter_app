import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: InputDecoration(

        labelText: label, // This makes text appear above when focused
        floatingLabelBehavior: FloatingLabelBehavior.always,

        labelStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 14,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
