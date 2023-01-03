import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool ledOn = true;
  int sensorReading = 10;
  dynamic data;
  final dataBase = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    //Read the data from the database once
    dataBase.child('ESP').once().then((snap) {
      data = snap.snapshot.value;
      sensorReading = data['LDR'];
      ledOn = data['LED'] == 1;
    }).then((value) {
      setState(() {});
    });
    //Listen to database for changes
    dataBase.child('ESP').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;

      if (snap.key == 'LDR') {
        setState(() {
          sensorReading = int.parse(snap.value.toString());
        });
      }
    });
    super.initState();
  }

  int _selectedIndex = 0;

  //List of tabs (screens)
  static const List<Widget> _screenOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
    ),
    Text(
      'Index 1: Schedule a Task',
    ),
    Text(
      'Index 2: Statistics',
    ),
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
      /*Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(style: TextStyle(fontSize: 25), 'Control Your Devices'),
        ElevatedButton(
            onPressed: () {
              ledOn = !ledOn;
              final child = dataBase.child('ESP/');
              int boolString = ledOn ? 1 : 0;
              child.update({'LED': boolString});
              setState(() {});
              //print('clicked');
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ledOn ? Colors.red : Colors.green),
            child: Text(ledOn ? "Turn Light Off" : "Turn Light On")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The brightness in the room is: '),
            SizedBox(
              width: 10,
            ),
            Text(
                '$sensorReading'), //The dollar sign is to convert the integer into string
          ],
        )
      ]),*/
    );
  }
}
