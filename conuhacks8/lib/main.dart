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
import 'HomePage/MyLearningCenter.dart';

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
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 0, 58, 158),
          secondary: Color.fromARGB(255, 0, 58, 158),
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
        title: Text(
          'inflation insights',
          style: TextStyle(
            fontFamily: 'YesevaOne', // Font family as declared in pubspec.yaml
            fontSize: 30, // Adjust the font size as needed
            color: Color.fromARGB(255, 0, 26, 156),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 245, 215, 67),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 241, 113)!,
              Color.fromARGB(255, 99, 164, 255)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: buttonPadding,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => NavigationManager.navigateTo(
                            'My Financial Statement', context),
                        child: Text(
                          'My Financial Statement',
                          style:
                              TextStyle(fontSize: 20), // Set the font size here
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(350, 80)),
                      ),
                      SizedBox(height: 8), // Space between the button and text
                    ],
                  ),
                ),
                Padding(
                  padding: buttonPadding,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => NavigationManager.navigateTo(
                            'My Learning Center', context),
                        child: Text(
                          'My Learning Center',
                          style:
                              TextStyle(fontSize: 20), // Set the font size here
                        ),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(350, 80)),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Calculators and Plans',
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size here
                          color: const Color.fromARGB(
                              255, 0, 37, 100), // Corrected syntax with comma
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Added space before grid buttons
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
                          child:
                              Text('Student', style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              NavigationManager.navigateTo('Mortgage', context),
                          child:
                              Text('Mortgage', style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () => NavigationManager.navigateTo(
                              'Investments', context),
                          child: Text('Investments',
                              style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () => NavigationManager.navigateTo(
                              'Retirement', context),
                          child: Text('Retirement',
                              style: TextStyle(fontSize: 20)),
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
