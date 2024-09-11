import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth_service.dart';
import '../../domain/user_model.dart';
import '../states/auth_state.dart';

class AuthController extends Cubit<AuthState> {
  final AuthService authService;

  AuthController(this.authService) : super(const AuthState.initial());

  Stream<UserModel?> authStateChanges() {
    return authService.authStateChanges();
  }

  Future<void> login({required String email, required String password}) async {
    await authService.login(email: email, password: password);
  }

  Future<void> signUp({required String email, required String password}) async {
    await authService.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    await authService.signOut();
  }

  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
  }

  Future<void> enterInformation(
      {required String firstName, required String lastName}) async {
    authService.enterInformation(firstName: firstName, lastName: lastName);
  }
}
