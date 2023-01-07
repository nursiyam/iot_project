import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/Screens/dashboard_screen.dart';
import 'package:iot_project/Screens/schedule_screen.dart';
import 'package:iot_project/Screens/statisctics_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  //List of tabs (screens)
  static const List<Widget> _screenOptions = <Widget>[
    DashboardScreen(),
    ScheduleScreen(),
    StatisticsScreen()
  ];

  //  Change the selected item's index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Home Automation')),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Schedule Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.stacked_line_chart_outlined),
                label: 'Statistics')
          ]),
      body: _screenOptions.elementAt(_selectedIndex),
    );
  }
}
