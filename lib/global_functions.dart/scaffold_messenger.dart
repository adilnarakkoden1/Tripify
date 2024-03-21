import 'package:flutter/material.dart';

void message({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      content: Text(message, textAlign: TextAlign.center),
    ),
  );
}

void successMessage(
    {required BuildContext context, required String successMessage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 7, 218, 18),
      duration: const Duration(seconds: 2),
      content: Text(successMessage, textAlign: TextAlign.center),
    ),
  );
}
