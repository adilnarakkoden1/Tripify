import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';

class MemoryView extends StatefulWidget {
  List<String> imagePath;
  MemoryView({super.key, required this.imagePath});

  @override
  State<MemoryView> createState() => _MemoryViewState();
}

class _MemoryViewState extends State<MemoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pimaryBrown,
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: widget.imagePath.length,
          itemBuilder: (context, index) => Container(
            child: Image.file(File(widget.imagePath[index])),
          ),
        ),
      ),
    );
  }
}





//=====================try



