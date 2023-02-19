import 'package:chat_app/models/friends.dart';
import 'package:chat_app/service/fire_friends_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../../models/user.dart';

part 'search_page_controller.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default(User()) User user,
    @Default([]) List<Friends> friends,
    required Query<Map<String, dynamic>> query,
  }) = _SearchPageState;
}

final searchPageProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchPageState>(
        (ref) {
  return SearchPageController();
});

class SearchPageController extends StateNotifier<SearchPageState> {
  SearchPageController() : super(SearchPageState(query: query));

  Future<void> setFriend({
    required String id,
    required String myId,
  }) async {
    final setFriend = await FireFriendsService().setFrends(id: id, myId: myId);

    return setFriend;
  }

  static Query<Map<String, dynamic>> query = FirebaseFirestore.instance
      .collection('commands')
      .doc('all')
      .collection('users');
}
