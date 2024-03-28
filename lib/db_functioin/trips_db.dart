import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tripify/models/home_model.dart';

ValueNotifier<List<HomeModel>> tripslists = ValueNotifier([]);

addTrip(HomeModel homeModel) async {
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  homeModel.id = await userBox.add(homeModel);
  userBox.put(homeModel.id, homeModel);
  tripslists.value.add(homeModel);
  tripslists.notifyListeners();
  print('added succesflly');
}

Future<void> updateTrips() async {
  try {
    final userBox = await Hive.openBox<HomeModel>('tripsdb');
    tripslists.value.clear();
    tripslists.value.addAll(userBox.values);
  } catch (e) {
    print(e);
  }

  tripslists.notifyListeners();
}

Future<void> editTrips(HomeModel value) async {
  print('reached edit');
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  await userBox.put(value.id, value);
  updateTrips();
  
}

//-----------------------delete--------------------------------
Future<void> deleteTrips(int id) async {
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  print(id);
  userBox.delete(id);
  print(userBox.values.length);
  updateTrips();
}
