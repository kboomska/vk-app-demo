import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/domain/entity/chat.dart';

class ChatFormWidgetModel {
  var chatName = '';

  void saveChat(BuildContext context) async {
    if (chatName.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    final box = await Hive.openBox<Chat>('chats_box');

    final chat = Chat(name: chatName);

    await box.add(chat);

    closeForm(context);
  }

  void closeForm(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ChatsFormWidgetModelProvider extends InheritedWidget {
  final ChatFormWidgetModel model;

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
