import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tripify/db_functioin/trips_db.dart';
import 'package:tripify/global_functions.dart/functions.dart';
import 'package:tripify/screens/Category/add_holiday.dart';
import 'package:tripify/screens/Category/edit_trips.dart';
import 'package:tripify/screens/Category/view_trips.dart';
import 'package:tripify/screens/Todo/add_todo.dart';
import 'package:tripify/screens/bottombar.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int _currentIndex = 0;

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    updateTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              naviagetPush(context, const AddTodo());
            },
            icon: const Icon(
              Icons.note_add_outlined,
              size: 30.0,
            ),
            color: Colors.white,
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
                child: CarouselSlider(
                    items: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/dubai.jpg'),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/alapuza.jpg'),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/mysoor.webp',
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset('assets/images/rohtang.webp'),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset('assets/images/moonar.jpeg'),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true, // auto-play
                      autoPlayCurve: Curves.easeInOut,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 50),
                      autoPlayInterval: const Duration(
                          milliseconds:
                              1500), // Set the auto-play animation duration
                      aspectRatio: 16 / 9, // Set the aspe
                    )),
              ),

              //================================================================================
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: tripslists,
                builder: (context, value, child) => value.isEmpty
                    ? const Center(
                        child: Text(
                          'Please plan your trips!!',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemExtent: 100,
                        // padding: EdgeInsets.all(8),
                        itemCount: value.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) =>
                                      ViewTrips(tripdetails: value[index]),
                                ));
                              },
                              child: Slidable(
                                startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) =>
                                            _showMyDialog(value, index),
                                        // deleteTrips(value[index].id!),
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ]),
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EditHoliday(
                                                  triped: value[index]),
                                            )),
                                        // deleteTrips(value[index].id!),
                                        backgroundColor: const Color.fromARGB(
                                            255, 8, 170, 219),
                                        foregroundColor: Colors.white,
                                        icon: Icons.edit,
                                        label: 'Edit',
                                      ),
                                    ]),
                                child: Card(
                                  elevation: 3,
                                  child: SizedBox(
                                    height: 180,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                value[index].category ==
                                                        'Business'
                                                    ? Colors.orange
                                                    : Colors.green,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                FittedBox(
                                                  child: Text(
                                                    DateFormat('dd').format(
                                                        value[index].startdate),
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                  ),
                                                ),
                                                Text(DateFormat('MMM').format(
                                                    value[index].startdate)),
                                                Text(DateFormat('yyyy').format(
                                                    value[index].startdate)),

                                                //  Text(DateFormat(' hh:mm a')
                                                // .format(tripdetails.time,),style: robotoM),
                                              ],
                                            ),
                                            radius: 50,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Title(
                                                    color: Colors.black,
                                                    child: Text(value[index]
                                                        .destination)),
                                                Text(DateFormat('hh:mm a')
                                                    .format(value[index].time)),

                                                //=============== < dd MMM yyyy hh:mm a >==============
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                splashColor: Colors.red,
                                                onTap: () {
                                                  value[index].favourite =
                                                      !value[index].favourite;
                                                  editTrips(value[index]);
                                                },
                                                child: value[index].favourite
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        size: 30,
                                                        color: Colors.red,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        size: 30,
                                                        color: Colors.black,
                                                      ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
              )),
            ])),
      ),

      //===========================================bottom navvvvvvvvvvvvv
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeHoliday()));
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

//>>>>>>>>>>>>>>>>>>>>>>alert function>>>>>>>>>>>>>>>>

  Future<void> _showMyDialog(value, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to delete this trip?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Continue'),
              onPressed: () {
                deleteTrips(value[index].id!);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Bottom()));
              },
            ),
          ],
        );
      },
    );
  }
}
