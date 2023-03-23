import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/service/fire_chat_service.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../../models/user.dart';
import '../../service/fire_friends_service.dart';

part 'search_page_controller.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default([]) List<User> userList,
    @Default({}) Map<String, bool> userIsFollowing,
    @Default([]) List<Chat> chatList,
  }) = _SearchPageState;
}

final searchPageProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchPageState>(
        (ref) {
  final user = ref.watch(userProvider.select((value) => value.user));
  return SearchPageController(user: user);
});

class SearchPageController extends StateNotifier<SearchPageState> {
  SearchPageController({required User user})
      : _user = user,
        super(const SearchPageState()) {
    init();
  }
  final User _user;

  void init() {
    fetchSerchUser();
  }

  Future<void> followUser({
    required String someoneId,
  }) async {
    await EasyLoading.show(status: 'loading...');
    await FireFriendsService().followUser(someoneId: someoneId, myId: _user.id);
    await createChatRoom(someoneId: someoneId);
    final userIsFollowingMap = Map.of(state.userIsFollowing);
    userIsFollowingMap[someoneId] = true;
    state = state.copyWith(userIsFollowing: userIsFollowingMap);
    await EasyLoading.showSuccess('友人に追加しました');
  }

  Future<void> unfollowUser({
    required String someoneId,
  }) async {
    await EasyLoading.show(status: 'loading...');
    final roomId = await getRoomId(someoneId: someoneId);
    await FireFriendsService()
        .removeFollowUser(someoneId: someoneId, myId: _user.id);
    await FireChatService().removeChatRoom(roomId: roomId);
    final userIsFollowingMap = Map.of(state.userIsFollowing);
    userIsFollowingMap[someoneId] = false;
    state = state.copyWith(userIsFollowing: userIsFollowingMap);
    await EasyLoading.showSuccess('友人から削除しました');
  }

  Future<Map<String, bool>> fetchIsFollowing() async {
    final isFollowings = <String, bool>{};
    final userList = await FireUserService().fetchUserList(id: _user.id);
    for (final userData in userList) {
      final followingBool = await FireFriendsService().isFriendsExists(
        myId: _user.id,
        someoneId: userData.id,
      );
      isFollowings[userData.id] = followingBool;
    }
    state = state.copyWith(userIsFollowing: isFollowings);
    return state.userIsFollowing;
  }

  Future<void> fetchSerchUser() async {
    final userList = await FireUserService().fetchUserList(id: _user.id);
    final userIsFollowing = await fetchIsFollowing();
    final chatList = await FireChatService().fetchChatList(myId: _user.id);
    state = state.copyWith(
      userList: userList,
      userIsFollowing: userIsFollowing,
      chatList: chatList,
    );
  }

  Future<void> createChatRoom({required String someoneId}) async {
    final member = <String>[_user.id];
    member.add(someoneId);
    await FireChatService().createChatRoom(member: member);
    final chatList = await FireChatService().fetchChatList(myId: _user.id);
    state = state.copyWith(chatList: chatList);
  }

  Future<String> getRoomId({required someoneId}) async {
    var roomId = '';

    for (final chatData in state.chatList) {
      final chatMember = chatData.member;
      if (chatMember.contains(_user.id) && chatMember.contains(someoneId)) {
        roomId = chatData.roomId;
      }
    }
    return roomId;
  }
}
