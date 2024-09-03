import 'package:hnk_ask_ai/src/features/auth/domain/user_model.dart';

abstract class FirebaseAuthRepository {
  Future<void> saveProfileToFirestore(UserModel user);
  Future<UserModel> getProfileFromFirestore(String userId);
}
