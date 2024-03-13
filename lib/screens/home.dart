import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripify/db_functioin/trips_db.dart';
import 'package:tripify/global_functions.dart/functions.dart';
import 'package:tripify/screens/Category/home_holiday.dart';
import 'package:tripify/screens/Category/view_trips.dart';
import 'package:tripify/screens/notes.dart';
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
    // TODO: implement initState
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
              naviagetPush(context, const Notes());
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
                builder: (context, value, child) => ListView.builder(
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
                          child: Card(
                            elevation: 3,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CircleAvatar(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(value[index]
                                            .startdate
                                            .day
                                            .toString()),
                                        Text(value[index]
                                            .startdate
                                            .month
                                            .toString()),
                                        Text(value[index]
                                            .startdate
                                            .year
                                            .toString()),
                                      ],
                                    ),
                                    radius: 40,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Title(
                                            color: Colors.black,
                                            child: Text(value[index].source)),
                                        Text(DateFormat(' hh:mm a')
                                            .format(value[index].time)),


                                            //=============== < dd MMM yyyy hh:mm a >==============
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.black,
                                      )),
                                ],
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
}
