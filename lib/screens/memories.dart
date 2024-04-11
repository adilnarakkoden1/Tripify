import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tripify/db_functioin/memories_db.dart';
import 'package:tripify/models/memory_model.dart';
import 'package:tripify/screens/memory_view.dart';

class Memories extends StatefulWidget {
  const Memories({super.key});

  @override
  State<Memories> createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
  @override
  void initState() {
    updateMemory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Memories',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: pimaryBrown,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: memorylist,
        builder: (context, value, child) => GridView.builder(
          itemCount: value.length,
          physics: const RangeMaintainingScrollPhysics(
              parent: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast)),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 216, 213, 213),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MemoryView(imagePath: value[index].imagePath),
                        ));
                      },
                      icon: const Icon(
                        Icons.folder,
                        color: Colors.black,
                        size: 80,
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => _showAlertDialog(value, index),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    value[index].details,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        //backgroundColor: Color.fromARGB(255, 226, 111, 76),
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 4, 3, 2)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return const BOttomSheetScrollable();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //========================delete===========================
  void _showAlertDialog(value, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: const Text('Alert Dialog Title'),
          content: const Text('Do you want to delete this memory'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Handle the confirm action
                deleteMemory(value[index].id!);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class BOttomSheetScrollable extends StatefulWidget {
  const BOttomSheetScrollable({super.key});

  @override
  State<BOttomSheetScrollable> createState() => _BOttomSheetScrollableState();
}

class _BOttomSheetScrollableState extends State<BOttomSheetScrollable> {
  final _detailsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _imageFile;
  List<String> imagePath = [];
  bool _isImageSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: const BoxDecoration(
        color: Color.fromARGB(198, 204, 198, 177),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Text(
                  'Create your beautiful times',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        imagePath.length,
                        (index) => CircleAvatar(
                          radius: 50,
                          backgroundImage: imagePath.isNotEmpty
                              ? FileImage(File(imagePath[index]))
                              : const AssetImage('assets/images/dubai.jpg')
                                  as ImageProvider,
                        ),
                      ),
                      IconButton.filled(
                          onPressed: () {
                            _showImagePicker(context);
                          },
                          icon: const Icon(
                            Icons.camera_enhance,
                            color: Color.fromARGB(255, 248, 245, 245),
                            size: 20,
                          )),
                      //====
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _detailsController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Describe your capture',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_isImageSelected &&
                        _detailsController.text.isNotEmpty) {
                      addMemory(MemoryModel(

                          imagePath: imagePath,
                          
                          //FileImage(File(value[index])),

                          details: _detailsController.text.trim()));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(_isImageSelected
                              ? 'Please provide a description'
                              : 'Please select an image'),
                        ),
                      );
                    }
                  },
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        imagePath.add(_imageFile!.path);
        _isImageSelected = true;
      });
    }
  }
}





//

  // CircleAvatar(
                      //   radius: 50,
                      //   backgroundImage: _imageFile != null
                      //       ? FileImage(File(imagePath[]))
                      //       : const AssetImage('assets/images/memories.jpg')
                      //           as ImageProvider,
                      //   child: IconButton(
                      //       onPressed: () {
                      //         _showImagePicker(context);
                      //       },
                      //       icon: const Icon(
                      //         Icons.camera,
                      //         color: Colors.black,
                      //       )),
                      // ),