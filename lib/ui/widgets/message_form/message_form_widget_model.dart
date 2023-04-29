import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/domain/entity/message.dart';
import 'package:vk_app/domain/entity/chat.dart';

class MessageFormWidgetModel {
  final int chatKey;
  var messageText = '';

  MessageFormWidgetModel({required this.chatKey});

  void saveMessage(BuildContext context) async {
    if (messageText.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(MessageAdapter());
    }

    final messagesBox = await Hive.openBox<Message>('messages_box');
    final message = Message(text: messageText);
    await messagesBox.add(message);

    final chatsBox = await Hive.openBox<Chat>('chats_box');
    final chat = chatsBox.get(chatKey);
    chat?.addMessage(messagesBox, message);

    // closeForm(context);
    messageText = '';
  }

  void closeForm(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class MessageFormWidgetModelProvider extends InheritedWidget {
  final MessageFormWidgetModel model;

  const MessageFormWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
        );

  static MessageFormWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MessageFormWidgetModelProvider>();
  }

  static MessageFormWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            MessageFormWidgetModelProvider>()
        ?.widget;
    return widget is MessageFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(MessageFormWidgetModelProvider oldWidget) {
    return false;
  }
}
