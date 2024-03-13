import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  List<String> list = <String>["Expense", "Income"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      margin: const EdgeInsets.all(40.0),
      child: const Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  hintText: "Title", border: OutlineInputBorder()),
            ),
            // DropdownButton(items: items, onChanged: onChanged)
          ],
        )),
      ),
    ));
  }
}
