import 'dart:io';
import 'package:chat_app/controllers/setting_profile_page_controller/setting_profile_page_controller.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfilePage {
  static Route<T> route<T>() {
    return MaterialPageRoute(
      builder: (_) => _SettingProfilePage(),
      settings: const RouteSettings(name: 'setting_profile_page'),
    );
  }
}

final _formKeyProvider =
    StateProvider.autoDispose<GlobalKey<FormState>?>((ref) => null);

class _SettingProfilePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: const Text('プロフィール'),
        actions: [buildSubmitButton()],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Center(
                child: Column(
                  children: [
                    buildSettingProfileImage(),
                    const SizedBox(height: 40),
                    // buildSettingProfileText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Consumer(
      builder: (context, ref, _) {
        return GestureDetector(
          onTap: () async {
            FocusScope.of(context).unfocus();
            await EasyLoading.show();
            await ref.read(settingProfilePageProvider.notifier).submit();
            await EasyLoading.dismiss();
          },
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: CustomText.bold(
                '保存',
                15,
                color: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSettingProfileImage() {
    return HookConsumer(
      builder: (context, ref, child) {
        final user =
            ref.watch(settingProfilePageProvider.select((value) => value.user));
        final file = ref.watch(
          settingProfilePageProvider.select((value) => value.file),
        );

        return Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC1C1C1), width: 2),
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: file != null
                    ? Image.asset(
                        file.path,
                        fit: BoxFit.cover,
                      )
                    : user.profileImage.url.isNotEmpty
                        ? Image.network(
                            user.profileImage.url,
                            fit: BoxFit.cover,
                          )
                        : Container(color: AppColors.gray1),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                final image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  final file = File(image.path);
                  ref.read(settingProfilePageProvider.notifier).setFile(file);
                }
              },
              child: const CustomText(
                '画像を登録',
                15,
                color: AppColors.white,
              ),
            )
          ],
        );
      },
    );
  }

  // Widget buildSettingProfileTextField({
  //   required String hintText,
  //   required String initialValue,
  //   // required TextEditingController controller,
  //   required void Function(String value) onChanged,
  //   String? Function(String? value)? validator,
  // }) {
  //   return TextFormField(
  //     // controller: controller,
  //     decoration: InputDecoration(
  //       hintText: hintText,
  //     ),
  //     validator: validator,
  //     initialValue: initialValue,
  //     onChanged: (value) {
  //       onChanged(value);
  //     },
  //   );
  // }

  // Widget buildSettingProfileText() {
  //   return HookConsumer(
  //     builder: (context, ref, child) {
  //       final user =
  //           ref.watch(settingProfilePageProvider.select((value) => value.user));

  //       final nameController = useTextEditingController();
  //       final descriptionController = useTextEditingController();
  //       // ref.listen(settingProfilePageProvider.select((value) => value.user),
  //       //     (previous, next) {
  //       //   nameController
  //       //     ..text = next.name
  //       //     ..selection = TextSelection.fromPosition(
  //       //       TextPosition(offset: nameController.text.length),
  //       //     );
  //       //   // descriptionController
  //       //   //   ..text = next.description
  //       //   //   ..selection = TextSelection.fromPosition(
  //       //   //     TextPosition(offset: descriptionController.text.length),
  //       //   //   );
  //       // });

  //       return Form(
  //         child: Column(
  //           children: [
  //             buildSettingProfileTextField(
  //               initialValue: user.name,
  //               // controller: nameController,
  //               hintText: '名前を入力',
  //               onChanged:
  //                   ref.read(settingProfilePageProvider.notifier).setUserName,
  //               validator: validatorRequired,
  //             ),
  //             const SizedBox(height: 40),
  //             buildSettingProfileTextField(
  //               initialValue: user.description,
  //               // controller: descriptionController,
  //               hintText: '紹介文を入力',
  //               onChanged: ref
  //                   .read(settingProfilePageProvider.notifier)
  //                   .setDescription,
  //               validator: validatorRequired,
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  String? validatorRequired(String? value) {
    if (value == null || value.isEmpty) {
      return '必須項目です';
    }
    return null;
  }
}
