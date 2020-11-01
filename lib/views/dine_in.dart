import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/enter_manually.dart';
import 'package:leo/views/options.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';
import '../config/colors.dart';
import 'package:leo/views/main_layout.dart';

import '../config/colors.dart';

class DineIn extends StatefulWidget {
  @override
  _DineIn createState() => _DineIn();
}

class _DineIn extends State<DineIn> with TickerProviderStateMixin {
  QRCaptureController _captureController = QRCaptureController();
  Animation<Alignment> _animation;
  AnimationController _animationController;

  bool _isTorchOn = false;

  String _captureText = '';

  @override
  void initState() {
    
    super.initState();

    _captureController.onCapture((data) {
      print('onCapture----$data');
      setState(() {
        _captureText = data;
        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainLayout()),
                      );
       });
      });


    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        AlignmentTween(begin: Alignment.topCenter, end: Alignment.bottomCenter)
            .animate(_animationController)
              ..addListener(() {
                setState(() {});
              })
              ..addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  _animationController.reverse();
                } else if (status == AnimationStatus.dismissed) {
                  _animationController.forward();
                }
              });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: QRCaptureView(
              controller: _captureController,
            ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 56),
              child: AspectRatio(
                aspectRatio: 264 / 258.0,
                child: Stack(
                  alignment: _animation.value,
                  children: <Widget>[
                    Image.asset('images/sao@3x.png'),
                    Image.asset('images/tiao@3x.png')
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
              child: Text('$_captureText'),
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