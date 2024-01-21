// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'BottomNav.dart';

class MyFinancialStatement extends StatelessWidget {
  const MyFinancialStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Financial Statement',
          style: TextStyle(
            fontFamily: 'YesevaOne', // Font family as declared in pubspec.yaml
            fontSize: 25, // Adjust the font size as needed
            color: Color.fromARGB(255, 0, 26, 156),
          ),
          textAlign: TextAlign.center,
        ),
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Financial Statement Title
              Text(
                'Yearly Financial Statement\nIncome: 1,000,000',
                style: TextStyle(
                  fontFamily:
                      'YesevaOne', // Font family as declared in pubspec.yaml
                  fontSize: 25, // Adjust the font size as needed
                  color: Color.fromARGB(255, 0, 26, 156),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Row with Two Columns
              Row(
                children: [
                  // First Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Income: 100,000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  // Second Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Cost of Goods Sold: \$50,000'),
                        Text('Operating Expenses: \$20,000'),
                        // Add more expense items as needed
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
