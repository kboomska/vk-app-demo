import 'package:flutter/material.dart';

import '/widgets/auth/password_widget.dart';
import 'widgets/auth/login_widget.dart';
import 'widgets/home/home_widget.dart';

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
        '/login': (context) => LoginWidget(),
        '/password': (context) => PasswordWidget(),
        '/home': (context) => HomeWidget(),
      },
      initialRoute: '/login',
    );
  }
}
