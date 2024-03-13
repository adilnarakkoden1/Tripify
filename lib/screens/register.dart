import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tripify/db_functioin/user_model_db.dart';
import 'package:tripify/global_functions.dart/scaffold_messenger.dart';
import 'package:tripify/models/user_model.dart';
import 'package:tripify/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor:const  Color(0xFFD9D9D9),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Lottie.asset(
                      'assets/animations/login2.json',
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),

                  //===============================================username=========================================================
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        } else if (!RegExp(r'^[a-zA-Z0-9_]+$')
                            .hasMatch(value)) {
                          return 'Username can only contain Alphabets';
                        } else if (value.length < 5) {
                          return 'Username should contain atleast 5 letters ';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          hintText: 'Username')),
                  const SizedBox(
                    height: 20,
                  ),

                  //========================password======================================================================
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      } else if (value.length < 5) {
                        return 'Password should contain atleast 5 digits';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Password'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  //============================================================confirm password=============================================
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Confirm password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        hintText: 'Confirm Password'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                        if (_usernameController.text.isNotEmpty ||
                            _passwordController.text.isNotEmpty) {
                          if (_passwordController.text.trim() !=
                              _confirmPasswordController.text.trim()) {
                            message(
                                context: context,
                                message: 'Password does not Match!!');
                          } else {
                            inRegister(context);
                            const sucMessage = 'Registered Successfully';
                            successMessage(context: context, successMessage: sucMessage);
                          }
                        } else {
                          message(
                              context: context,
                              message: 'Please provide your details!!');
                        }
                        }
                      },
                      child: const Text('REGISTER')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Already a User?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: const Text('Sign-In'))
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

  inRegister(BuildContext ctx)  {
    final userName = _usernameController.text.trim();
    final passWord = _passwordController.text.trim();

    final user = UserModel(username: userName, password: passWord);
    addUser(user);
    Navigator.of(context).push( MaterialPageRoute(builder: (ctx) => const Login()));
  }
}
