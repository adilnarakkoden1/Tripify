import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tripify/screens/bottombar.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Bottom()
            //  Onboard()
            ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD9D9D9),
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
                    color: Color.fromARGB(159, 175, 174, 174)),
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
