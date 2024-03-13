import 'package:hive/hive.dart';
import 'package:tripify/models/user_model.dart';

addUser(UserModel userModel) async {
  final userBox = await Hive.openBox<UserModel>('usersdb');
  await userBox.add(userModel);
  print('added succesflly');
}







// ==============================checking db value exists or not==========================//
Future<UserModel?> getAdminByName(String name) async {
  final userBox = await Hive.openBox<UserModel>('usersdb');
  final adminEntry = userBox.values.firstWhere(
    (entry) {
      if (entry.username == name) {
        return true;
      } else {
        return false;
      }
    },
    // orElse: () => UserModel(username: '', password: ''),
  );

  return adminEntry;
  // }

  // return null;
}












// Future<bool> checkCredentials(String name, String password) async {
//   final userBox = await Hive.openBox<UserModel>('usersdb');
//   if (userBox.containsKey(name)) {
//     final adminEntry = userBox.get(name);
//     if (adminEntry != null && adminEntry.password == password) {
//       return true;
//     }
//   }

//   return false;
// }