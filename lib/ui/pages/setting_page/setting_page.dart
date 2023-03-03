import 'package:chat_app/ui/pages/profile_setting_page/profile_setting_page.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          buildPersonalSettings(context),
        ],
      ),
    );
  }

  Widget buildPersonalSettings(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gray1Text('個人情報', 14),
        buildListItem(
          icon: Icons.person,
          text: 'プロフィール',
          onTap: () => Navigator.push(context, SettingProfilePage.route()),
        ),
        buildListItem(
          icon: Icons.notifications,
          text: '通知設定',
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildListItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(width: 15),
            Black1Text.bold(text, 18),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_outlined),
          ],
        ),
      ),
    );
  }
}
