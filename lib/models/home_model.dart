import 'package:hive/hive.dart';
part 'home_model.g.dart';

@HiveType(typeId: 1)
class HomeModel {
  @HiveField(0)
   int ? id;
  @HiveField(1)
  final String source;
  @HiveField(2)
  final String destination;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final DateTime startdate;
  @HiveField(5)
  final DateTime enddate;
  @HiveField(6)
  final String passenger;
  @HiveField(7)
  final DateTime time;
  @HiveField(8)
  final String category;
  @HiveField(9)
  bool favourite;

  HomeModel(
      {this.id,
      required this.source,
      required this.destination,
      required this.type,
      required this.startdate,
      required this.enddate,
      required this.passenger,
      required this.time,
      required this.category,
      required this.favourite});
}
