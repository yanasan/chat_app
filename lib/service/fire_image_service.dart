import 'dart:io';

import 'package:chat_app/models/fire_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FireImagesService {
  final _storage = FirebaseStorage.instance;

  Future<FireImage> upload({
    required String userId,
    required File file,
  }) async {
    final ref = _storage
        .ref()
        .child('uploads')
        .child('users')
        .child(userId)
        .child('${const Uuid().v4()}.jpg');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    return FireImage(ref: ref.fullPath, url: url);
  }
}
