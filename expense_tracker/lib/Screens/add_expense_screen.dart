import 'package:expense_tracker/Provider/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  List<String> typeList = <String>["Expense", "Income"];
  String type = "Expense";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  _isButtonEnabled() {
    if (_titleController.text.isNotEmpty && _amountController.text.isNotEmpty) {
      try {
        double amount = double.parse(_amountController.text);
        return amount > 0;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  _handleAddExpense() {
    ExpenseProvider expenseProvider =
        Provider.of<ExpenseProvider>(context, listen: false);
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);

    expenseProvider.addExpense(Expense(
      title: title,
      type: type,
      amount: amount,
      date: DateTime.now(),
    ));

    _titleController.clear();
    _amountController.clear();
  }

  _updateButtonState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      _updateButtonState();
    });
    _amountController.addListener(() {
      _updateButtonState();
    });
  }

  @override
  void dispose() {
    _titleController.removeListener(_updateButtonState);
    _amountController.removeListener(_updateButtonState);
    _titleController.dispose();
    _amountController.dispose();
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
                DropdownButton<String>(
                    value: type,
                    onChanged: (String? value) {
                      setState(() {
                        type = value!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: "Expense",
                        child: Text("Expense"),
                      ),
                      DropdownMenuItem(value: "Income", child: Text("Income")),
                    ]),
                TextField(
                  controller: _amountController,
                  keyboardType:
                      TextInputType.number, // Set the keyboard type to number
                  decoration: const InputDecoration(
                    hintText: "Amount",
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: _isButtonEnabled() ? _handleAddExpense : null,
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
