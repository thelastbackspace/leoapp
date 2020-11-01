import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/enter_manually.dart';
import 'package:leo/views/options.dart';

import '../config/colors.dart';

class DineIn extends StatefulWidget {
  @override
  _DineIn createState() => _DineIn();
}

class _DineIn extends State<DineIn> {

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
      body: Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(60.0),
              child: Image(
                image: AssetImage('images/qr.png')
            ),
          ),
          Container(
            //padding: const EdgeInsets.all(8.0),
            child: Text('Scan the QR Code',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColor.primarytextcolor,
                        fontSize: 20,
                ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text('or if you want to enter manually, click the button below',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColor.white,
                        fontSize: 15,
                ),
            ),
          ),
          RaisedGradientButton(
              child: Text(
                "Enter Manually",
                style: TextStyle(fontSize: 20, color: AppColor.primarytextcolor),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterManually()),
                );
              }
            ),
        ],
      ),
      ),
    );
  }
}