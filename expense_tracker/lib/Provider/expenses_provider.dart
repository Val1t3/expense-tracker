import 'package:flutter/material.dart';

class Expense {
  String title;
  String type;
  int value;
  DateTime date;

  Expense(
      {required this.title,
      required this.type,
      required this.value,
      required this.date});
}

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenseList = List.empty(growable: true);

  List<Expense> get expenseList {
    return [..._expenseList];
  }

  get expenses => _expenseList;

  void addExpense(Expense expense) {
    _expenseList.add(expense);
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    _expenseList.remove(expense);
    notifyListeners();
  }
}
