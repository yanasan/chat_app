import 'dart:io';

import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/service/fire_image_service.dart';
import 'package:chat_app/service/fire_user_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'setting_profile_page_controller.freezed.dart';

@freezed
class SettingProfilePageState with _$SettingProfilePageState {
  const factory SettingProfilePageState({
    required User user,
    File? file,
  }) = _SettingProfilePageState;
}

final settingProfilePageProvider = StateNotifierProvider.autoDispose<
    SettingProfilePageController, SettingProfilePageState>(
  (ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    return SettingProfilePageController(user: user);
  },
);

class SettingProfilePageController
    extends StateNotifier<SettingProfilePageState> {
  SettingProfilePageController({required User user})
      : super(SettingProfilePageState(user: user)) {
    init();
  }

  void init() async {
    final user = await FireUserService().fetchUser(id: state.user.id);
    if (user != null) {
      state = state.copyWith(user: user);
    }
  }

  void setUserName(String value) =>
      state = state.copyWith(user: state.user.copyWith(name: value));
  void setDescription(String value) =>
      state = state.copyWith(user: state.user.copyWith(description: value));

  void setFile(File file) {
    state = state.copyWith(file: file);
  }

  Future<void> submit() async {
    if (state.file != null) {
      state = state.copyWith(
        user: state.user.copyWith(
          profileImage: await FireImagesService().upload(
            userId: state.user.id,
            file: state.file!,
          ),
        ),
      );
    }
    await FireUserService().updateUser(user: state.user);
  }
}
