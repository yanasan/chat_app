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
        .collection('friends');

    await snapshot.add({...friends.toJson()});
  }

  Future<void> getMyFriends({required String id}) async {
    final snapshot = await _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id)
        .collection('friends')
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        snapshot.docs;

    documents;
  }
}
