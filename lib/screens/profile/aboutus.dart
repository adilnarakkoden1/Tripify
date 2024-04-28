import 'package:flutter/material.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '''Welcome to Tripify, your ultimate travel companion designed to simplify and enhance 
                your travel planning experience. Our mission is to make travel planning more accessible, efficient, and enjoyable for everyone, whether you or an adventure.''',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Features:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '-- Discover and Plan: Explore amazing destinations, discover the best things to do, and plan your trips step by step. Our app provides detailed descriptions, photos, ratings, and location maps for attractions, restaurants, and accommodations.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '-- Offline Access: Access all your planned trip information completely offline. See your favorite places, planned activities, and details such as photos, comments, and basic information even without an internet connection.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '-- Save time and money with unique trips from experienced travel guides. Combining technology with expert knowledge, our guides offer complete itineraries and recommended locations to help you travel better.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Why Choose Tripify?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '-- Simplicity and Efficiency: Our easy-to-use interface and step-by-step guidance make travel planning simple and efficient.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '-- Personalization: Customize your trips with personalized settings, activities, and more.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '-- Security: Your data is safe with our secure system, ensuring your trips are private.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '-- Community: Join a community of travelers   who share tips, experiences, and travel stories.',
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 8,
              ),
              Text(
                '-- At Tripify, we believe in making travel planning accessible and enjoyable for everyone. Whether youre planning a business trip, a holiday, or an adventure, our app is here to make your journey smoother and more memorable.',
                style: TextStyle(fontSize: 16),
              ),
              // Add more information as needed
            ],
          ),
        ),
      ),
    );
  }
}
