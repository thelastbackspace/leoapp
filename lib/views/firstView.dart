import 'package:flutter/material.dart';
import 'package:leo/components/appbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/options.dart';

import '../config/colors.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstView createState() => _FirstView();
}

class _FirstView extends State<FirstView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().defaultAppBar(),
      backgroundColor: AppColor.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(60.0),
              child: Image(
                image: AssetImage('images/first_view.png')
            ),
          ),
          Container(
            child: Text('Your Order is just 4 taps away',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColor.primarytextcolor,
                        fontSize: 20,
                ),
            ),
          ),
          RaisedGradientButton(
              child: Text(
                "Let's Order",
                style: TextStyle(fontSize: 20, color: AppColor.primarytextcolor),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Options()),
                );
              }
            ),
        ],
      )
    );
  }
}