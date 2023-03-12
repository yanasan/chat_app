import 'package:chat_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireUserService {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> isExisted({required String id}) async {
    final docSnapshot = await _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id)
        .get();
    return docSnapshot.data() != null;
  }

  Future<void> createUser({required String id}) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .doc(id);

    final user = User(
      id: id,
    );

    await snapshot.set({...user.toJson()});
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

  Future<List<User>> fetchUserList({
    required String id,
  }) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('users')
        .where('id', whereNotIn: [id]);

    final data = await snapshot.get();

    final userList = data.docs.map((doc) {
      final data = doc.data();
      return User.fromJson(data);
    }).toList();

    return userList;
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
