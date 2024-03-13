import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

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
          ],
        )),
      ),
    ));
  }
}
