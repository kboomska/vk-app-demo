import 'package:flutter/material.dart';

import 'package:vk_app/ui/widgets/auth/password/password_widget.dart';
import 'package:vk_app/ui/widgets/chats_form/chats_form_widget.dart';
import 'package:vk_app/ui/widgets/auth/login/login_widget.dart';
import 'package:vk_app/ui/widgets/home/home_widget.dart';

abstract class MainNavigationRouteNames {
  static const login = 'login';
  static const password = 'login/password';
  static const home = 'home';
  static const chatsForm = 'home/chatsForm';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.login;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.login: (context) => const LoginWidget(),
    MainNavigationRouteNames.home: (context) => const HomeWidget(),
    MainNavigationRouteNames.chatsForm: (context) => const ChatsFormWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.password:
        final login = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => PasswordWidget(login: login));
      default:
        const widget = Text('Navigation Error!');
        return MaterialPageRoute(
          builder: (context) => widget,
        );
    }
  }
}
