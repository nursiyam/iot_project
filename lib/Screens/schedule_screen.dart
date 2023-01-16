import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Routine',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Active Routines',
              ),
              SizedBox(height: 6),
              const RoutineTile(name: 'Robot Vacuume', active: true),
              SizedBox(height: 14),
              const RoutineTile(name: 'Washing Machine', active: true),
              SizedBox(height: 14),
              const RoutineTile(name: 'Coffee Machine'),
              SizedBox(height: 14),
              const RoutineTile(name: 'Alarm Clock'),
              SizedBox(height: 14),
              const RoutineTile(name: 'Security Lock'),
              SizedBox(height: 14),
              const RoutineTile(name: 'Dishwasher'),
              SizedBox(height: 20),
              ChipButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoutineTile extends StatelessWidget {
  final String name;
  final bool active;
  const RoutineTile({
    Key? key,
    required this.name,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.repeat,
                size: 24,
                color: active ? Colors.white : Colors.grey[800],
              ),
              SizedBox(width: 4),
              Text(
                name,
                style: TextStyle(
                    color: (active ? Colors.white : Colors.grey[800])),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6:00 AM',
                style: TextStyle(
                    color: (active ? Colors.white : Colors.grey[800])),
              ),
              Text(
                'M,T,W',
                style: TextStyle(
                    color: (active ? Colors.white : Colors.grey[800])),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ChipButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const ChipButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: onPressed ?? () {},
        child: child,
      ),
    );
  }
}
