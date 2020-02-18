import 'package:flutter/material.dart';
import 'RegistrationScreen.dart';
import 'ScannerUtil.dart';

class ScannerScreen extends StatelessWidget {
  ScannerScreen({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Scan new the QR-Code"),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: RaisedButton(onPressed: () {
              scanner(context);
            }, child: Text("Scan"),),
          )
        ],
      ),
    );
  }

  Future scanner(context) async{
    await scan().then((value) =>  Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => RegistrationScreen(code: value,serverURL: "http://192.168.1.3:5000/adduser",)
        )
    ));
  }
}



