import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/db_functioin/trips_db.dart';
import 'package:tripify/screens/Category/view_trips.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: pimaryBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: tripslists,
          builder: (context, value, child) {
            List data = value
                .where((homemodel) => homemodel.favourite == true)
                .toList();
            if (data.isEmpty) {
              // Display a message when there are no favorites
              return Center(
                child: Text(
                  'No favourites to show!!',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.all(12),
                  color: const Color.fromARGB(255, 205, 162, 162),
                  child: ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewTrips(tripdetails: value[index]),
                        )),
                    title: Text(
                      data[index].source,
                      style: const TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      data[index].destination,
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Column(
                      children: [
                        Text(DateFormat(' dd MMM yyy')
                            .format(value[index].startdate)),
                        Text(DateFormat(' hh : m a').format(value[index].time)),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
