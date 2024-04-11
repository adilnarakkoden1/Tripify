import 'package:hive/hive.dart';

Future<void> stuent() async {
  var userbox = Hive.openBox('mybox');
  var box = Hive.box('mybox');
  box.put('name', 'John Doe');
  box.get(1);
  box.getAt(2);

}
