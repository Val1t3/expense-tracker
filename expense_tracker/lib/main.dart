import 'package:expense_tracker/Provider/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/manager_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ExpenseProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ManagerScreen(),
    );
  }
}
