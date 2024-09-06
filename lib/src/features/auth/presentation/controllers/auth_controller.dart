import 'package:get/get.dart';
import 'package:hnk_ask_ai/src/features/auth/application/auth_service.dart';
import 'package:hnk_ask_ai/src/features/auth/domain/user_model.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var userModel = UserModel(
    id: '',
    imageUrl: '',
    email: '',
    firstName: '',
    lastName: '',
    createdAt: DateTime.now(),
    authBy: '',
  );

  final authService = Get.find<AuthService>();

  Stream<UserModel?> authStateChanges() {
    return authService.authStateChanges();
  }

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    await authService.login(email: email, password: password);
    isLoading.value = false;
  }

  Future<void> signUp({required String email, required String password}) async {
    isLoading.value = true;
    await authService.signUp(email: email, password: password);
    isLoading.value = false;
  }

  Future<void> signOut() async {
    isLoading.value = true;
    await authService.signOut();
    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    await authService.signInWithGoogle();
    isLoading.value = false;
  }

  Future<void> enterInformation(
      {required String firstName, required String lastName}) async {
    isLoading.value = true;
    await authService.enterInformation(
        firstName: firstName, lastName: lastName);
    isLoading.value = false;
  }
}
