import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(style: TextStyle(fontSize: 25), 'Welcome, Sarah!'),
            SizedBox(height: 15),
            Text(
                style: TextStyle(fontSize: 16, color: Colors.grey),
                'This app will help you control the appliences in your home for optimal usage and luxury'),
            SizedBox(height: 30),
            Row(
              children: [
                Text('hi'),
                Text('hi'),
              ],
            )
          ],
        ));
  }
}





/*
class _DashboardScreenState extends State<DashboardScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center, 
    children: [
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
    ]););
  }
}
*/