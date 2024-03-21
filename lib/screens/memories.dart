import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';

class Memories extends StatelessWidget {
  const Memories({super.key});

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
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(198, 204, 198, 177),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera,
                                color: Colors.black,
                                size: 70.0,
                              ),
                            ),
                            const Text(
                              'Gallery',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.album,
                                size: 70.0,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'Camera',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
