import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/views/profile.dart';

import 'hambuger_menu_tile.dart';
import 'hamburger_menu_items.dart';

int currSelectedCollapsingNavBar = 0;

class HamMenu extends StatefulWidget {

  final int currSelected;

  HamMenu({this.currSelected});

  @override
  _HamMenuState createState() => _HamMenuState();
}

class _HamMenuState extends State<HamMenu> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: AppColor.bgcolor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          InkWell(
            onTap: () {
              setState(() {
                currSelectedCollapsingNavBar = -1;
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: widget.currSelected == -1 ? Colors.transparent.withOpacity(0.3): Colors.transparent,
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_circle,
                      color: widget.currSelected == -1? AppColor.primarytextcolor: AppColor.white,
                      size: 40.0,),
                    SizedBox(width: 10.0,),
                    Text("Customer Name", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: widget.currSelected == -1? AppColor.primarytextcolor: AppColor.white),),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 10.0,
            color: Colors.grey,
          ),
          Expanded(
            child:
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, counter ) {
                return HamMenuTile(
                  onTap: widget.currSelected == counter? () {} : () {
                    setState(() {
                      currSelectedCollapsingNavBar = counter;
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => list[counter].pushTo));
                    });
                  },
                  isSelected: widget.currSelected == counter,
                  title: list[counter].title,
                  icon: list[counter].icon,
                );
              },
              separatorBuilder: (context, counter) {
                return Divider(thickness: 3.0);
              },
              itemCount: list.length,
            ),
          )
        ],
      ),
    );
  }
}