import 'package:chat_app/controllers/chat_page_controller/chat_page_controller.dart';
import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/ui/pages/chat_page/widget/chat_card.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _formKeyProvider =
    StateProvider.autoDispose<GlobalKey<FormState>?>((ref) => null);

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.user,
    required this.roomId,
  });

  final User user;
  final String roomId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.gray2,
        appBar: AppBar(
          title: Text(
            user.name.isEmpty ? 'ゲスト' : user.name,
          ),
        ),
        body: ProviderScope(
          overrides: [
            chatPageProvider.overrideWith(
              (ref) {
                final usrId =
                    ref.watch(userProvider.select((value) => value.user.id));
                return ChatPageController(roomId: roomId, userId: usrId);
              },
            ),
          ],
          child: Consumer(
            builder: (context, ref, child) {
              final messages =
                  ref.watch(chatPageProvider.select((value) => value.messages));

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return ChatCard(
                          message: message,
                          someoneId: user.id,
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    color: AppColors.primaly2,
                    height: 100,
                    child: buildChatPageTextFields(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildChatPageTextFields() {
    return HookConsumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final formKey = useMemoized(GlobalKey<FormState>.new, const []);

        useEffect(
          () {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              ref.read(_formKeyProvider.notifier).state = formKey;
            });
            return null;
          },
          [formKey],
        );
        return Row(
          children: [
            Flexible(
              child: Form(
                key: formKey,
                child: buildMyTextFields(
                  hintText: 'メッセージを入力してください',
                  onSaved: ref.read(chatPageProvider.notifier).setMessage,
                ),
              ),
            ),
            buildSendButton(),
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
    return TextFormField(
      onSaved: (value) {
        if (value != null) {
          onSaved(value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12, color: AppColors.primaly),
        fillColor: AppColors.primaly3,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.primaly,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.primaly3,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  Widget buildSendButton() {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final formKey = ref.watch(_formKeyProvider);
        return IconButton(
          onPressed: () async {
            final formState = formKey?.currentState;
            FocusScope.of(context).unfocus();
            await EasyLoading.show(status: '保存中...');
            if (formState != null && formState.validate()) {
              formState.save();
              await ref.read(chatPageProvider.notifier).sendMessage();
              await EasyLoading.showSuccess('保存完了！');
              formState.reset();
            } else {
              await EasyLoading.showError('保存に失敗しました');
            }
          },
          icon: const Icon(
            Icons.send,
            size: 24,
            color: AppColors.primaly3,
          ),
        );
      },
    );
  }
}
