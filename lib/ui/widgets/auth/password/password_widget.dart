import 'package:flutter/material.dart';

import 'package:vk_app/ui/widgets/auth/password/password_widget_model.dart';
import 'package:vk_app/theme/app_button_style.dart';
import 'package:vk_app/theme/app_text_field.dart';
import 'package:vk_app/theme/app_colors.dart';
import 'package:vk_app/theme/icon_id.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  PasswordWidgetModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final String login = ModalRoute.of(context)!.settings.arguments as String;
      _model = PasswordWidgetModel(login: login);
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: PasswordWidgetModelProvider(
          model: _model!,
          child: Column(
            children: const [
              _HeaderOfPasswordWidget(),
              SizedBox(height: 20),
              _FormOfPasswordWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderOfPasswordWidget extends StatelessWidget {
  const _HeaderOfPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = PasswordWidgetModelProvider.readOnly(context)!.model;

    return Column(
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
            model.login,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class _FormOfPasswordWidget extends StatelessWidget {
  const _FormOfPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _PasswordFormWidget(),
          _ForgottenPasswordButton(),
          Spacer(),
          _ContinueButton(),
        ],
      ),
    );
  }
}

class _PasswordFormWidget extends StatefulWidget {
  const _PasswordFormWidget({super.key});

  @override
  State<_PasswordFormWidget> createState() => __PasswordFormWidgetState();
}

class __PasswordFormWidgetState extends State<_PasswordFormWidget> {
  // final _passwordTextController = TextEditingController();
  final _passwordTextController =
      TextEditingController(text: 'admin'); // For testing only!

  @override
  Widget build(BuildContext context) {
    final observeModel = PasswordWidgetModelProvider.noticeOf(context)?.model;
    final readModel = PasswordWidgetModelProvider.readOnly(context)?.model;

    final errorText = observeModel?.errorText;
    final isError = readModel?.isError ?? false;
    bool isObscure = readModel?.isObscure ?? true;

    return Column(
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
            obscureText: isObscure,
            onChanged: (text) => readModel?.password = text,
            decoration: AppTextField.inputDecoration(
              hintText: 'Введите пароль',
              isError: isError,
              suffixIcon: readModel?.password == ''
                  ? null
                  : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        readModel?.obscureText();
                      },
                      child: isObscure
                          ? const Icon(
                              Icons.visibility,
                              color: AppColors.textFieldHint,
                              size: 16,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColors.textFieldHint,
                              size: 16,
                            ),
                    ),
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
      ],
    );
  }
}

class _ForgottenPasswordButton extends StatelessWidget {
  const _ForgottenPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: PasswordWidgetModelProvider.readOnly(context)
          ?.model
          .forgottenPassword,
      style: AppButtonStyle.linkStyleButton,
      child: const Text(
        'Забыли или не установили пароль?',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isContinue =
        PasswordWidgetModelProvider.noticeOf(context)?.model.isContinue ??
            false;

    return OutlinedButton(
      onPressed: isContinue
          ? () => PasswordWidgetModelProvider.readOnly(context)
              ?.model
              .goToHomeScreen(context)
          : null,
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
    );
  }
}
