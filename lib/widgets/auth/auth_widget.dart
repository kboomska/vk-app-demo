import 'package:flutter/material.dart';

import '/theme/app_button_style.dart';
import '/theme/app_text_field.dart';
import '/theme/app_colors.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 48,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.logoBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text(
                'VK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Вход ВКонтакте',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _FormWidget(),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              print('Зарегистрироваться');
            },
            style: AppButtonStyle.greenStyleButton,
            child: const Text(
              'Зарегистрироваться',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // AppTextField formDecoration = AppTextField.inputDecoration(hintText: 'Введите почту');

  String? errorText = null;
  bool isNegative = false;

  void _login() {
    final login = _loginTextController.text;

    if (login == 'admin') {
      errorText = null;
      isNegative = false;
      print('Войти');
    } else if (login == '') {
      errorText = 'Не указана почта';
      isNegative = true;
      print('Пустое поле ввода');
    } else {
      errorText = 'Неверный адрес почты';
      isNegative = true;
      print('Ошибка при вводе почты');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    final isNegative = this.isNegative;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _loginTextController,
          style: const TextStyle(
            fontSize: 16,
          ),
          cursorColor: AppColors.logoBlue,
          cursorHeight: 20,
          decoration: AppTextField.inputDecoration(
            hintText: 'Введите почту',
            isNegative: isNegative,
          ),
        ),
        if (errorText != null) ...[
          SizedBox(
            height: 8,
          ),
          Text(
            errorText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ],
        const SizedBox(
          height: 20,
        ),
        OutlinedButton(
          onPressed: _login,
          style: AppButtonStyle.blueStyleButton,
          child: const Text(
            'Войти',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
