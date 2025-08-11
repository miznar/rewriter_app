import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/rewrite_controller.dart';
import '../widgets/rewrite_input_box.dart';
import '../widgets/rewrite_style_selector.dart';
import '../widgets/rewrite_output_box.dart';
import '../widgets/rewrite_action_button.dart';

class RewriteScreen extends ConsumerStatefulWidget {
  const RewriteScreen({super.key});

  @override
  ConsumerState<RewriteScreen> createState() => _RewriteScreenState();
}

class _RewriteScreenState extends ConsumerState<RewriteScreen> {
  final _controller = TextEditingController();
  String _selectedStyle = "Formal";

  @override
  Widget build(BuildContext context) {
    final rewriteState = ref.watch(rewriteProvider);
    final rewriteNotifier = ref.read(rewriteProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Rewrite Text")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RewriteInputBox(controller: _controller),
            const SizedBox(height: 16),
            RewriteStyleSelector(
              selectedStyle: _selectedStyle,
              styles: const ["Formal", "Casual", "Creative"],
              onStyleChanged: (style) => setState(() => _selectedStyle = style),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: rewriteState.when(
                data: (output) => RewriteOutputBox(text: output),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Text("Error: $err"),
              ),
            ),
            const SizedBox(height: 16),
            RewriteActionButton(
              onPressed: () => rewriteNotifier.rewriteText(
                _controller.text,
                _selectedStyle,
              ),
              isLoading: rewriteState.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
