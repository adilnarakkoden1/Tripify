import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';

class SearchTrips extends StatelessWidget {
  const SearchTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Trips',style: TextStyle(color: Colors.white),),
        backgroundColor: pimaryBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
    );
  }
}