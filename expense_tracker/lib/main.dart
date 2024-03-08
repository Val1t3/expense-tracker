import 'package:flutter/material.dart';

import 'Screens/add_expense_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddExpenseScreen(),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}
