import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String icon;

  const SocialLoginButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(icon),
    );
  }
}
