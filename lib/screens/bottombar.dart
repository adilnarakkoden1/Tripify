import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/screens/favourite_trips.dart';
import 'package:tripify/screens/home.dart';
import 'package:tripify/screens/memories.dart';
import 'package:tripify/screens/profile/profile.dart';
import 'package:tripify/screens/search_trips.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

List<Widget?> _body = [
  Profile(),
  Favourites(),
  Home(),
  SearchTrips(),
  Memories(),
];
int _currentIndex = 2;

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        backgroundColor: Colors.amberAccent,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: pimaryBrown,
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: pimaryBrown,
            icon: Icon(Icons.favorite_outline),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            backgroundColor: pimaryBrown,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: pimaryBrown,
            icon: Icon(Icons.travel_explore),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            backgroundColor: pimaryBrown,
            icon: Icon(Icons.camera_alt_rounded),
            label: 'Memories',
          ),
        ],
      ),
    );
  }
}
