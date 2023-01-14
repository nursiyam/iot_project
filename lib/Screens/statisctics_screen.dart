import 'dart:convert';

import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
// Database code
  bool ledOn = true;
  bool acOn = false;
  bool tvOn = false;
  bool curtainClosed = true;
  int tempReading = 10;
  int lightReading = 30;
  int minutes = 1;

//Read from the database
  dynamic data;
  final dataBase = FirebaseDatabase.instance.ref();
  @override
  void initState() {
    //Read the data from the database once
    dataBase.child('ESP').once().then((snap) {
      data = snap.snapshot.value;
      lightReading = data['LDR'];
      tempReading = data['temp'];
      ledOn = data['LED'] == 1;
    }).then((value) {
      setState(() {
        getJson();
      });
    });

    //Listen to database for changes
    dataBase.child('ESP').onChildChanged.listen((event) {
      DataSnapshot snap = event.snapshot;

      if (snap.key == 'LDR') {
        setState(() {
          lightReading = int.parse(snap.value.toString());
        });
      }

      if (snap.key == 'temp') {
        setState(() {
          tempReading = int.parse(snap.value.toString());
        });
      }
      if (snap.key == 'minutes') {
        setState(() {
          minutes = int.parse(snap.value.toString());
          getJson();
        });
      }
    });
    super.initState();
  }

// Json Code
  late List<dynamic> ldrValues;
  late String json;
  int itemCount = 60;
  List<double> ldrData = [];
  List<String> time = [];

  Future getJson() async {
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycby3YCkkLzBKpOimOt6xs-JKF9BCJC6ZoHHORVxGrYOWd164cOx_HS4vvDTeovWgHEjYig/exec');
    json = await http.read(url).then((value) {
      ldrValues = jsonDecode(value);
      itemCount = ldrValues.length < 60 ? ldrValues.length : 60;
      var dataUsed = ldrValues.sublist(0, itemCount);
      ldrData = [];
      time = [];
      dataUsed.forEach((element) {
        ldrData.add((element['value'].toDouble()) / 100);
        time.add(element['date'].split('T')[1].substring(0, 5));
      });
      print(ldrValues);
      return value;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Brightness Readings",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: LineGraph(
                features: [
                  Feature(title: "Sensor", color: Colors.blue, data: [
                    0.1,
                    0.2,
                    0.6,
                    0.4,
                    0.3,
                    0.6,
                    0.7,
                    0.2,
                    0.9,
                    1.0
                  ] //List.from(ldrData.reversed),
                      ),
                ],
                size: Size(
                    380, 400), //Size((ldrData.length * 70).toDouble(), 400),
                labelX: const [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '6',
                  '7',
                  '8',
                  '9',
                  '10'
                ], //List.from(time.reversed),
                labelY: ['20%', '40%', '60%', '80%', '100%'],
                graphColor: Colors.blue,
                graphOpacity: 0.2,
              ),
            )
          ],
        ));
  }
}
