import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tripify/screens/bottombar.dart';
import 'package:tripify/screens/login.dart';
import 'package:tripify/screens/onboard.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    //changeStatus();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Onboard()
            //  Onboard()
            ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 90,
              ),
              Container(
                width: 220,
                height: 80,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(159, 219, 206, 206)),
                child: const Text(
                  'TRIPIFY',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                child: Lottie.asset(
                  'assets/animations/trip1.json',
                  fit: BoxFit.contain,
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Your Travelling Partner',
                style: TextStyle(fontSize: 24),
              ),
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => Onboard()));
              //     },
              //     icon: Icon(Icons.abc))
            ],
          ),
        ));
  }
}
