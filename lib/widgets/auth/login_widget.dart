import 'package:flutter/material.dart';

import '/widgets/provider/login_widget_provider.dart';
import '/theme/app_button_style.dart';
import '/theme/app_text_field.dart';
import '/theme/app_colors.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _model = LoginWidgetModel();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: LoginWidgetModelProvider(
          model: _model,
          child: Column(
            children: const [
              _HeaderOfLoginWidget(),
              SizedBox(height: 20),
              _FormOfLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderOfLoginWidget extends StatelessWidget {
  const _HeaderOfLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 52,
        ),
        SizedBox(
          height: 56,
          width: 56,
          child: DecoratedBox(
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
      ],
    );
  }
}

class _FormOfLoginWidget extends StatefulWidget {
  const _FormOfLoginWidget({super.key});

  @override
  State<_FormOfLoginWidget> createState() => _FormOfLoginWidgetState();
}

class _FormOfLoginWidgetState extends State<_FormOfLoginWidget> {
  final _loginTextController = TextEditingController(); // text: 'admin@mail.ru'

  @override
  Widget build(BuildContext context) {
    final errorText =
        LoginWidgetModelProvider.noticeOf(context)?.model.errorText;
    bool isError =
        LoginWidgetModelProvider.readOnly(context)?.model.isError ?? false;

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
            onChanged: (text) =>
                LoginWidgetModelProvider.noticeOf(context)?.model.login = text,
            decoration: AppTextField.inputDecoration(
              hintText: 'Введите почту',
              isError: isError,
              suffixIcon:
                  LoginWidgetModelProvider.readOnly(context)?.model.login == ''
                      ? null
                      : InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            LoginWidgetModelProvider.noticeOf(context)
                                ?.model
                                .login = '';
                            _loginTextController.text = '';
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
            onPressed: () => LoginWidgetModelProvider.readOnly(context)
                ?.model
                .goToPasswordScreen(context),
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
