import 'package:chat_app/controllers/root_page_controller/root_page_controller.dart';
import 'package:chat_app/controllers/user_controller/user_controller.dart';
import 'package:chat_app/ui/pages/search_page/search_page.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home_page/home_page.dart';
import '../setting_page/setting_page.dart';

class Rootpage extends ConsumerWidget {
  const Rootpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.select((value) => value.user));
    final tabs = [
      const HomePage(),
      SearchPage(user: user),
      SettingPage(user: user),
    ];

    return Consumer(
      builder: (context, ref, child) {
        final tabIndex = ref.watch(rootPageProvider).tabIndex;
        final onTap = ref.read(rootPageProvider.notifier).onTabTap;
        return Scaffold(
          body: IndexedStack(index: tabIndex, children: tabs),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.white,
            backgroundColor: AppColors.primaly4,
            currentIndex: tabIndex,
            onTap: onTap,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'ホーム',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: '探す',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: '設定',
              ),
            ],
          ),
        );
      },
    );
  }
}
