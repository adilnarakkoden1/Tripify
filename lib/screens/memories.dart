import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Memories extends StatefulWidget {
  const Memories({super.key});

  @override
  State<Memories> createState() => _MemoriesState();
}

class _MemoriesState extends State<Memories> {
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
      body: Container(),
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : AssetImage('assets/images/memories.jpg')
                          as ImageProvider,
                  child: IconButton(
                      onPressed: () {
                        _showImagePicker(context);
                      },
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.black,
                      )),
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
                    if (_formKey.currentState!.validate()) {
                      // await addMemory(MemoryModel(
                      //     imagex: _imageFile,
                      //     details: _detailsController.text.trim()));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Done'),
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
      });
    }
  }
}
