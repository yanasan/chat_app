import 'package:chat_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireUserService {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setUser({
    required String id,
  }) async {
    final user = User(
      id: id,
    );
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id);

    await snapshot.set({...user.toJson()});
  }

  Future<void> getAllUser() async {
    final snapshot = await _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        snapshot.docs;

    documents;
  }
}
