import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';

class NeuTextField extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  const NeuTextField({
    Key key,
    @required this.child,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0x7f0a0a0a),
                blurRadius: 2,
                offset: Offset(-1, -1),
              ),
              BoxShadow(
                color: Color(0x4c262626),
                blurRadius: 2,
                offset: Offset(1, 1),
              ),
            ],
            color: Color(0xff181818),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                child: Center(
              child: child,
            )),
          ),
        )
      ],
    );
  }
}
