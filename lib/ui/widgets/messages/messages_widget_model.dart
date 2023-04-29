import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:vk_app/domain/entity/chat.dart';

class MessagesWidgetModel extends ChangeNotifier {
  final chatKey;
  late final Future<Box<Chat>> _chatBox;
  Chat? _chat;

  MessagesWidgetModel({required this.chatKey}) {
    _setup();
  }

  Chat? get chat => _chat;

  void _loadChat() async {
    final box = await _chatBox;

    _chat = box.get(chatKey);
    notifyListeners();
  }

  void _setup() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    _chatBox = Hive.openBox<Chat>('chats_box');
    _loadChat();
  }
}

class MessagesWidgetModelProvider extends InheritedNotifier {
  final MessagesWidgetModel model;

  const MessagesWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static MessagesWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MessagesWidgetModelProvider>();
  }

  static MessagesWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MessagesWidgetModelProvider>()
        ?.widget;
    return widget is MessagesWidgetModelProvider ? widget : null;
  }
}
