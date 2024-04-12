// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tripify/db_functioin/user_model_db.dart';
import 'package:tripify/global_functions.dart/scaffold_messenger.dart';
import 'package:tripify/models/user_model.dart';
import 'package:tripify/screens/bottombar.dart';
import 'package:tripify/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Lottie.asset(
                      'assets/animations/login2.json',
                      // Image
                      // decoration: BoxDecoration(color: Colors.amber),
                    ),
                  ),
                  const SizedBox(height: 60),

                  //============================================usernmae==========================================
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))))),
                  const SizedBox(
                    height: 20,
                  ),

                  //============================================//password//-==========-----------------------------------------
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        }
                      },
                      child: const Text('LOGIN')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Create a new Account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          },
                          child: const Text('Sign-Up'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLogin(BuildContext ctx) async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final UserModel? usermodel = await getAdminByName(username);
    if (UserModel != null && usermodel?.password == password) {
      print('Matched');

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const Bottom(),
        ),
      );

      const sucMessage = 'Logged in Successfully';
      successMessage(context: context, successMessage: sucMessage);
    } else {
      //==========//snackbarr============
      const errorMessage = 'Username and Password doesnot match!!';
      message(context: context, message: errorMessage);
    }
  }
}

