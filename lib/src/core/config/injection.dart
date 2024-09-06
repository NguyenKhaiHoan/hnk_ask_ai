import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hnk_ask_ai/src/core/common/widgets/auth_buttons.dart';
import 'package:hnk_ask_ai/src/core/config/firebase_options.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/enter_infomation_screen_controller.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/login_screen_controller.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/controllers/sign_up_screen_controller.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/views/sign_up/sign_up_screen.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_drawer_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_field_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/chat_screen_controller.dart';
import 'package:hnk_ask_ai/src/features/chat/presentation/controllers/list_message_controller.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/controllers/photo_screen_controller.dart';
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

part 'app_binding.dart';

class DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
