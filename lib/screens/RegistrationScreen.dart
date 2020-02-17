import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(this.code),
      ),
    );
  }
}
