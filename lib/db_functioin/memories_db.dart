
import 'package:hive/hive.dart';
import 'package:tripify/models/memories_model.dart';

// ValueNotifier<List<MemoryModel>> memorylist = ValueNotifier([]);

addMemory(MemoryModel memoryModel) async {
  final userBox = await Hive.openBox<MemoryModel>('memorydb');
  memoryModel.id = await userBox.add(memoryModel);
  userBox.put(memoryModel.id, memoryModel);

  print('added succesflly');
}
