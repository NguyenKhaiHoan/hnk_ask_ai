import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hnk_ask_ai/src/core/routes/routes_name.dart';
import 'package:hnk_ask_ai/src/features/auth/presentation/enter_infomation/enter_infomation_screen.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/favorite/favorite_screen.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/home/home_screen.dart';
import 'package:hnk_ask_ai/src/features/photo/presentation/main/main_screen.dart';

import '../../features/auth/presentation/login/login_screen.dart';
import '../../features/auth/presentation/sign_up/sign_up_screen.dart';
import '../../features/auth/presentation/welcome/welcome_screen.dart';
import '../../features/chat/presentation/chat/chat_screen.dart';
import '../../features/setting/presentation/setting/setting_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

class AppRoutes {
  const AppRoutes._();

  static final GoRouter routers =
      GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
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
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScreen(
          key: state.pageKey,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/${RoutesName.favorite}',
          name: RoutesName.favorite,
          builder: (context, state) => const FavoriteScreen(),
        ),
        GoRoute(
          path: '/${RoutesName.home}',
          name: RoutesName.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    )
  ]);
}
