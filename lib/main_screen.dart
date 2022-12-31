import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool ledOn = true;
  int tempReading = 10;
  /*final dataBase = FirebaseDatabase.instance.ref();

  _MainScreenState() {
    dataBase.child('ESP').once().then((snap) {
      tempReading = snap.value['Temp'];
      ledOn = snap.value['LED'] == 1;
    }).then((value) {
      setState(() {});
    });
    dataBase.child('ESP').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;
      if (snap.key == 'Temp') {
        tempReading = snap.value;
        setState(() {});
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Home Automation')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(style: TextStyle(fontSize: 25), 'Control Your Devices'),
        ElevatedButton(
            onPressed: () {
              ledOn = !ledOn;
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
                '$tempReading'), //The dollar sign is to convert the integer into string
          ],
        )
      ]),
    );
  }
}
