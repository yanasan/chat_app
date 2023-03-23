import 'package:chat_app/controllers/home_page_controller/home_page_controller.dart';
import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/user.dart';
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
          final friendsData =
              ref.watch(homePageProvider.select((value) => value.friendsData));

          final chatList =
              ref.watch(homePageProvider.select((value) => value.chatList));

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(homePageProvider.notifier).featchHomePaga();
            },
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final roomId = chatList[index].roomId;
                final userData = friendsData[index];
                return buildUserItem(userData: userData, roomId: roomId);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildUserItem({
    required User userData,
    required String roomId,
  }) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        user: userData,
                        roomId: roomId,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: userData.profileImage.url.isEmpty
                            ? Image.asset(
                                'images/profileImage.png',
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                userData.profileImage.url,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Black1Text(
                      userData.name.isEmpty ? 'ゲスト' : userData.name,
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
