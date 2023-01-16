import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  bool ledOn = true;
  bool acOn = false;
  bool tvOn = false;
  bool curtainClosed = true;
  int tempReading = 10;
  int lightReading = 30;

//Read from the database
  dynamic data;
  final dataBase = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    //Read the data from the database once
    dataBase.child('ESP').once().then((snap) {
      data = snap.snapshot.value;
      lightReading = data['LDR'];
      tempReading = data['Temp'];
      ledOn = data['LED'] == 1;
    }).then((value) {
      setState(() {});
    });

    //Listen to database for changes
    dataBase.child('ESP').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;

      if (snap.key == 'LDR') {
        setState(() {
          lightReading = int.parse(snap.value.toString());
        });
      }

      if (snap.key == 'Temp') {
        setState(() {
          tempReading = int.parse(snap.value.toString());
        });
      }
    });
    super.initState();
  }

  //Function to toggle the switch and change the value on the database
  void toggleSwitchLed(bool value) {
    if (ledOn == false) {
      setState(() {
        ledOn = true;
        final child = dataBase.child('ESP/');
        int boolString = ledOn ? 1 : 0;
        child.update({'LED': boolString});
      });
    } else {
      setState(() {
        ledOn = false;
        final child = dataBase.child('ESP/');
        int boolString = ledOn ? 1 : 0;
        child.update({'LED': boolString});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Living Room'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://i.imgur.com/gdlnkvN.jpeg'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(right: 6),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Temperature',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.thermostat,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    '$tempReading',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    ' C',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Brightness',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.water_drop_outlined,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    '$lightReading',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                  Text(
                                    ' %',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Energy Used',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bolt_sharp,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    '250 KWh',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ])),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.light,
                                size: 60,
                                color: Colors.grey,
                              ),
                              Switch.adaptive(
                                activeColor: Colors.blue[900],
                                value: ledOn,
                                onChanged: toggleSwitchLed,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Lamp',
                            style: TextStyle(fontSize: 26, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.ac_unit,
                                size: 60,
                                color: Colors.grey,
                              ),
                              Switch.adaptive(
                                activeColor: Colors.blue[900],
                                value: acOn,
                                onChanged: (bool v) {
                                  setState(() {
                                    acOn = v;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'AC Unit',
                            style: TextStyle(fontSize: 26, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.tv_rounded,
                                size: 60,
                                color: Colors.grey,
                              ),
                              Switch.adaptive(
                                activeColor: Colors.blue[900],
                                value: tvOn,
                                onChanged: (bool v) {
                                  setState(() {
                                    tvOn = v;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Smart TV',
                            style: TextStyle(fontSize: 26, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.only(right: 6),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Icon(
                                Icons.curtains,
                                size: 60,
                                color: Colors.grey,
                              ),
                              Switch.adaptive(
                                activeColor: Colors.blue[900],
                                value: curtainClosed,
                                onChanged: (bool v) {
                                  setState(() {
                                    curtainClosed = v;
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Curtains',
                            style: TextStyle(fontSize: 26, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )));
  }
}


/*
Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GridView.count(
          crossAxisCount: 2,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.light),
                        //SizedBox(width: 32),
                        Switch.adaptive(
                          activeColor: Colors.blue[900],
                          value: ledOn,
                          onChanged: (bool v) {
                            setState(() {
                              ledOn = v;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    //SizedBox(height: 32),
                    Text(
                      'Lamp',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),*/