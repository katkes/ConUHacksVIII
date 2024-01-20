import 'package:conuhacks8/expense/expense.dart';

class ExpenseList {
  late List<Expense> expenses;

  ExpenseList() {
    expenses = <Expense>[];
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
  }

  // Get by a specific type
  List<Expense> getByType(String type) {
    return sortByPrice(
        this.expenses.where((expense) => expense.getType == type).toList());
  }

  // Sort by price
  List<Expense> sortByPrice(List<Expense> expenses) {
    List<Expense> sortedExpenses = new List<Expense>.from(expenses); //deep copy
    sortedExpenses.sort((a, b) => a.getPrice.compareTo(b.getPrice));
    return sortedExpenses;
  }
}
