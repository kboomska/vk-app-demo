import 'package:flutter/material.dart';

import '/theme/app_button_style.dart';
import '/theme/app_text_field.dart';
import '/theme/app_colors.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _HeaderOfPasswordWidget(),
    );
  }
}

class _HeaderOfPasswordWidget extends StatelessWidget {
  const _HeaderOfPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 48,
      ),
      child: OverflowBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.logoBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'VK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'ID',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Введите пароль',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Укажите пароль, привязанный к почте',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textFieldHint,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'login@mail.ru.login@mail.ru',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _FormOfPasswordWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormOfPasswordWidget extends StatefulWidget {
  const _FormOfPasswordWidget({super.key});

  @override
  State<_FormOfPasswordWidget> createState() => __FormOfPasswordWidgetState();
}

class __FormOfPasswordWidgetState extends State<_FormOfPasswordWidget> {
  final _passwordTextController = TextEditingController();

  String? errorText = null;
  bool isNegative = false;
  bool isContinue = false;

  void _password() {
    final password = _passwordTextController.text;

    if (password == 'admin') {
      errorText = null;
      isNegative = false;

      print('Продолжить');
      // Navigator.of(context).pushNamed('/password');
    } else if (password == '') {
      errorText = 'Не введен пароль';
      isNegative = true;
      print('Пустое поле ввода пароля');
    } else {
      errorText = 'Неверный пароль, проверьте правильность введенных данных';
      isNegative = true;
      print('Ошибка при вводе пароля');
    }
    setState(() {});
  }

  void _forgottenPassword() {
    print('Забыли пароль?');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    final isNegative = this.isNegative;

    void textFieldChanged(String text) {
      if (text == '') {
        isContinue = false;
      } else {
        isContinue = true;
      }
      setState(() {});
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _passwordTextController,
          style: const TextStyle(
            fontSize: 16,
          ),
          cursorColor: AppColors.logoBlue,
          cursorHeight: 20,
          obscureText: true,
          onChanged: (text) => textFieldChanged(text),
          decoration: AppTextField.inputDecoration(
            hintText: 'Введите пароль',
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
        TextButton(
          onPressed: _forgottenPassword,
          style: AppButtonStyle.linkStyleButton,
          child: const Text(
            'Забыли или не установили пароль?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: isContinue ? _password : null,
          style: AppButtonStyle.blueStyleDeactivableButton(
            isActive: isContinue,
          ),
          child: const Text(
            'Продолжить',
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
