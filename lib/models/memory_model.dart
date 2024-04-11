import 'package:hive/hive.dart';
part 'memory_model.g.dart';
@HiveType(typeId: 5)
class MemoryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String details;
  @HiveField(2)
  List<String> imagePath;
  MemoryModel({this.id, required this.details, required this.imagePath});
}
