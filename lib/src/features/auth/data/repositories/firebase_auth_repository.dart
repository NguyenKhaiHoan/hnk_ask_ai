import 'package:hnk_ask_ai/src/features/auth/domain/user_model.dart';

abstract class FirebaseAuthRepository {
  Future<UserModel> getProfileFromFirestore({required String userId});
  Future<void> saveProfileToFirestore({required UserModel user});
}
