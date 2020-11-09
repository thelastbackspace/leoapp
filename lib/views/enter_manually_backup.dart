import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/booking_layout.dart';
import 'package:leo/views/main_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:leo/config/url.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../config/colors.dart';


class EnterManually extends StatefulWidget {
  @override
  _EnterManually createState() => _EnterManually();
}


class _EnterManually extends State<EnterManually> {
    int newConfirmed;
    int totalConfirmed;
    int newDeaths;
    int totalDeaths;
    int newRecovered;
    int totalRecovered;
  Future getData() async{
    Response response=await get("https://api.covid19api.com/summary");
    if(response.statusCode==200)
    {
      newConfirmed=jsonDecode(response.body)["Global"]["NewConfirmed"];
      print(newConfirmed);
      totalConfirmed=jsonDecode(response.body)["Global"]["TotalConfirmed"];
      print(totalConfirmed);
      newDeaths=jsonDecode(response.body)["Global"]["NewDeaths"];
      print(newDeaths);
      totalDeaths=jsonDecode(response.body)["Global"]["TotalDeaths"];
      print(totalDeaths);
      newRecovered=jsonDecode(response.body)["Global"]["NewRecovered"];
      print(newRecovered);
      totalRecovered=jsonDecode(response.body)["Global"]["TotalRecovered"];
      print(totalRecovered);
    }
  else
    {
      newConfirmed=null;
      print(newConfirmed);
      totalConfirmed=null;
      print(totalConfirmed);
      newDeaths=null;
      print(newDeaths);
      totalDeaths=null;
      print(totalDeaths);
      newRecovered=null;
      print(newRecovered);
      totalRecovered=null;
      print(totalRecovered);
    }
    print(response.body);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.only(right: 20.0, top: 20.0),
              child: InkWell(
                child: Text("Dine In >",
                    style: TextStyle(
                      color: AppColor.primarytextcolor,
                    )),
                onTap: () {},
              )),
        ],
      ),
      backgroundColor: AppColor.bgcolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
        key: _formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Color(0x7f0a0a0a),
                blurRadius: 10,
                offset: Offset(-1, -2),
              ),
              BoxShadow(
                color: Color(0x4c262626),
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
            color: Color(0xff181818),
          ),
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter Code',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.white24,),
                  border: InputBorder.none, 
                  errorStyle: TextStyle(),                
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the valid code';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: RaisedGradientButton(
                  child: Text(
                    "See Menu",
                    style: TextStyle(
                        fontSize: 20, color: AppColor.primarytextcolor),
                  ),
                  onPressed: () async{
                      await getData();
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    // if (_formKey.currentState.validate()) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MainLayout()),
                    //   );
                    // }
                  }),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
