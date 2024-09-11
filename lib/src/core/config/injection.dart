import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hnk_ask_ai/src/core/config/firebase_options.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/auth/application/auth_service.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/data/repositories/firebase_auth_repository.dart';
import '../../features/auth/data/repositories/firebase_auth_repository_impl.dart';
import '../../features/chat/application/chat_service.dart';
import '../../features/chat/data/repositories/chat_repository.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/data/repositories/firebase_chat_repository.dart';
import '../../features/chat/data/repositories/firebase_chat_repository_impl.dart';
import '../../features/photo/application/photo_service.dart';
import '../../features/photo/data/apis/lorem_picsum_api_service.dart';
import '../../features/photo/data/apis/lorem_picsum_api_service_impl.dart';
import '../../features/photo/data/apis/retrofit_lorem_picsum_api.dart';
import '../../features/photo/data/repositories/photo_repository.dart';
import '../../features/photo/data/repositories/photo_repository_impl.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setup();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate();
  }
}

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return dio;
  });

  sl.registerLazySingleton<RetrofitPhotoApi>(() => RetrofitPhotoApi(sl<Dio>()));

  sl.registerLazySingleton<LoremPicsumApiService>(() =>
      LoremPicsumApiServiceImpl(retrofitPhotoApi: sl<RetrofitPhotoApi>()));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl<FirebaseAuth>()));

  sl.registerLazySingleton<FirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl());

  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl());

  sl.registerLazySingleton<FirebaseChatRepository>(
      () => FirebaseChatRepositoryImpl());

  sl.registerLazySingleton<PhotoRepository>(() =>
      PhotoRepositoryImpl(loremPicsumApiService: sl<LoremPicsumApiService>()));

  sl.registerLazySingleton<AuthService>(() => AuthService(
        firebaseAuthRepository: sl<FirebaseAuthRepository>(),
        authRepository: sl<AuthRepository>(),
      ));

  sl.registerLazySingleton<ChatService>(() => ChatService(
        firebaseChatRepository: sl<FirebaseChatRepository>(),
        chatRepository: sl<ChatRepository>(),
        firebaseAuth: sl<FirebaseAuth>(),
      ));

  sl.registerLazySingleton<PhotoService>(
      () => PhotoService(photoRepository: sl<PhotoRepository>()));
}
