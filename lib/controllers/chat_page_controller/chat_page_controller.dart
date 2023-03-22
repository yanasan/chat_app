import 'package:chat_app/service/fire_chat_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'chat_page_controller.freezed.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState({
    @Default('') String message,
  }) = _RootPageState;
}

final chatPageProvider =
    StateNotifierProvider<ChatPageController, ChatPageState>((ref) {
  throw UnimplementedError();
});

class ChatPageController extends StateNotifier<ChatPageState> {
  ChatPageController({
    required String roomId,
    required String userId,
  })  : _roomId = roomId,
        _userId = userId,
        super(const ChatPageState());

  final String _roomId;
  final String _userId;

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }

  Future<void> sendMessage() async {
    print(_roomId);
    await FireChatService()
        .sendMessage(roomId: _roomId, userId: _userId, message: state.message);
  }
}
