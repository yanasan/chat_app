import 'package:chat_app/controllers/splash_page_controller/splash_page_controller.dart';
import 'package:chat_app/ui/pages/root_page/root_page.dart';
import 'package:chat_app/ui/themes/app_colors.dart';
import 'package:chat_app/ui/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen<bool?>(splashPageProvider.select((s) => s.isFirstLaunch),
            (_, isFirstLaunch) {
          if (isFirstLaunch == true) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const Rootpage(),
            //   ),
            // );
          }
          if (isFirstLaunch == false) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const Rootpage(),
            //   ),
            // );
          }
        });
        return Scaffold(
          backgroundColor: AppColors.primaly,
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Rootpage(),
                  ),
                );
              },
              child: const WhiteText('ゲストで始める', 16),
            ),
          ),
        );
      },
    );
  }
}
