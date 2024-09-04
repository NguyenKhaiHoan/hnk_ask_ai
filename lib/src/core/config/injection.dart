import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hnk_ask_ai/src/core/config/firebase_options.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

part 'injection.g.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

@riverpod
RetrofitPhotoApi retrofitPhotoApi(RetrofitPhotoApiRef ref) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return RetrofitPhotoApi(dio);
}

@riverpod
LoremPicsumApiService loremPicsumApiService(LoremPicsumApiServiceRef ref) {
  final retrofitPhotoApi = ref.read(retrofitPhotoApiProvider);
  return LoremPicsumApiServiceImpl(retrofitPhotoApi: retrofitPhotoApi);
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepositoryImpl(firebaseAuth: firebaseAuth);
}

@riverpod
FirebaseAuthRepository firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  return FirebaseAuthRepositoryImpl();
}

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepositoryImpl();
}

@Riverpod(keepAlive: true)
FirebaseChatRepository firebaseChatRepository(FirebaseChatRepositoryRef ref) {
  return FirebaseChatRepositoryImpl();
}

@riverpod
PhotoRepository photoRepository(PhotoRepositoryRef ref) {
  final loremPicsumApiService = ref.read(loremPicsumApiServiceProvider);
  return PhotoRepositoryImpl(loremPicsumApiService: loremPicsumApiService);
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  final firebaseAuthRepository = ref.read(firebaseAuthRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthService(
    firebaseAuthRepository: firebaseAuthRepository,
    authRepository: authRepository,
  );
}

@Riverpod(keepAlive: true)
ChatService chatService(ChatServiceRef ref) {
  final firebaseChatRepository = ref.watch(firebaseChatRepositoryProvider);
  final chatRepository = ref.read(chatRepositoryProvider);
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return ChatService(
    firebaseChatRepository: firebaseChatRepository,
    chatRepository: chatRepository,
    firebaseAuth: firebaseAuth,
  );
}

@riverpod
PhotoService photoService(PhotoServiceRef ref) {
  final photoRepository = ref.read(photoRepositoryProvider);
  return PhotoService(photoRepository: photoRepository);
}

// // api
// final retrofitPhotoApiProvider = Provider<RetrofitPhotoApi>((ref) {
//   final dio = Dio();
//   dio.interceptors.add(PrettyDioLogger());
//   return RetrofitPhotoApi(
//     dio,
//   );
// });

// final loremPicsumApiServiceProvider = Provider<LoremPicsumApiService>((ref) {
//   final retrofitPhotoApi = ref.read(retrofitPhotoApiProvider);
//   return LoremPicsumApiServiceImpl(
//     retrofitPhotoApi: retrofitPhotoApi,
//   );
// });

// // firebase auth
// final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
//   return FirebaseAuth.instance;
// });

// // repository
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final firebaseAuth = ref.watch(firebaseAuthProvider);
//   return AuthRepositoryImpl(firebaseAuth: firebaseAuth);
// });

// final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
//   return FirebaseAuthRepositoryImpl();
// });

// final chatRepositoryProvider = Provider<ChatRepository>((ref) {
//   return ChatRepositoryImpl();
// });

// final firebaseChatRepositoryProvider = Provider<FirebaseChatRepository>((ref) {
//   return FirebaseChatRepositoryImpl();
// });

// final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
//   final loremPicsumApiService = ref.read(loremPicsumApiServiceProvider);
//   return PhotoRepositoryImpl(
//     loremPicsumApiService: loremPicsumApiService,
//   );
// });

// // service
// final authServiceProvider = Provider<AuthService>((ref) {
//   final firebaseAuthRepository = ref.read(firebaseAuthRepositoryProvider);
//   final authRepository = ref.watch(authRepositoryProvider);
//   return AuthService(
//     firebaseAuthRepository: firebaseAuthRepository,
//     authRepository: authRepository,
//   );
// });

// final chatServiceProvider = Provider<ChatService>((ref) {
//   final firebaseChatRepository = ref.watch(firebaseChatRepositoryProvider);
//   final chatRepository = ref.read(chatRepositoryProvider);
//   return ChatService(
//     firebaseChatRepository: firebaseChatRepository,
//     chatRepository: chatRepository,
//   );
// });

// final photoServiceProvider = Provider<PhotoService>((ref) {
//   final photoRepository = ref.read(photoRepositoryProvider);
//   return PhotoService(photoRepository: photoRepository);
// });
