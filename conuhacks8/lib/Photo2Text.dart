import 'package:flutter/material.dart';
import 'HomePage/BottomNav.dart';

class PhotoToText extends StatelessWidget {
  const PhotoToText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo2Text'),
        backgroundColor: Color.fromARGB(255, 255, 241, 113),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 241, 113),
              Color.fromARGB(255, 99, 164, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text('Photo2Text'),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
