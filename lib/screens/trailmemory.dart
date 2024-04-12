import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BOttomSheetScrollable extends StatefulWidget {
 const BOttomSheetScrollable({Key? key}) : super(key: key);

 @override
 State<BOttomSheetScrollable> createState() => _BOttomSheetScrollableState();
}

class _BOttomSheetScrollableState extends State<BOttomSheetScrollable> {
 final controller = MultiImagePickerController(
    maxImages: 10,
    picker: (allowMultiple) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Extract the file extension from the path
        final extension = pickedFile.path.split('.').last;
        final imageFile = ImageFile(
          UniqueKey().toString(),
          name: pickedFile.name,
          extension: extension, // Correctly set the extension
          path: pickedFile.path,
        );
        return [imageFile];
      }
      return [];
    },
 );

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MultiImagePickerView(
              controller: controller,
              padding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Multi Image Picker View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              controller.pickImages();
            },
          ),
        ],
      ),
    );
 }

 @override
 void dispose() {
    controller.dispose();
    super.dispose();
 }
}
