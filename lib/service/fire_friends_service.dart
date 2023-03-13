import 'dart:async';

import 'package:chat_app/models/friends.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireFriendsService {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setFriends({
    required String id,
    required String myId,
    required String name,
  }) async {
    final friends = Friends(
      id: id,
      name: name,
    );
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(myId)
        .collection('friends')
        .doc(id);

    await snapshot.set({...friends.toJson()});
  }

  Future<void> updateFriends({
    required String id,
    required String myId,
    required String name,
  }) async {
    final friends = Friends(
      name: name,
    );
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(myId)
        .collection('friends')
        .doc(id);

    await snapshot.update({...friends.toJson()});
  }

  Future<List<Friends>> getMyFriends({required String id}) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id)
        .collection('friends');

    final data = await snapshot.get();

    final friendsList = data.docs.map((doc) {
      final data = doc.data();
      return Friends.fromJson(data);
    }).toList();

    return friendsList;
  }
}
