import 'package:flutter/material.dart';

import 'package:vk_app/widgets/auth/password/password_widget.dart';
import 'package:vk_app/widgets/auth/login/login_widget.dart';
import 'package:vk_app/widgets/home/home_widget.dart';

class VKApp extends StatelessWidget {
  const VKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VK App',
      routes: {
        LoginWidget.path: (context) => const LoginWidget(),
        PasswordWidget.path: (context) => const PasswordWidget(),
        HomeWidget.path: (context) => const HomeWidget(),
      },
      initialRoute: LoginWidget.path,
    );
  }
}
