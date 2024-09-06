// ignore_for_file: unused_local_variable

import '../../../core/common/services/in_memory_store_service.dart';
import '../../../core/exceptions/failure.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/firebase_auth_repository.dart';
import '../domain/user_model.dart';

class AuthService {
  final InMemoryStoreService<UserModel?> _authState =
      InMemoryStoreService<UserModel?>(null);
  Stream<UserModel?> authStateChanges() => _authState.stream;

  final FirebaseAuthRepository _firebaseAuthRepository;
  final AuthRepository _authRepository;

  AuthService({
    required FirebaseAuthRepository firebaseAuthRepository,
    required AuthRepository authRepository,
  })  : _firebaseAuthRepository = firebaseAuthRepository,
        _authRepository = authRepository;

  void dispose() => _authState.close();

  void saveProfileInApp(UserModel user) {
    _authState.value = user;
  }

  Future<void> getProfileFromFirestore({required String userId}) async {
    try {
      final user =
          await _firebaseAuthRepository.getProfileFromFirestore(userId: userId);
      saveProfileInApp(user);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> saveProfileToFirestore({required UserModel user}) async {
    try {
      await _firebaseAuthRepository.saveProfileToFirestore(user: user);
      saveProfileInApp(user);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final userCredential =
          await _authRepository.login(email: email, password: password);
      await getProfileFromFirestore(userId: userCredential.user!.uid);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final userCredential =
          await _authRepository.signUp(email: email, password: password);
      final user = UserModel(
        id: userCredential.user!.uid,
        imageUrl: '',
        email: email,
        firstName: '',
        lastName: '',
        createdAt: DateTime.now(),
        authBy: 'Email',
      );
      await saveProfileToFirestore(user: user);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final userCredential = await _authRepository.signInWithGoogle();
      final user = UserModel(
        id: userCredential.user!.uid,
        imageUrl: userCredential.user!.photoURL,
        email: userCredential.user!.email ?? '',
        firstName: userCredential.user!.displayName ?? '',
        lastName: '',
        createdAt: DateTime.now(),
        authBy: 'Google',
      );
      try {
        await getProfileFromFirestore(userId: user.id);
      } catch (e) {
        await saveProfileToFirestore(user: user);
      }
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      _authState.value = null;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  Future<void> enterInformation(
      {required String firstName, required String lastName}) async {
    try {
      final user = _authState.value!.copyWith(
        firstName: firstName,
        lastName: lastName,
      );
      await saveProfileToFirestore(user: user);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }
}
