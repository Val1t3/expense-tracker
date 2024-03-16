import 'package:expense_tracker/Screens/add_expense_screen.dart';
import 'package:expense_tracker/Screens/details_list_screen.dart';
import 'package:expense_tracker/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(key: ValueKey('add_expense_screen')),
    const AddExpenseScreen(),
    const DetailsListScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'New Expense'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
