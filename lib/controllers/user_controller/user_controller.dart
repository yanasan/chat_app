import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

part 'user_controller.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(User()) User user,
  }) = _UserState;
}

final userProvider =
    StateNotifierProvider<UserController, UserState>((ref) => UserController());

class UserController extends StateNotifier<UserState> {
  UserController() : super(const UserState());

  final _auth = firebase.FirebaseAuth.instance;

  void setUserId() async {
    final id = _auth.currentUser!.uid;
    state = state.copyWith(user: state.user.copyWith(id: id));
  }

  Future<void> createUser() async {
    var currentUser = _auth.currentUser;
    final uid = currentUser?.uid;

    if (uid == null) return;

    if (!await FireUserService().isExisted(id: uid)) {
      await FireUserService().createUser(id: uid);
    }
    final user = await FireUserService().fetchUser(id: uid);
    if (user != null) {
      state = state.copyWith(user: user);
    }
  }
}
