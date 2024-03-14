import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tripify/models/home_model.dart';

ValueNotifier<List<HomeModel>> tripslists = ValueNotifier([]);

addTrip(HomeModel homeModel) async {
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  await userBox.add(homeModel);
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
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  tripslists.value.clear();
  tripslists.value.addAll(userBox.values);
  tripslists.notifyListeners();
}

Future<void> editTrips(int id) async {}



//-----------------------delete--------------------------------
Future<void> deleteTrips(HomeModel data) async {
  final userBox = await Hive.openBox<HomeModel>('tripsdb');
  await userBox.delete(data.id);
}
