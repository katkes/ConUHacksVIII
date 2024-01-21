import 'package:flutter/material.dart';
import 'HomePage/BottomNav.dart';

class MyExpenses extends StatelessWidget {
  const MyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: const BoxDecoration(
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
          child: Text('My Expenses'),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
