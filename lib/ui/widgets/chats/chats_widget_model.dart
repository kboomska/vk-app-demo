import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/domain/data_provider/box_manager.dart';
import 'package:vk_app/ui/navigation/main_navigation.dart';
import 'package:vk_app/domain/entity/chat.dart';

class ChatsWidgetModel extends ChangeNotifier {
  late final Future<Box<Chat>> _box;
  var _chats = <Chat>[];

  ChatsWidgetModel() {
    _setup();
  }

  List<Chat> get chats => _chats.toList();

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.chatForm);
  }

  Future<void> showMessages(BuildContext context, int indexChat) async {
    final chatKey = (await _box).keyAt(indexChat) as int;

    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.messages, arguments: chatKey);
  }

  Future<void> deleteChat(int indexChat) async {
    final box = await _box;

    await box.getAt(indexChat)?.messages?.deleteAllFromHive();
    await box.deleteAt(indexChat);
  }

  Future<void> _readChatsFromHive() async {
    _chats = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openChatBox();

    await BoxManager.instance.openMessagesBox();

    await _readChatsFromHive();
    (await _box).listenable().addListener(_readChatsFromHive);
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
