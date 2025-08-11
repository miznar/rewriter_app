import 'package:flutter/material.dart';

class RewriteOutputBox extends StatelessWidget {
  final String text;

  const RewriteOutputBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text.isEmpty ? "Your rewritten text will appear here" : text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
