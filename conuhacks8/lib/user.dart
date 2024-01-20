import 'package:conuhacks8/expense/ExpenseList.dart';

class User {
  late String userName;
  late String name;
  late String passWord;
  late int age;
  late double income;
  late String city;
  late ExpenseList expenses;

  User(String userName, String name, String password, int age, double income,
      String city) {
    this.userName = userName;
    this.name = name;
    this.passWord = password;
    this.age = age;
    this.income = income;
    this.city = city;
    this.expenses = ExpenseList();
  }
}
