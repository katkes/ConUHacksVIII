import 'package:conuhacks8/HomePage/MyFinancialStatement.dart';
import 'package:conuhacks8/HomePage/MyLearningCenter.dart';
import 'package:flutter/material.dart';
import 'HomePage/FinanceTracker.dart';
import 'HomePage/Retirement.dart';
import 'HomePage/Mortgage.dart';
import 'HomePage/Investments.dart';
import 'HomePage/Student.dart';

class NavigationManager {
  static void navigateTo(String routeName, BuildContext context) {
    Widget page;
    switch (routeName) {
      case 'My Learning Center':
        page = MyLearningCenter();
        break;
      case 'My Financial Statement':
        page = MyFinancialStatement();
        break;
      case 'Finance Tracker':
        page = FinanceTracker();
        break;
      case 'Retirement':
        page = Retirement();
        break;
      case 'Mortgage':
        page = Mortgage();
        break;
      case 'Investments':
        page = Investments();
        break;
      case 'Student':
        page = Student();
        break;
      default:
        page = Scaffold(
          appBar: AppBar(),
          body: Center(child: Text('Page not found')),
        );
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}