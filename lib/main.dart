import 'package:flutter/material.dart';
import 'screens/ScannerScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Registeration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScannerScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
