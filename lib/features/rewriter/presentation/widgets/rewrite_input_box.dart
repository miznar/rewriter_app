import 'package:flutter/material.dart';

class RewriteInputBox extends StatelessWidget {
  final TextEditingController controller;

  const RewriteInputBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: "Enter your text",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
