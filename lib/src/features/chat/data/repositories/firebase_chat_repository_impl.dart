import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hnk_ask_ai/src/core/exceptions/failure.dart';
import 'package:hnk_ask_ai/src/features/chat/data/repositories/firebase_chat_repository.dart';
import 'package:hnk_ask_ai/src/features/chat/domain/message_model.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseChatRepositoryImpl implements FirebaseChatRepository {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  @override
  Future<String> pushImageToStorage({
    required XFile image,
    required String messageId,
  }) async {
    try {
      Reference ref = _storage.ref('images').child(messageId);
      TaskSnapshot snapshot = await ref.putFile(File(image.path));
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> saveMessageToFirestore(
      {required String userId, required MessageModel message}) async {
    final messageDto = message.modelMapperToDto(message);
    try {
      await _firestore
          .collection('Chats')
          .doc(userId)
          .collection('Messages')
          .doc(messageDto.id)
          .set(messageDto.toJson());
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
