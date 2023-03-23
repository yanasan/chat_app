import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireChatService {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> createChatRoom({required List<String> member}) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .doc();

    final chat = Chat(
      update: DateTime.now(),
      member: member,
      roomId: snapshot.id,
    );

    await snapshot.set({...chat.toJson()});
  }

  Future<List<Chat>> fetchChatList({required String myId}) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .where('member', arrayContains: myId)
        .orderBy('update', descending: true);

    final data = await snapshot.get();

    final chat = data.docs.map((doc) {
      final data = doc.data();
      return Chat.fromJson(data);
    }).toList();

    return chat;
  }

  Future<List<Message>> fetchMessages({required String roomId}) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .doc(roomId)
        .collection('messages');

    final data = await snapshot.get();

    final message = data.docs.map((doc) {
      final data = doc.data();
      return Message.fromJson(data);
    }).toList();

    return message;
  }

  Future<Chat?> fetchChat({required String roomId}) async {
    final docSnapshot = await _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .doc(roomId)
        .get();

    final data = docSnapshot.data();
    if (data != null) {
      return Chat.fromJson(data);
    } else {
      return null;
    }
  }

  Future<void> sendMessage({
    required String roomId,
    required String userId,
    required String message,
  }) async {
    final snapshot = _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .doc(roomId)
        .collection('messages')
        .doc(userId);

    final messages = Message(
      created: DateTime.now(),
      userId: userId,
      message: message,
    );

    await snapshot.set({...messages.toJson()});
  }

  Future<void> removeChatRoom({required String roomId}) async {
    _fireStore
        .collection('commands')
        .doc('all')
        .collection('chatroom')
        .doc(roomId)
        .delete();
  }
}
