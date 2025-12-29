import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/widgets/message_model.dart';

class ChatFirestoreService {
  final db = FirebaseFirestore.instance;

  Future<String> createChatSession(String userId, String title) async {
    final docRef = db.collection("chats").doc();
    await docRef.set({
      "id": docRef.id,
      "userId": userId,
      "title": title.length > 30 ? title.substring(0, 30) : title,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  Future<void> saveMessage(String chatId, MessageModel message) async {
    await db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toJson());
    await db.collection('chats').doc(chatId).update({
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
  Future<List<Map<String, dynamic>>> getHistory(String userId) async {
    final snap = await db
        .collection('chats')
        .where('userId', isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .get();
    return snap.docs.map((doc) => doc.data()).toList();
  }
  Future<List<MessageModel>> getMessages(String chatId) async {
    final snap = await db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .get();
    return snap.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();
  }
}



