import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/models/home_model.dart';
import 'package:tripify/models/memories_model.dart';
import 'package:tripify/models/user_model.dart';
import 'package:tripify/screens/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserModelAdapter().typeId)) {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(MemoryModelAdapter());
  }
    Hive.registerAdapter(HomeModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: pimaryBrown),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash1(),
    );
  }
}
