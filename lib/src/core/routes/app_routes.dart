import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/routes/routes_name.dart';
import 'package:hnk_ask_ai/src/features/authentication/presentation/enter_infomation/enter_infomation_screen.dart';

import '../../features/authentication/presentation/login/login_screen.dart';
import '../../features/authentication/presentation/sign_up/sign_up_screen.dart';
import '../../features/authentication/presentation/welcome/welcome_screen.dart';
import '../../features/chat/presentation/chat/chat_screen.dart';
import '../../features/setting/presentation/setting/setting_screen.dart';

class AppRoutes {
  const AppRoutes._();

  static final GoRouter routers = GoRouter(routes: [
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
  ]);
}
