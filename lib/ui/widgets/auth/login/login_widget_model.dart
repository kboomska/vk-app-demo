import 'package:flutter/material.dart';

import 'package:vk_app/ui/navigation/main_navigation.dart';

class LoginWidgetModel extends ChangeNotifier {
  // String _login = '';
  String _login = 'admin@mail.ru'; // For testing only!
  String? _errorText;

  set login(String value) {
    _login = value;

    if (_errorText != null) {
      _errorText = null;
    }

    notifyListeners();
  }

  bool get isLogin => _login.isNotEmpty;

  String? get errorText {
    return _errorText;
  }

  void goToPasswordScreen(BuildContext context) {
    final login = _login;

    if (login == 'admin@mail.ru') {
      Navigator.of(context)
          .pushNamed(MainNavigationRouteNames.password, arguments: login);
    } else if (login.isEmpty) {
      _errorText = 'Не указана почта';
      notifyListeners();
    } else {
      _errorText = 'Неверный адрес почты';
      notifyListeners();
    }
  }

  void goToSignInScreen() {
    print('Зарегистрироваться');
  }
}

class LoginWidgetModelProvider extends InheritedNotifier {
  final LoginWidgetModel model;

  const LoginWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static LoginWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginWidgetModelProvider>();
  }

  static LoginWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoginWidgetModelProvider>()
        ?.widget;
    return widget is LoginWidgetModelProvider ? widget : null;
  }
}
