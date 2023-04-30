import 'package:flutter/material.dart';

import 'package:vk_app/domain/data_provider/box_manager.dart';
import 'package:vk_app/domain/entity/chat.dart';

class ChatFormWidgetModel {
  var chatName = '';

  void saveChat(BuildContext context) async {
    if (chatName.isEmpty) return;

    final box = await BoxManager.instance.openChatBox();
    final chat = Chat(name: chatName);
    await box.add(chat);

    closeForm(context);
  }

  void closeForm(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ChatFormWidgetModelProvider extends InheritedWidget {
  final ChatFormWidgetModel model;

  const ChatFormWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
        );

  static ChatFormWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChatFormWidgetModelProvider>();
  }

  static ChatFormWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChatFormWidgetModelProvider>()
        ?.widget;
    return widget is ChatFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(ChatFormWidgetModelProvider oldWidget) {
    return false;
  }
}
