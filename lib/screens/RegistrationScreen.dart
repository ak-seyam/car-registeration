import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({this.code, this.serverURL});

  final String code;
  final String serverURL;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("you are registering the car ${widget.code}"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Car owner ID رقم بطاقة سائق السيارة",
                ),
                controller: _controller,
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () async {
                  String code = widget.code;
                  String u_code = _controller.text;
                  print("code:$code");
                  print("u_code:$u_code");
                  print("wow");
                  try{
                    await http
                        .post(widget.serverURL,
                        body: '{"car_id":"$code","user_id":"$u_code"}')
                        .then((response) => {
                      if (response.statusCode == 200)
                        {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Success"),
                                );
                              })
                        }
                      else
                        {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                );
                              })
                        }
                    });
                  } on SocketException catch(e){
                      showDialog(context: context,builder: (context){
                        return AlertDialog(
                          title: Text("Server Error"),
                        );
                      });
                  }

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
