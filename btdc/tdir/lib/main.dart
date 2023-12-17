// ignore_for_file: use_build_context_synchronously

import 'dart:ui' as ui;

import 'package:tumorscan/LoginPage.dart';
import 'package:tumorscan/WelcomePage.dart';
import 'package:tumorscan/history.dart';
import 'package:flutter/material.dart';
import 'package:tumorscan/SignupPage.dart';

final ThemeData theme = ThemeData.light(useMaterial3: false);
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Signup App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/signup': (context) => const SignupPage(),
        '/login': (context) => const LoginPage(),
        '/welcome': (context) => const WelcomePage(),
        '/history': (context) => const History(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background blur layer
            ImageFiltered(
              imageFilter: ui.ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 5.0), // Apply the blur effect
              child: Image.asset(
                'assets/Flowers_02_4K.jpg', // Replace 'your_image.png' with the actual image path
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Content (image, text, and button)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/3.png', // Replace 'your_image.png' with the actual image path
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                    height: 20), // Add some spacing between the image and text
                const Text(
                  'Welcome to Tumor Scan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust the text color as needed
                  ),
                ),
                const SizedBox(
                    height: 20), // Add some spacing between the text and button
                ElevatedButton(
                  onPressed: () async {
                    // Navigate to the LoginPage when the button is pressed
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
