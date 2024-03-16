import 'package:flutter/material.dart';

class Expense {
  String title;
  String type;
  int value;

  Expense({required this.title, required this.type, required this.value});
}

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenseList = [];

  List<Expense> get expenseList {
    return [..._expenseList];
  }

  void addExpense(Expense expense) {
    _expenseList.add(expense);
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    _expenseList.remove(expense);
    notifyListeners();
  }
}
