import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingProfilePage {
  static Route<T> route<T>() {
    return MaterialPageRoute(
      builder: (_) => _SettingProfilePage(),
      settings: const RouteSettings(name: 'setting_profile_page'),
    );
  }
}

final _formKeyProvider =
    StateProvider.autoDispose<GlobalKey<FormState>?>((ref) => null);

class _SettingProfilePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
        ),
        title: const Text('プロフィール'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
