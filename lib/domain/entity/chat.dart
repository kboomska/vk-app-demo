import 'package:hive_flutter/hive_flutter.dart';

part 'chat.g.dart';

@HiveType(typeId: 1)
class Chat {
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList? messages;

  Chat({
    required this.name,
  });
}
