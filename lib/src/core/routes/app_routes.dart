import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/routes/routes_name.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/views/enter_infomation/enter_infomation_screen.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/views/photo/photo_screen.dart';

import '../../features/auth/presentation/views/login/login_screen.dart';
import '../../features/auth/presentation/views/sign_up/sign_up_screen.dart';
import '../../features/auth/presentation/views/welcome/welcome_screen.dart';
import '../../features/chat/presentation/views/chat/chat_screen.dart';
import '../../features/setting/presentation/views/setting/setting_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static final GoRouter routers = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: RoutesName.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.login}',
      name: RoutesName.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.signup}',
      name: RoutesName.signup,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.chat}',
      name: RoutesName.chat,
      builder: (context, state) => const ChatScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.setting}',
      name: RoutesName.setting,
      builder: (context, state) => const SettingScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.enterInfomation}',
      name: RoutesName.enterInfomation,
      builder: (context, state) => const EnterInfomationScreen(),
    ),
    GoRoute(
      path: '/${RoutesName.photo}',
      name: RoutesName.photo,
      builder: (context, state) => const PhotoScreen(),
    ),
  ]);
}
