import 'dart:math';

import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/friends.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_chat_service.dart';
import 'package:chat_app/service/fire_friends_service.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Friends> friendslist,
    @Default([]) List<User> friendsData,
    @Default([]) List<Chat> chatList,
    Chat? chat,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
  (ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    return HomePageController(user: user);
  },
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController({required User user})
      : _user = user,
        super(const HomePageState()) {
    init();
  }

  final User _user;

  void init() {
    featchHomePaga();
  }

  Future<void> featchHomePaga() async {
    final friendsList = await FireFriendsService().getMyFriends(id: _user.id);

    final friendsData = <User>[];
    for (final userData in friendsList) {
      final user = await FireUserService().fetchUser(id: userData.id);
      if (user != null) {
        friendsData.add(user);
      }
    }
    final chatList = await FireChatService().fetchChatList();
    state = state.copyWith(
      friendslist: friendsList,
      friendsData: friendsData,
      chatList: chatList,
    );
  }

  Future<void> createChatRoom({required String someoneId}) async {
    final member = <String>[_user.id];
    member.add(someoneId);
    final isRoom = <bool>[];

    if (state.chatList.isEmpty) {
      await FireChatService().createChatRoom(member: member);
    } else {
      for (final chatData in state.chatList) {
        final chatMember = chatData.member;

        if (chatMember.contains(_user.id) && chatMember.contains(someoneId)) {
          final chat =
              await FireChatService().fetchChat(roomId: chatData.roomId);

          state = state.copyWith(chat: chat);
        } else {
          isRoom.add(false);
        }
      }
      if (isRoom.length == state.chatList.length) {
        await FireChatService().createChatRoom(member: member);
      }
    }

    final chatList = await FireChatService().fetchChatList();
    state = state.copyWith(chatList: chatList);
  }

  Future<void> featchChat() async {
    final chatList = await FireChatService().fetchChatList();
    state = state.copyWith(chatList: chatList);

    for (final chatData in chatList) {
      final chat = await FireChatService().fetchChat(roomId: chatData.roomId);
      state = state.copyWith(chat: chat);
    }
  }
}
