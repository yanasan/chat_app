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

  Future<User?> fetchUser({required String id}) async {
    final docSnapshot = await _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id)
        .get();

    final data = docSnapshot.data();
    if (data != null) {
      return User.fromJson(data);
    } else {
      return null;
    }
  }

  Future<void> updateUser({required User user}) async {
    await _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(user.id)
        .update({
      ...user.toJson(),
    });
  }
}
