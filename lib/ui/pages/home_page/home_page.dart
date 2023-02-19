import 'package:chat_app/controllers/home_page_controller/home_page_controller.dart';
import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/friends.dart';
import 'package:chat_app/ui/pages/chat_page/chat_page.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterfire_ui/firestore.dart';
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
      body: HookConsumer(
        builder: (context, ref, child) {
          final userId =
              ref.watch(userProvider.select((value) => value.user.id));
          useEffect(
            () {
              ref.read(homePageProvider.notifier).getFriends(userId: userId);
              return null;
            },
            const [],
          );

          final query = FirebaseFirestore.instance
              .collection('commands')
              .doc('all')
              .collection('users')
              .doc(userId)
              .collection('friends');

          final a = ref.watch(homePageProvider).friends;
          print(a);
          return FirestoreListView(
            query: query,
            itemBuilder:
                (BuildContext context, QueryDocumentSnapshot<dynamic> doc) {
              final data = doc.data();
              final friends = Friends.fromJson(data);
              return buildUserList(friends.id);
            },
          );
        },
      ),
    );
  }

  Widget buildUserList(String text) {
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(userProvider).user;
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
                    Black1Text(text, 16),
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
