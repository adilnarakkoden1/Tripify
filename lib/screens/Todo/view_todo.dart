import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'To-do',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          // automaticallyImplyLeading: false,
          backgroundColor: pimaryBrown,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Expanded(
                  child: ListView.builder(
                      itemExtent: 100,
                      itemBuilder: (context, index) => Card(
                            child: Text('haaaaaai'),
                          ))),
            )
          ],
        ));
  }
}
