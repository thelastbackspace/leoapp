import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leo/components/textfield.dart';
import 'package:leo/config/colors.dart';

class DummyScreen extends StatefulWidget {
  @override
  _DummyScreenState createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  TextEditingController _controller;
  TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'IN',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
                errorStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller2,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'OUT',
                labelStyle: TextStyle(
                  fontSize: 20.0,
                ),
                errorStyle: TextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
