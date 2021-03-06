import 'package:flutter/material.dart';
import 'package:leo/components/appbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/options.dart';
import 'package:leo/views/login.dart';
import 'package:leo/views/mobile_login.dart';
import 'package:leo/views/mobile_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../config/colors.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstView createState() => _FirstView();
}

class _FirstView extends State<FirstView> {

SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    print(sharedPreferences);
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }




  @override
  Widget build(BuildContext context) {
    String shubh;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgcolor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.menu, // add custom icons also
            color: AppColor.primarytextcolor,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 0.0, top: 20.0),
              child: FlatButton(
                    onPressed: () {
                      shubh = sharedPreferences.getString("token");
                  print(shubh);
                  
                    sharedPreferences.clear();
                    sharedPreferences.commit();
                    Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => MobileSignin()),
                    (Route<dynamic> route) => false);
                },

                    child: Text(
                  "Log out >",
                    style: TextStyle(
                      color: AppColor.primarytextcolor,
                    )),
                  ),
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
                if (sharedPreferences.getString("token") == null) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (BuildContext context) => MobileSignin()),
                        (Route<dynamic> route) => false);
                  }
                else{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Options()),
                );
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              }
            ),
        ],
      )
    );
  }
}