import 'package:flutter/material.dart';
import 'package:leo/components/button.dart';
import 'package:leo/config/colors.dart';

class HamMenuTile extends StatefulWidget {

  final String title;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  HamMenuTile({this.title, this.icon, this.isSelected, this.onTap});

  @override
  _HamMenuTileState createState() => _HamMenuTileState();
}

class _HamMenuTileState extends State<HamMenuTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: RaisedGradientButton(
        onPressed: widget.onTap,
        child: Container(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(widget.icon,
                color: widget.isSelected? AppColor.primarytextcolor: AppColor.white,
                size: 40.0,),
              SizedBox(width: 10.0,),
              Text(widget.title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: widget.isSelected? AppColor.primarytextcolor: AppColor.white,),),
            ],
          ),
        ),
      ),
    );
  }
}