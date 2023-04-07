import 'package:flutter/material.dart';

import 'widgets/main_screen/main_screen_widget.dart';
import '/widgets/auth/password_widget.dart';
import 'widgets/auth/auth_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VK App',
      routes: {
        '/login': (context) => AuthWidget(),
        '/password': (context) => PasswordWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      initialRoute: '/login',
    );
  }
}
