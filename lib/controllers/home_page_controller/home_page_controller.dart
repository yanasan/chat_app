import 'dart:async';
import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/friends.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_friends_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default([]) List<Friends> friendslist,
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
        super(const HomePageState());

  final User _user;

  Future<void> setFriend({
    required String id,
    required String myId,
  }) async {
    final setFriend = await FireFriendsService().setFrends(id: id, myId: myId);
    return setFriend;
  }

  void init() async {
    state = state.copyWith(
      friendslist: await FireFriendsService().getMyFriends(id: _user.id),
    );
  }
}
