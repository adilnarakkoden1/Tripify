import 'package:flutter/material.dart';

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
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
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
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
            )),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 50,
                  child:
                      ElevatedButton(onPressed: null, child: Text('Dark Theme'))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: null, child: Text('Privacy Policy'))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child:
                      ElevatedButton(onPressed: null, child: Text('About Us'))),
            ],
          ),
        ),
      ),
    );
  }
}
