import 'package:flutter/material.dart';
import 'package:valor_impact/views/benefit_list.dart';
import 'package:valor_impact/views/task_list.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _Home();

  const Home({super.key});

}

class _Home extends State<Home> {

  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const TaskList()},
    {"screen": const BenefitList()}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tâches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Récompenses',
          ),
        ],
      ),
    );
  }
}