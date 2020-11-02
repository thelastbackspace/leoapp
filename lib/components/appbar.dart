import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';

class CustomAppBar {
  AppBar defaultAppBar() {
    return AppBar(
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
    );
  }
}
