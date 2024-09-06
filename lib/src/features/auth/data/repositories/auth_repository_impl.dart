import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hnk_ask_ai/src/core/exceptions/failure.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final _googleSignIn = GoogleSignIn();

  AuthRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    await _firebaseAuth.currentUser?.reload();
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
