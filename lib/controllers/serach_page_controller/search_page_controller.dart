import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../../models/user.dart';

part 'search_page_controller.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default([]) List<User> userList,
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
        super(const SearchPageState());
  final User _user;

  // Future<void> setFriend({
  //   required String id,
  // }) async {
  //   final friendsData = await FireUserService().fetchUser(id: id);
  //   if (friendsData == null) return;
  //   final setFriend = await FireFriendsService()
  //       .setFriends(id: id, myId: _user.id, name: friendsData.name);
  //   return setFriend;
  // }

  // void init() async {
  //   final userList = await FireUserService().fetchUserList(id: _user.id);
  //   state = state.copyWith(
  //     userList: userList,
  //   );
  // }
}
