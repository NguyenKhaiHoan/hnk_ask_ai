import 'package:hnk_ask_ai/src/features/auth/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/config.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // not to do
  }

  Future<void> login({required String email, required String password}) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authService.login(email: email, password: password));
  }

  Future<void> signUp({required String email, required String password}) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => authService.signUp(email: email, password: password));
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authService.signOut());
  }

  Future<void> signInWithGoogle() async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authService.signInWithGoogle());
  }

  Future<void> enterInformation(
      {required String firstName, required String lastName}) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return authService.enterInformation(
          firstName: firstName, lastName: lastName);
    });
  }
}

@Riverpod(keepAlive: true)
Stream<UserModel?> authStateChanges(AuthStateChangesRef ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges();
}
