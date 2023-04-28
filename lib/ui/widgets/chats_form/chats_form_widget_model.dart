import 'package:flutter/material.dart';

class ChatsFormWidgetModel {
  var chatName = '';

  void saveChat(BuildContext context) {
    print(chatName);
  }

  void closeForm(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ChatsFormWidgetModelProvider extends InheritedWidget {
  final ChatsFormWidgetModel model;

  const ChatsFormWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
        );

  static ChatsFormWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChatsFormWidgetModelProvider>();
  }

  static ChatsFormWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChatsFormWidgetModelProvider>()
        ?.widget;
    return widget is ChatsFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(ChatsFormWidgetModelProvider oldWidget) {
    return false;
  }
}
