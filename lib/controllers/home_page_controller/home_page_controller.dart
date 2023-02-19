import 'dart:async';
import 'package:chat_app/models/friends.dart';
import 'package:chat_app/service/fire_friends_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    required Query<Map<String, dynamic>> query,
    @Default([]) List<Friends> friends,
  }) = _HomePageState;
}

final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageController, HomePageState>(
  (ref) {
    return HomePageController();
  },
);

class HomePageController extends StateNotifier<HomePageState> {
  HomePageController() : super(HomePageState(query: query));

  Future<void> setFriend({
    required String id,
    required String myId,
  }) async {
    final setFriend = await FireFriendsService().setFrends(id: id, myId: myId);
    return setFriend;
  }

  static CollectionReference<Map<String, dynamic>> query = FirebaseFirestore
      .instance
      .collection('commands')
      .doc('all')
      .collection('users');

  void getFriends({required String userId}) async {
    final query = FirebaseFirestore.instance
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(userId)
        .collection('friends');

    query.get().then((DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          final friends = Friends.fromJson(data) as List<Friends>;
          state = state.copyWith(friends: friends);
        } as FutureOr Function(QuerySnapshot<Map<String, dynamic>> value));
  }
}
