import 'package:flutter/material.dart';
import 'package:valor_impact/views/add_task.dart';
import 'package:valor_impact/views/benefit_list.dart';
import 'package:valor_impact/views/profile.dart';
import 'package:valor_impact/views/task_list.dart';
import 'package:valor_impact/views/welcome.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _Home();

  const Home({super.key});

}

class _Home extends State<Home> {

  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const Welcome()},
    {"screen": const BenefitList()},
    {"screen": const AddTask()},
    {"screen": const Profile()},
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/maison.png',),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/benefice.png',),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/tache.png',),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profil.png',),
            label: "",
          ),
        ],
      ),
    );
  }
}