import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;

  ToDo({required this.title, required this.content});
}
