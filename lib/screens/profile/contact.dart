import 'package:flutter/material.dart';
import 'package:tripify/color_fonts/color.dart';

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: pimaryBrown,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Feel free to contact us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/images/5143151.jpg'),
            //AssetImage('images/tripify_logo.png'), // Replace with your app's logo
            Center(
              child: Container(
                padding: EdgeInsets.only(right: 58),
                child: Text(
                  '''
                      CompanyName: Tripify,
                      Email: collegeevent869@gmail.com
                      
                      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
