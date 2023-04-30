import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/domain/entity/chat.dart';
import 'package:vk_app/domain/entity/message.dart';

class BoxManager {
  static final BoxManager instance = BoxManager._();

  BoxManager._();

  Future<Box<Chat>> openChatBox() async {
    return _openBox('chats_box', 1, ChatAdapter());
  }

  Future<Box<Message>> openMessagesBox() async {
    return _openBox('messages_box', 2, MessageAdapter());
  }

  Future<void> closeBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  Future<Box<T>> _openBox<T>(
    String name,
    int typeId,
    TypeAdapter<T> adapter,
  ) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }

    return Hive.openBox<T>(name);
  }
}
