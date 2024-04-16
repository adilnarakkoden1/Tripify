import 'package:flutter/material.dart';
import 'package:tripify/screens/login.dart';
import 'package:tripify/screens/profile/aboutus.dart';
import 'package:tripify/screens/profile/contact.dart';
import 'package:tripify/screens/profile/privacy.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: Icon(Icons.logout)),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 120),
            child: Container(
              width: double.infinity,
              height: 120,
              alignment: Alignment.center,
              child: const Text(
                'Settings ',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Privacy(),
                          )),
                      child: Text('Privacy Policy'))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AboutView(),
                          )),
                      child: const Text('About Us'))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Contactus(),
                        ));
                      },
                      child: const Text('Contact Us'))),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('We will be redirected to login page.'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ],
        );
      },
    );
  }
}
