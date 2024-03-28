import 'package:hive/hive.dart';
part 'memories_model.g.dart';
@HiveType(typeId: 2)
class MemoryModel {
  @HiveField(0)
  int ? id;
  @HiveField(1)
  final String imagex;
  @HiveField(2)
  final String details;

  MemoryModel({this.id ,required this.imagex, required this.details});
}
