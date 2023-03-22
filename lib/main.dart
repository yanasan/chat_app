import 'package:chat_app/preferences_manager.dart';
import 'package:chat_app/ui/pages/splash_page/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await _initializeFirebaseAuth();
  PreferencesManager().set(await SharedPreferences.getInstance());
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _initializeFirebaseAuth() async {
  await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user = firebaseAuth.currentUser;
  if (user == null) {
    await firebaseAuth.signInAnonymously();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }
}
