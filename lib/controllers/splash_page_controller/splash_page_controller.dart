import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/preferences_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'splash_page_controller.freezed.dart';

@freezed
class SplashPageState with _$SplashPageState {
  const factory SplashPageState({
    bool? isFirstLaunch,
  }) = _SplashPageState;
}

final splashPageProvider =
    StateNotifierProvider<SplashPageController, SplashPageState>((ref) {
  final isAuthenticated =
      ref.watch(userProvider.select((s) => s.isAuthenticated));
  return SplashPageController(
    isAuthenticated: isAuthenticated,
  );
});

class SplashPageController extends StateNotifier<SplashPageState> {
  SplashPageController({
    required bool isAuthenticated,
  })  : _isAuthenticated = isAuthenticated,
        super(const SplashPageState()) {
    init();
  }

  final bool _isAuthenticated;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1)); // Splash表示のための遅延
    if (_isAuthenticated && mounted) {
      final isFirstLaunch = PreferencesManager().isFirstLaunch;
      state = state.copyWith(isFirstLaunch: isFirstLaunch);
    }
  }
}
