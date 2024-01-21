import 'package:conuhacks8/Finance_Statement/editable_page.dart';
import 'package:conuhacks8/HomePage/MyFinancialStatement.dart';
import 'package:flutter/material.dart';
import 'HomePage/FinanceTracker.dart';
import 'HomePage/Retirement.dart';
import 'HomePage/Mortgage.dart';
import 'HomePage/Investments.dart';
import 'HomePage/Student.dart';
import 'ChatBot.dart';
import 'main.dart';
import 'HomePage/MyLearningCenter.dart';

class NavigationManager {
  static void navigateTo(String routeName, BuildContext context) {
    Widget page;
    switch (routeName) {
      case 'My Learning Center':
        page = const MyLearningCenter();
        break;
      case 'My Financial Statement':
        page = const MyFinancialStatement();
        break;
      case 'Finance Tracker':
        page = const FinanceTracker();
        break;
      case 'Retirement':
        page = const Retirement();
        break;
      case 'Mortgage':
        page = const Mortgage();
        break;
      case 'Investments':
        page = const Investment();
        break;
      case 'Student':
        page = const Student();
        break;
      case 'My Profile':
        page = const EditablePage(); // Replace with your Profile page widget
        break;
      case 'Home':
        // Assuming HomePage is directly in main.dart
        page = HomePage();
        break;
      case 'Chatbot':
        page = const ChatBot(); // Replace with your Chatbot page widget
        break;
      default:
        page = Scaffold(
          appBar: AppBar(),
          body: const Center(child: Text('Page not found')),
        );
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
