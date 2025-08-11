import 'package:flutter_riverpod/flutter_riverpod.dart';

final rewriteProvider = StateNotifierProvider<RewriteController, AsyncValue<String>>((ref) {
  return RewriteController();
});

class RewriteController extends StateNotifier<AsyncValue<String>> {
  RewriteController() : super(const AsyncValue.data(""));

  Future<void> rewriteText(String input, String style) async {
    state = const AsyncValue.loading();
    try {
      // TODO: Replace with API call to backend
      await Future.delayed(const Duration(seconds: 2));
      state = AsyncValue.data("Rewritten ($style): $input");
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
