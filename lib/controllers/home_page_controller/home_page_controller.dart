import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_chat_service.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<User> friendsData,
    @Default([]) List<Chat> chatList,
    required Chat chat,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
  (ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    return HomePageController(user: user, chat: Chat(update: DateTime.now()));
  },
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController({
    required User user,
    required Chat chat,
  })  : _user = user,
        super(HomePageState(chat: chat)) {
    init();
  }

  final User _user;

  void init() {
    featchHomePaga();
  }

  Future<void> featchHomePaga() async {
    final chatList = await FireChatService().fetchChatList(myId: _user.id);

    final friendsData = <User>[];

    for (final userData in chatList) {
      final id = userData.member.where((e) => e != _user.id);
      final user = await FireUserService().fetchUser(id: id.first);
      if (user != null) {
        friendsData.add(user);
      }
    }

    state = state.copyWith(
      friendsData: friendsData,
      chatList: chatList,
    );
  }
}
