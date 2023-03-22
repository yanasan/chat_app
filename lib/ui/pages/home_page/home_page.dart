import 'package:chat_app/controllers/home_page_controller/home_page_controller.dart';
import 'package:chat_app/models/friends.dart';
import 'package:chat_app/ui/pages/chat_page/chat_page.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホームページ'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final friendsList =
              ref.watch(homePageProvider.select((value) => value.friendslist));

          return RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
              itemCount: friendsList.length,
              itemBuilder: (context, index) {
                final friends = friendsList[index];
                return buildUserItem(friends: friends);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildUserItem({required Friends friends}) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'images/profileImage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Black1Text(
                      'none',
                      16,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: AppColors.gray1,
              thickness: 1,
            )
          ],
        );
      },
    );
  }
}
