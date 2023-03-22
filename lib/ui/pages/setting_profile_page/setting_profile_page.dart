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

final formKey = GlobalKey<FormState>();

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
                    buildTextArea()
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
            final formState = formKey.currentState;
            FocusScope.of(context).unfocus();
            await EasyLoading.show(status: '保存中...');
            if (formState != null && formState.validate()) {
              formState.save();
              await ref.read(settingProfilePageProvider.notifier).submit();
              await EasyLoading.showSuccess('保存完了！');
            } else {
              await EasyLoading.showError('保存に失敗しました');
            }
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

  Widget buildMyTextFields({
    String? initValue,
    required String hintText,
    required void Function(String value) onSaved,
    String? Function(String? value)? validator,
  }) {
    return HookBuilder(
      builder: (context) {
        final controller = useTextEditingController();
        useEffect(
          () {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (initValue != null) {
                controller.text = initValue;
              }
            });
            return null;
          },
          [initValue],
        );
        return TextFormField(
          decoration: InputDecoration(hintText: hintText),
          onSaved: (value) {
            if (value != null) {
              onSaved(value);
            }
          },
          validator: validator,
          controller: controller,
        );
      },
    );
  }

  Widget buildTextArea() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final user =
            ref.watch(settingProfilePageProvider.select((value) => value.user));

        return Form(
          key: formKey,
          child: Column(
            children: [
              buildMyTextFields(
                initValue: user.name,
                hintText: '名前を入力',
                onSaved:
                    ref.read(settingProfilePageProvider.notifier).setUserName,
                validator: validatorRequired,
              ),
              const SizedBox(height: 40),
              buildMyTextFields(
                initValue: user.description,
                hintText: '自己紹介を入力',
                onSaved: ref
                    .read(settingProfilePageProvider.notifier)
                    .setDescription,
              )
            ],
          ),
        );
      },
    );
  }

  String? validatorRequired(String? value) {
    if (value == null || value.isEmpty) {
      return '必須項目です';
    }
    return null;
  }
}
