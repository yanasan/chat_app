import 'dart:async';

import 'package:chat_app/models/friends.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireFriendsService {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setFrends({
    required String id,
    required String myId,
  }) async {
    final friends = Friends(
      id: id,
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
