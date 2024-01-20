import 'package:conuhacks8/expense/expense.dart';

class ExpenseList {
  late List<Expense> expenses;

  ExpenseList() {
    expenses = <Expense>[];
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  //Get
  List<Expense> getByType(String type) {}
}
