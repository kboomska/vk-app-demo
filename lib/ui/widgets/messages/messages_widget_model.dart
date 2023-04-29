import 'package:flutter/material.dart';

import 'package:vk_app/domain/entity/message.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vk_app/domain/entity/chat.dart';

class MessagesWidgetModel extends ChangeNotifier {
  final int chatKey;
  late final Future<Box<Chat>> _chatBox;
  var _messages = <Message>[];
  Chat? _chat;

  MessagesWidgetModel({required this.chatKey}) {
    _setup();
  }

  List<Message> get messages => _messages.toList();

  Chat? get chat => _chat;

  void _loadChat() async {
    final box = await _chatBox;

    _chat = box.get(chatKey);
    notifyListeners();
  }

  void _readMessages() {
    _messages = _chat?.messages ?? <Message>[];
    notifyListeners();
  }

  void _setupListenMessages() async {
    final box = await _chatBox;

    _readMessages();
    box.listenable(keys: [chatKey]).addListener(_readMessages);
  }

  void deleteMessage(int indexMessage) async {
    await _chat?.messages?.deleteFromHive(indexMessage);
    await _chat?.save();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    _chatBox = Hive.openBox<Chat>('chats_box');

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(MessageAdapter());
    }

    await Hive.openBox<Message>('messages_box');

    _loadChat();
    _setupListenMessages();
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
