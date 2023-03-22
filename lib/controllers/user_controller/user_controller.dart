import 'dart:async';
import 'dart:developer';

import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

part 'user_controller.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isAuthenticated,
    @Default(User()) User user,
  }) = _UserState;
}

final userProvider =
    StateNotifierProvider<UserController, UserState>((ref) => UserController());

class UserController extends StateNotifier<UserState> {
  UserController() : super(const UserState()) {
    login();
  }

  final _auth = firebase.FirebaseAuth.instance;
  StreamSubscription? _userSubs;

  Future<void> login() async {
    var currentUser = _auth.currentUser;
    final uid = currentUser?.uid;

    if (uid == null) return;

    if (!await FireUserService().isExisted(id: uid)) {
      await FireUserService().createUser(id: uid);
    }
    await _listenOnUserChanged(uid);
  }

  Future<void> _listenOnUserChanged(String uid) async {
    if (_userSubs != null) await _userSubs?.cancel();
    _userSubs = FireUserService().listenUser(
      id: uid,
      onValueChanged: (user) {
        log('${user.toJson()}');
        state = state.copyWith(
          user: user,
          isAuthenticated: true,
        );
      },
    );
  }
}
