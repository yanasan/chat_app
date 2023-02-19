import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'chat_page_controller.freezed.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState({
    @Default(0) int tabIndex,
  }) = _RootPageState;
}

final chatPageProvider =
    StateNotifierProvider.autoDispose<ChatPageController, ChatPageState>((ref) {
  return ChatPageController();
});

class ChatPageController extends StateNotifier<ChatPageState> {
  ChatPageController() : super(const ChatPageState());
}
