import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/options.dart';

import '../config/colors.dart';

class ComingSoon extends StatefulWidget {
  @override
  _ComingSoon createState() => _ComingSoon();
}

class _ComingSoon extends State<ComingSoon> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () { /* Write listener code here */ },
            child: Icon(
              Icons.menu,  // add custom icons also
              color: AppColor.primarytextcolor,
            ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 20.0),
            child: InkWell(
              child: Text("Dine In >",
              style: TextStyle(color: AppColor.primarytextcolor,)),
              onTap: () {},
            )
         ),
        ],
      ),
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
            child: Text('Coming Soon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColor.primarytextcolor,
                        fontSize: 20,
                ),
            ),
          ),
          RaisedGradientButton(
              child: Text(
                "Go Back",
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