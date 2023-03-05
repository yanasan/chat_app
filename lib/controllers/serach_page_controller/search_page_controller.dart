import 'package:chat_app/models/friends.dart';
import 'package:chat_app/service/fire_friends_service.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../../models/user.dart';

part 'search_page_controller.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default([]) List<User> userList,
    @Default([]) List<Friends> friends,
  }) = _SearchPageState;
}

final searchPageProvider =
    StateNotifierProvider.autoDispose<SearchPageController, SearchPageState>(
        (ref) {
  return SearchPageController();
});

class SearchPageController extends StateNotifier<SearchPageState> {
  SearchPageController() : super(const SearchPageState()) {
    init();
  }

  Future<void> setFriend({
    required String id,
    required String myId,
  }) async {
    final setFriend = await FireFriendsService().setFrends(id: id, myId: myId);

    return setFriend;
  }

  void init() async {
    state = state.copyWith(
      userList: await FireUserService().fetchUserList(),
    );
  }
}
