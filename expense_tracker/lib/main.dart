import 'package:expense_tracker/Screens/details_list_screen.dart';
import 'package:expense_tracker/Screens/details_screen.dart';
import 'package:expense_tracker/Screens/login_screen.dart';
import 'package:expense_tracker/Screens/settings_screen.dart';
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
        '/details_list': (context) => const DetailsListScreen(),
        '/details/:id': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/login': (context) => const LoginScreen(),
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
    );
  }
}
