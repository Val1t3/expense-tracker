import 'package:expense_tracker/Provider/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, child) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: expenseProvider.expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenseProvider.expenses[index];
                  return Dismissible(
                      key: Key(expense.toString()),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        expenseProvider.removeExpense(expense);
                      },
                      child: ListTile(
                          title: Text(expense.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(expense.type),
                              Text(expense.amount.toString()),
                              Text(expense.date
                                  .toString()), // Display date value
                            ],
                          )));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
