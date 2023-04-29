import 'package:hive_flutter/hive_flutter.dart';

import 'package:vk_app/domain/entity/message.dart';

part 'chat.g.dart';

@HiveType(typeId: 1)
class Chat extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<Message>? messages;

  Chat({
    required this.name,
  });

  void addMessage(Box<Message> box, Message message) {
    messages ??= HiveList(box);
    messages?.add(message);
    save();
  }
}
