import 'package:expense_tracker/Provider/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  List<String> list = <String>["Expense", "Income"];

  final TextEditingController _titleController = TextEditingController();

  _addExpenseTest() {
    ExpenseProvider expenseProvider =
        Provider.of<ExpenseProvider>(context, listen: false);
    String title = _titleController.text;

    expenseProvider.addExpense(Expense(
      title: title,
      type: "Expense",
      value: 100,
      date: DateTime.now(),
    ));
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: const EdgeInsets.all(40.0),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: _addExpenseTest,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
