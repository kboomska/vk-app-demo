import 'package:flutter/material.dart';

import 'package:vk_app/ui/widgets/auth/password/password_widget.dart';
import 'package:vk_app/ui/widgets/auth/login/login_widget.dart';
import 'package:vk_app/ui/widgets/home/home_widget.dart';

abstract class MainNavigationRouteNames {
  static const login = '/login';
  static const password = '/login/password';
  static const home = '/home';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.login;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.login: (context) => const LoginWidget(),
    MainNavigationRouteNames.password: (context) => const PasswordWidget(),
    MainNavigationRouteNames.home: (context) => const HomeWidget(),
  };
}
