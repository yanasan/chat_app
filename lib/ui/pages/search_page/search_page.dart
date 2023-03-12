import 'package:chat_app/models/user.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/serach_page_controller/search_page_controller.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const WhiteText('友人追加ページ', 20),
        automaticallyImplyLeading: false,
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          final userList =
              ref.watch(searchPageProvider.select((value) => value.userList));

          return RefreshIndicator(
            onRefresh: () async {
              ref.read(searchPageProvider.notifier).init();
            },
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final users = userList[index];
                return users.id == user.id
                    ? Container()
                    : buildUserCard(users: users);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildUserCard({required User users}) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaly4,
          ),
          child: Column(
            children: [
              buildCardTab(text: users.id, title: 'id'),
              buildCardTab(text: users.name, title: '名前'),
              buildCardTab(text: 'まだ', title: '紹介'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  ref
                      .watch(searchPageProvider.notifier)
                      .setFriend(id: users.id);
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primaly);
                },
                child: const Black1Text('友達追加', 16),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildCardTab({
    required String text,
    required String title,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        WhiteText(title, 12),
        const SizedBox(
          width: 20,
        ),
        WhiteText(text, 16),
      ],
    );
  }
}
