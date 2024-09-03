import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hnk_ask_ai/src/core/extensions/mappers/user_mapper_extension.dart';
import 'package:hnk_ask_ai/src/features/auth/data/dtos/user_dto.dart';
import 'package:hnk_ask_ai/src/features/auth/domain/user_model.dart';

import 'firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getProfileFromFirestore(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('Users').doc(userId).get();
      if (doc.exists) {
        final user = UserDto.fromJson(doc.data() as Map<String, dynamic>);
        return user.dtoMapperToModel(user);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveProfileToFirestore(UserModel user) async {
    final userDto = user.modelMapperToDto(user);
    try {
      await _firestore
          .collection('Users')
          .doc(userDto.id)
          .set(userDto.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
