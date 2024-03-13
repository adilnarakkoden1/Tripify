import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ViewTrips extends StatelessWidget {
  final tripdetails;
  const ViewTrips({super.key, this.tripdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                        padding: EdgeInsets.all(30),
                        child: Card(
                          color: Color.fromARGB(255, 158, 150, 150),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Text('Source :  ${tripdetails.source}',
                                    style: TextStyle(fontSize: 18)),
                                Text('Date :  ${tripdetails.time}',
                                    style: TextStyle(fontSize: 18)),
                                Text(
                                    'Destination :  ${tripdetails.destination}',
                                    style: TextStyle(fontSize: 18)),
                                Text('Passengers :  ${tripdetails.passenger}',
                                    style: TextStyle(fontSize: 18)),
                                Text('Mode of transport :  ${tripdetails.type}',
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                            radius: 40,
                            child: Column(
                              children: [
                                Text('${tripdetails.startdate.day.toString()}'),
                                Text(
                                    '${tripdetails.startdate.month.toString()}'),
                                Text(
                                    '${tripdetails.startdate.year.toString()}'),
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






//'''''''''''''''''''''''''
                          // Text('Destination :  ${tripdetails.time}',
                      //     style: TextStyle(fontSize: 23)),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Text('Passengers :  ${tripdetails.father}',
                      //     style: TextStyle(fontSize: 23)),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Text('Time :  ${tripdetails.pnumber}',
                      //     style: TextStyle(fontSize: 23)),