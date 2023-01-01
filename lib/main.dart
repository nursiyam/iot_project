import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Automation',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
