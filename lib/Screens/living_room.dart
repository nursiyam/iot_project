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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Living Room'),
        ),
        body: GridView.count(
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
                        onChanged: (bool v) {
                          setState(() {
                            ledOn = v;
                          });
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
        ));
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