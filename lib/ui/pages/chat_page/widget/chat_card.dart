import 'package:chat_app/models/messages.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.message, required this.someoneId});

  final Message message;
  final String someoneId;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: message.userId == someoneId
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: message.userId == someoneId
                ? AppColors.primaly3
                : AppColors.primaly2,
          ),
          child: message.userId == someoneId
              ? Black1Text(
                  message.message,
                  16,
                )
              : WhiteText(message.message, 16),
        ),
      ),
    );
  }
}
