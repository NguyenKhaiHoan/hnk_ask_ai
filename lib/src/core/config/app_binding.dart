part of 'injection.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    Get.lazyPut(() => RetrofitPhotoApi(dio));
    Get.lazyPut<LoremPicsumApiService>(
        () => LoremPicsumApiServiceImpl(retrofitPhotoApi: Get.find()));
    Get.lazyPut(() => FirebaseAuth.instance);
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(firebaseAuth: Get.find()));
    Get.lazyPut<FirebaseAuthRepository>(() => FirebaseAuthRepositoryImpl());
    Get.lazyPut<ChatRepository>(() => ChatRepositoryImpl());
    Get.lazyPut<FirebaseChatRepository>(() => FirebaseChatRepositoryImpl());
    Get.lazyPut<PhotoRepository>(
        () => PhotoRepositoryImpl(loremPicsumApiService: Get.find()));
    Get.lazyPut(() => AuthService(
          firebaseAuthRepository: Get.find(),
          authRepository: Get.find(),
        ));
    Get.lazyPut(
      () => ChatService(
        firebaseChatRepository: Get.find(),
        chatRepository: Get.find(),
        firebaseAuth: Get.find(),
      ),
    );
    Get.lazyPut(() => PhotoService(photoRepository: Get.find()));

    // controller
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => EnterInfomationScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => ChatDrawerController());
    Get.lazyPut(() => ChatFieldController());
    Get.lazyPut(() => ChatScreenController());
    Get.lazyPut(() => ListMessageController());
    Get.lazyPut(() => PhotoScreenController());
  }
}
