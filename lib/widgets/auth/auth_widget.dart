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
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.iconBlue),
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.appBackgroundColor,
      body: const _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 52,
          ),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.logoBlue,
              borderRadius: BorderRadius.circular(15),
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
            height: 16,
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
          const _FormWidget(),
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
  final _loginTextController = TextEditingController(text: 'admin@mail.ru');

  String? errorText;
  bool isError = false;

  void _login() {
    final login = _loginTextController.text;

    if (login == 'admin@mail.ru') {
      errorText = null;
      isError = false;

      Navigator.of(context).pushNamed('/password', arguments: login);
    } else if (login == '') {
      errorText = 'Не указана почта';
      isError = true;
      print('Пустое поле ввода');
    } else {
      errorText = 'Неверный адрес почты';
      isError = true;
      print('Ошибка при вводе почты');
    }
    setState(() {});
  }

  void textFieldCheckError(String text) {
    isError = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    bool isError = this.isError;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _loginTextController,
            style: const TextStyle(
              fontSize: 16,
            ),
            cursorColor: AppColors.logoBlue,
            cursorHeight: 20,
            onChanged: (text) => textFieldCheckError(text),
            decoration: AppTextField.inputDecoration(
              hintText: 'Введите почту',
              isError: isError,
              suffixIcon: _loginTextController.text == ''
                  ? null
                  : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _loginTextController.text = '';
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.highlight_off,
                        color: AppColors.textFieldHint,
                        size: 16,
                      ),
                    ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          if (errorText != null && isError) ...[
            const SizedBox(
              height: 8,
            ),
            Text(
              errorText,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textFieldErrorText,
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
