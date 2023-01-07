import 'package:flutter/material.dart';
import 'package:iot_project/Screens/living_room.dart';
import 'schedule_screen.dart';

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
                'This app will help you control the appliances in your home for optimal usage and luxury'),
            SizedBox(height: 30),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivingRoom()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network('https://i.imgur.com/gdlnkvN.jpeg',
                          fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivingRoom()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                          'https://images.pexels.com/photos/4850620/pexels-photo-4850620.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivingRoom()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                          'https://images.pexels.com/photos/3926542/pexels-photo-3926542.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LivingRoom()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                          'https://images.pexels.com/photos/9720924/pexels-photo-9720924.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover),
                    ),
                  ),
                ])),
          ],
        ));
  }
}

/*
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LivingRoom()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network('https://i.imgur.com/gdlnkvN.jpeg',
                        width: 150.0, height: 112.5),
                  ),
                ),
                //Image.network('https://i.imgur.com/gdlnkvN.jpeg'),
                //Image.asset('asstes/images/living.jpg'),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LivingRoom()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network('https://i.imgur.com/gdlnkvN.jpeg',
                        width: 150.0, height: 112.5),
                  ),
                ),
              ],
            ),
            */



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