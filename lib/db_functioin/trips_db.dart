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

// Future<void> addTrip(HomeModel homeModel) async {
//   try {
//     final userBox = await Hive.openBox<HomeModel>('tripsdb');
//     await userBox.add(homeModel);
//     userBox.close(); // Close the box after use to release resources

//     if (!tripslists.value.contains(homeModel)) {
//       tripslists.value.add(homeModel);
//       tripslists.notifyListeners();
//       print('Added successfully');
//     } else {
//       print('Trip already exists');
//     }
//   } catch (e) {
//     print('Error adding trip: $e');
//   }
// }
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
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  userBox.put(value.id, value);
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
