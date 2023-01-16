import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
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
                  Feature(
                      title: "Sensor",
                      color: Colors.blue,
                      data: [0.1, 0.2, 0.4, 0.3, 0.7, 0.2, 0.9, 1.0]),
                ],
                size: Size(380, 400),
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
                ],
                labelY: ['20%', '40%', '60%', '80%', '100%'],
                graphColor: Colors.blue,
                graphOpacity: 0.2,
              ),
            )
          ],
        ));
  }
}
