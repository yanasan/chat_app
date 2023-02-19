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

  Future<void> setUser() async {
    final id = _auth.currentUser!.uid;
    final setUser = await FireUserService().setUser(id: id);
    return setUser;
  }

  Future<void> Function() getUser() {
    final getUser = FireUserService().getAllUser;
    return getUser;
  }
}
