import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';

class NeuCard extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final int height;
  final int width;
  const NeuCard({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    Row(mainAxisSize: MainAxisSize.min,
  children: <Widget>[
     Container(
//      height: 150,
//      width: 150,
     //margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.all(15),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xe50a0a0a),
            blurRadius: 20,
            offset: Offset(8, 8),
          ),
          BoxShadow(
            color: Color(0xe5262626),
            blurRadius: 16,
            offset: Offset(-8, -8),
          ),
          BoxShadow(
            color: Color(0x330a0a0a),
            blurRadius: 16,
            offset: Offset(8, -8),
          ),
          BoxShadow(
            color: Color(0x330a0a0a),
            blurRadius: 16,
            offset: Offset(-8, 8),
          ),
        ],
        color: Color(0xff181818),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    )
    ],
    ); 
  }
}