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
        title: Text('To-do'),
        automaticallyImplyLeading: false,
        backgroundColor: pimaryBrown,
         shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delete),padding: EdgeInsets.only(left: 200),)
            ],
          ),
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
