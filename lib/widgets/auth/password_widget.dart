import 'package:flutter/material.dart';

import '/theme/app_button_style.dart';
import '/theme/app_text_field.dart';
import '/theme/app_colors.dart';
import '/theme/icon_id.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        iconTheme: const IconThemeData(color: AppColors.iconBlue),
        centerTitle: true,
        elevation: 0.0,
        title: IconID.small,
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: const _HeaderOfPasswordWidget(),
    );
  }
}

class _HeaderOfPasswordWidget extends StatelessWidget {
  const _HeaderOfPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String login = ModalRoute.of(context)!.settings.arguments as String;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
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
          FittedBox(
            child: Text(
              login,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const _FormOfPasswordWidget(),
        ],
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
  final _passwordTextController = TextEditingController(text: 'admin');

  String? errorText;
  bool isError = false;
  bool isContinue = false;

  @override
  void initState() {
    super.initState();
    if (_passwordTextController.text != '') {
      isContinue = true;
    }
  }

  void _password() {
    final password = _passwordTextController.text;

    if (password == 'admin') {
      errorText = null;
      isError = false;

      // Navigator.of(context).pushReplacementNamed('/main_screen');
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/main_screen', ModalRoute.withName('/auth'));
    } else {
      errorText = 'Неверный пароль, проверьте правильность введенных данных';
      isError = true;
      print('Ошибка при вводе пароля');
    }
    setState(() {});
  }

  void _forgottenPassword() {
    print('Забыли пароль?');
  }

  void textFieldCheckError(String text) {
    isError = false;
    errorText = null;

    if (text == '') {
      isContinue = false;
    } else {
      isContinue = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    final isError = this.isError;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: TextField(
              controller: _passwordTextController,
              style: const TextStyle(
                fontSize: 16,
              ),
              cursorColor: AppColors.logoBlue,
              cursorHeight: 20,
              obscureText: true,
              onChanged: (text) => textFieldCheckError(text),
              decoration: AppTextField.inputDecoration(
                hintText: 'Введите пароль',
                isError: isError,
              ),
            ),
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
      ),
    );
  }
}
