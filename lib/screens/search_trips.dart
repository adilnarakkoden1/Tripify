import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/db_functioin/trips_db.dart';
import 'package:tripify/models/home_model.dart';
import 'package:tripify/screens/Category/view_trips.dart';
import 'package:tripify/screens/bottombar.dart';

class SearchTrips extends StatefulWidget {
  const SearchTrips({super.key});

  @override
  State<SearchTrips> createState() => _SearchTripsState();
}

class _SearchTripsState extends State<SearchTrips> {
  List<HomeModel> finduser = [];
  String enteredKeyword = '';

  @override
  void initState() {
    super.initState();
    finduser = tripslists.value;
  }

  void _runFilter(String enteredKeyword) {
    List<HomeModel> result = [];
    if (enteredKeyword.isEmpty) {
      result = tripslists.value;
    } else {
      result = tripslists.value
          .where((student) =>
              student.destination
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              student.source
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      finduser = result;
    });
  }

  void _sortTrips(String sortOption) {
    switch (sortOption) {
      case 'name':
        finduser.sort((a, b) => a.destination.compareTo(b.destination));
        break;
      case 'dateAscending':
        finduser.sort((a, b) => a.startdate.compareTo(b.startdate));
        break;
      case 'dateDes cending':
        finduser.sort((a, b) => b.startdate.compareTo(a.startdate));
        break;
      default:
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Trips',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: pimaryBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: TextField(
            onChanged: (value) {
              setState(() {
                enteredKeyword = value;
              });
              _runFilter(value);
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade300,
              labelText: 'Search',
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 222, 41, 41)),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22))),
            ),
          ),
        ),
        //=====================sorting/filter
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    onTap: () => _sortTrips('name'),
                    child: Text('Sort by Name (A-z)'),
                    value: 'name',
                  ),
                  // PopupMenuItem(
                  //   onTap: () {
                  //     _sortTrips('name');
                  //   },
                  //   child: Text('Sort by Name (z-A)'),
                  //   value: 'name',
                  // ),
                  PopupMenuItem(
                    onTap: () => _sortTrips('dateAscending'),
                    child: Row(
                      children: [
                        Text('Sort by Date '),
                        Icon(Icons.arrow_upward)
                      ],
                    ),
                    value: 'dateAscending',
                  ),
                  PopupMenuItem(
                    onTap: () => _sortTrips('dateDescending'),
                    child: Row(
                      children: [
                        Text('Sort by Date '),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                    value: 'dateDescending',
                  ),
                ];
              },
              onSelected: (value) {
                print('Selected: $value');
              },
              icon: const Icon(
                Icons.sort,
                color: Colors.black,
              ),
            )
          ],
        ),

        //=================================
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: tripslists,
            builder: (context, value, child) => ListView.builder(
              itemCount: finduser.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => ViewTrips(tripdetails: finduser[index]),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                    elevation: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                finduser[index].category == 'Business'
                                    ? Colors.orange
                                    : Colors.green,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(DateFormat('dd')
                                    .format(finduser[index].startdate)),
                                Text(DateFormat('MMM')
                                    .format(finduser[index].startdate)),
                                Text(DateFormat('yyyy')
                                    .format(finduser[index].startdate)),
                              ],
                            ),
                            radius: 40,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(finduser[index].destination,
                                    style: TextStyle(color: Colors.black)),
                                Text(DateFormat(' hh:mm a')
                                    .format(finduser[index].time)),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  _showMyDialog(value, index);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

Future<void> _showMyDialog(value, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete this trip?'),
          actions: [
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                deleteTrips(value[index].id!);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Bottom()));
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



















}
