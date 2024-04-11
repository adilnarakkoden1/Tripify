import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tripify/screens/login.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
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
                  'assets/animations/trip2.json',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text('GET STARTED')),
            ],
          ),
        ));
  }
}
