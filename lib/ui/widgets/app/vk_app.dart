import 'package:flutter/material.dart';

import 'package:vk_app/ui/navigation/main_navigation.dart';

class VKApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const VKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK App',
      debugShowCheckedModeBanner: false,
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
