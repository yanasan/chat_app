import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/serach_page_controller/search_page_controller.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const WhiteText('友人追加ページ', 20),
        automaticallyImplyLeading: false,
      ),
      body: HookConsumer(
        builder: (context, ref, child) {
          final query = ref.watch(searchPageProvider).query;
          final id = ref.watch(userProvider).user.id;
          return FirestoreListView(
            query: query,
            itemBuilder:
                (BuildContext context, QueryDocumentSnapshot<dynamic> doc) {
              final data = doc.data();
              final user = User.fromJson(data);
              return user.id == id
                  ? Container()
                  : buildUserCard(
                      id: user.id,
                      name: user.name == '' ? 'Gest User' : user.name,
                      description: '私は食事することが好きです',
                    );
            },
          );
        },
      ),
    );
  }

  Widget buildUserCard({
    required String id,
    required String name,
    required String description,
  }) {
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
              buildCardTab(text: id, title: 'id'),
              buildCardTab(text: name, title: '名前'),
              buildCardTab(text: description, title: '紹介'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  final myId = ref.watch(userProvider).user.id;
                  ref
                      .watch(searchPageProvider.notifier)
                      .setFriend(id: id, myId: myId);
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
