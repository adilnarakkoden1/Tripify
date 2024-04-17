import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tripify/models/memory_model.dart';

ValueNotifier<List<MemoryModel>> memorylist = ValueNotifier([]);

addMemory(MemoryModel memoryModel) async {
  final userBox = await Hive.openBox<MemoryModel>('memorydb');
  memoryModel.id = await userBox.add(memoryModel);
  userBox.put(memoryModel.id, memoryModel);
  memorylist.value.add(memoryModel);
  memorylist.notifyListeners();
  print('added succesflly');
}

Future<void> updateMemory() async {
  final userBox = await Hive.openBox<MemoryModel>('memorydb');
  memorylist.value.clear();
  memorylist.value.addAll(userBox.values);
  memorylist.notifyListeners();
}

//-----------------------delete--------------------------------
Future<void> deleteMemory(int id) async {
  final userBox = await Hive.openBox<MemoryModel>('memorydb');
  print(id);
  userBox.delete(id);
  print(userBox.values.length);
  //memorylist.value.clear();
  updateMemory();
}
