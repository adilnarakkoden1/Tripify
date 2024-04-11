// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/models/home_model.dart';

class ViewTrips extends StatelessWidget {
  HomeModel tripdetails;
  ViewTrips({super.key, required this.tripdetails});
  List<String> path = [
    'assets/images/dubai.jpg',
    'assets/images/alapuza.jpg',
    'assets/images/mysoor.webp',
    'assets/images/rohtang.webp',
    'assets/images/moonar.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: CarouselSlider(
                        items: List.generate(
                          path.length,
                          (index) => ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              path[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          height: 200,
                          autoPlay: true, // auto-play
                          autoPlayCurve: Curves.easeInOut,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 50),
                          autoPlayInterval:
                              const Duration(milliseconds: 1500), //
                          aspectRatio: 16 / 9, // aspet ratio
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        color: const Color.fromARGB(0, 223, 214, 214),
                        padding: const EdgeInsets.all(30),
                        child: Card(
                          color: const Color.fromARGB(255, 158, 150, 150),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                ListTile(
                                  title: const Text('Source'),
                                  trailing:
                                      Text(tripdetails.source, style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('Destination'),
                                  trailing: Text(tripdetails.destination,
                                      style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('Start Date'),
                                  trailing: Text(
                                      DateFormat('dd MMM yyyy')
                                          .format(tripdetails.startdate),
                                      style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('End Date'),
                                  trailing: Text(
                                      DateFormat('dd MMM yyyy')
                                          .format(tripdetails.enddate),
                                      style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('Passengers'),
                                  trailing: Text(tripdetails.passenger,
                                      style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('Transport Mode'),
                                  trailing:
                                      Text(tripdetails.type, style: robotoM),
                                ),
                                ListTile(
                                  title: const Text('Time'),
                                  trailing: Text(
                                      DateFormat(' hh:mm a').format(
                                        tripdetails.time,
                                      ),
                                      style: robotoM),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                            backgroundColor: tripdetails.category == 'Business'
                                ? Colors.orange
                                : Colors.green,
                            radius: 45,
                            child: Column(
                              children: [
                                Text(
                                    DateFormat('dd')
                                        .format(tripdetails.startdate),
                                    style: TextStyle(fontSize: 24)),
                                Text(
                                    DateFormat('MMM')
                                        .format(tripdetails.startdate),
                                    style: robotoM),
                                Text(
                                    DateFormat('yyyy')
                                        .format(tripdetails.startdate),
                                    style: robotoM),
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
