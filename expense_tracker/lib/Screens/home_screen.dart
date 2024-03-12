import 'package:expense_tracker/Screens/add_expense_screen.dart';
import 'package:expense_tracker/Screens/login_screen.dart';
import 'package:expense_tracker/Screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenManager extends StatefulWidget {
  const HomeScreenManager({super.key});

  @override
  State<HomeScreenManager> createState() => _HomeScreenManagerState();
}

class _HomeScreenManagerState extends State<HomeScreenManager> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AddExpenseScreen(),
    const SettingsScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Expense'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
