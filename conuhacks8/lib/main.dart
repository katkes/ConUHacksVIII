import 'package:conuhacks8/Authentication/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'HomePage/FinanceTracker.dart';
import 'HomePage/Retirement.dart';
import 'HomePage/Mortgage.dart';
import 'HomePage/Investments.dart';
import 'HomePage/Student.dart';
import 'NavigationManager.dart';
import 'HomePage/BottomNav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inflation Insights',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final EdgeInsets buttonPadding = EdgeInsets.symmetric(
      horizontal: 20, vertical: 10); // Uniform padding for all buttons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inflation Insights'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[700]!, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: buttonPadding,
                  child: ElevatedButton(
                    onPressed: () => NavigationManager.navigateTo(
                        'My Financial Statement', context),
                    child: Text('My Financial Statement'),
                    style: ElevatedButton.styleFrom(minimumSize: Size(350, 80)),
                  ),
                ),
                Padding(
                  padding: buttonPadding,
                  child: ElevatedButton(
                    onPressed: () => NavigationManager.navigateTo(
                        'My Learning Center', context),
                    child: Text('My Learning Center'),
                    style: ElevatedButton.styleFrom(minimumSize: Size(350, 80)),
                  ),
                ),
                SizedBox(height: 30), // Added space before grid buttons
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20), // Padding for grid buttons
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50, // Spacing between grid buttons
                      crossAxisSpacing: 30, // Spacing between grid buttons
                      childAspectRatio:
                          2.0, // Adjusted aspect ratio for button size
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () =>
                              NavigationManager.navigateTo('Student', context),
                          child: Text('Student'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              NavigationManager.navigateTo('Mortgage', context),
                          child: Text('Mortgage'),
                        ),
                        ElevatedButton(
                          onPressed: () => NavigationManager.navigateTo(
                              'Investments', context),
                          child: Text('Investments'),
                        ),
                        ElevatedButton(
                          onPressed: () => NavigationManager.navigateTo(
                              'Retirement', context),
                          child: Text('Retirement'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
