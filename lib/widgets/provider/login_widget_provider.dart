import 'package:flutter/material.dart';

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

class LoginWidgetModel extends ChangeNotifier {
  // String? _login;
  String? _login = 'admin@mail.ru'; // For testing only!
  String? _errorText;
  bool? _isError;

  set login(String value) {
    _login = value;
    _isError = false;

    notifyListeners();
  }

  String? get errorText {
    return _errorText;
  }

  bool? get isError {
    return _isError;
  }

  String get login {
    return _login ?? '';
  }

  void goToPasswordScreen(BuildContext context) {
    final login = _login;

    if (login == 'admin@mail.ru') {
      _errorText = null;
      _isError = false;

      Navigator.of(context).pushNamed('/password', arguments: _login);
    } else if (login == '' || login == null) {
      _errorText = 'Не указана почта';
      _isError = true;
      print('Пустое поле ввода');
    } else {
      _errorText = 'Неверный адрес почты';
      _isError = true;
      print('Ошибка при вводе почты');
    }

    notifyListeners();
  }

  void goToSignInScreen() {
    print('Зарегистрироваться');
  }
}
