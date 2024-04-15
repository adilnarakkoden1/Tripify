import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tripify/models/home_model.dart';

ValueNotifier<List<HomeModel>> tripslists = ValueNotifier([]);

addTrip(HomeModel homeModel) async {
  try {
    final userBox = await Hive.openBox<HomeModel>('tripsdb');
    homeModel.id = await userBox.add(homeModel);
    userBox.put(homeModel.id, homeModel);
    tripslists.value.add(homeModel);
    tripslists.notifyListeners();
    print('added succesflly');
  } catch (e) {
    print('error $e');
  }
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

// Future<void> changeStatus() async {
//   final userBox = await Hive.openBox<HomeModel>('tripsdb');
//   userBox.values.map((element) {
//     if (element.startdate.day == DateTime.now().day &&
//         element.startdate.month == DateTime.now().month &&
//         element.startdate.year == DateTime.now().year) {
//       element.status = 'Ongoing';
//       editTrips(element);
      
//     } else if (element.startdate.day > DateTime.now().day &&
//         element.startdate.month > DateTime.now().month &&
//         element.startdate.year > DateTime.now().year) {
//       element.status = 'Upcoming';
//       editTrips(element);
//     } else {
//       element.status = 'Completed';
//       editTrips(element);
//     }
//   });

// }
