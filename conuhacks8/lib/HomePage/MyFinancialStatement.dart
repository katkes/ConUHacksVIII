import 'package:flutter/material.dart';
import 'BottomNav.dart';

class MyFinancialStatement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Financial Statement'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[700]!, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text('My Financial Statement'),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
