import 'package:hive/hive.dart';
part 'todo_model.g.dart';
@HiveType(typeId: 3)
class TodoModel {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String description;

  @HiveField(2)
  late DateTime created;

  @HiveField(3)
  late bool completed;

  TodoModel({required this.title, required this.description, required this.created, required this.completed});
}
