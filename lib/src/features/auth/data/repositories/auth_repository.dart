import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> login(String email, String password);
  Future<UserCredential> signInWithGoogle();
  Future<void> signOut();
}
