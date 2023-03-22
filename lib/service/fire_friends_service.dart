import 'dart:async';

import 'package:chat_app/models/friends.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireFriendsService {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> followUser({
    required String myId,
    required String someoneId,
  }) {
    return _fireStore.runTransaction((transaction) {
      final followDoc = _fireStore
          .collection('commands')
          .doc('all')
          .collection('users')
          .doc(myId)
          .collection('friends')
          .doc(someoneId);
      final followerDoc = _fireStore
          .collection('commands')
          .doc('all')
          .collection('users')
          .doc(someoneId)
          .collection('friends')
          .doc(myId);

      final follow = Friends(id: someoneId);
      final follower = Friends(id: myId);

      transaction
        ..set(followDoc, follow.toJson())
        ..set(followerDoc, follower.toJson());

      return Future(() => null);
    });
  }

  Future<void> removeFollowUser({
    required String myId,
    required String someoneId,
  }) {
    return _fireStore.runTransaction((transaction) {
      final followDoc = _fireStore
          .collection('commands')
          .doc('all')
          .collection('users')
          .doc(myId)
          .collection('friends')
          .doc(someoneId);
      final followerDoc = _fireStore
          .collection('commands')
          .doc('all')
          .collection('users')
          .doc(someoneId)
          .collection('friends')
          .doc(myId);
      transaction
        ..delete(followDoc)
        ..delete(followerDoc);

      return Future(() => null);
    });
  }

  Future<List<Friends>> getMyFriends({required String id}) async {
    final snapshot = _fireStore
        .collection("commands")
        .doc("all")
        .collection("users")
        .doc(id)
        .collection("friends");
    final data = await snapshot.get();
    final friendsList = data.docs.map((doc) {
      final data = doc.data();
      return Friends.fromJson(data);
    }).toList();

    return friendsList;
  }

  Future<bool> isFriendsExists({
    required String myId,
    required String someoneId,
  }) async {
    final followSnapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(myId)
        .collection('friends')
        .doc(someoneId);

    final followerSnapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(someoneId)
        .collection('friends')
        .doc(myId);

    final followData = await followSnapshot.get();
    final followerData = await followerSnapshot.get();

    return followData.exists && followerData.exists;
  }
}
