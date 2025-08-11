import 'package:flutter/material.dart';

class RewriteActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const RewriteActionButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("Rewrite"),
      ),
    );
  }
}
