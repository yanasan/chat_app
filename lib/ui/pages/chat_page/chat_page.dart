import 'package:chat_app/models/user.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';

final controller = TextEditingController();

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.user});

  final User user;

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
        body: buildChatPageTextFields(),
      ),
    );
  }

  Widget buildChatPageTextFields() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        color: AppColors.primaly2,
        height: 100,
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'メッセージを入力してください',
                  hintStyle:
                      const TextStyle(fontSize: 12, color: AppColors.primaly),
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
              ),
            ),
            IconButton(
              onPressed: () {
                // print('メッセージ送信');
              },
              icon: const Icon(
                Icons.send,
                size: 24,
                color: AppColors.primaly3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
