import 'package:flutter/material.dart';

import 'package:vk_app/domain/data_provider/box_manager.dart';
import 'package:vk_app/domain/entity/message.dart';

class MessageFormWidgetModel {
  final int chatKey;
  var messageText = '';

  MessageFormWidgetModel({required this.chatKey});

  void saveMessage(BuildContext context) async {
    if (messageText.isEmpty) return;

    final message = Message(text: messageText);
    final box = await BoxManager.instance.openMessagesBox(chatKey);
    await box.add(message);
    // await BoxManager.instance.closeBox(box);

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
