import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/ui/navigation/main_navigation.dart';
import 'package:vk_app/domain/entity/message.dart';
import 'package:vk_app/domain/entity/chat.dart';

class ChatsWidgetModel extends ChangeNotifier {
  var _chats = <Chat>[];

  ChatsWidgetModel() {
    _setup();
  }

  List<Chat> get chats => _chats.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.chatForm);
  }

  void showMessages(BuildContext context, int indexChat) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    final box = await Hive.openBox<Chat>('chats_box');

    final chatKey = box.keyAt(indexChat) as int;

    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.messages, arguments: chatKey);
  }

  void deleteChat(int indexChat) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    final box = await Hive.openBox<Chat>('chats_box');

    await box.getAt(indexChat)?.messages?.deleteAllFromHive();
    await box.deleteAt(indexChat);
  }

  void _readChatsFromHive(Box<Chat> box) {
    _chats = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ChatAdapter());
    }

    final box = await Hive.openBox<Chat>('chats_box');

    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(MessageAdapter());
    }

    await Hive.openBox<Message>('messages_box');

    _readChatsFromHive(box);

    box.listenable().addListener(() => _readChatsFromHive(box));
  }
}

class ChatsWidgetModelProvider extends InheritedNotifier {
  final ChatsWidgetModel model;

  const ChatsWidgetModelProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          notifier: model,
          child: child,
        );

  static ChatsWidgetModelProvider? noticeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChatsWidgetModelProvider>();
  }

  static ChatsWidgetModelProvider? readOnly(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChatsWidgetModelProvider>()
        ?.widget;
    return widget is ChatsWidgetModelProvider ? widget : null;
  }
}