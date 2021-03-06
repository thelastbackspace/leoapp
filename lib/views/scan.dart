import 'package:flutter/material.dart';
import 'package:leo/views/enter_manually.dart';
import 'package:qrcode/qrcode.dart';
import '../config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:leo/views/main_layout.dart';

class Scan extends StatefulWidget {
  @override
  _Scan createState() => _Scan();
}

class _Scan extends State<Scan> with TickerProviderStateMixin {
  QRCaptureController _captureController = QRCaptureController();
  Animation<Alignment> _animation;
  AnimationController _animationController;
  int status;
  Map<String, dynamic> data;
  bool _isTorchOn = false;

  String _captureText = '';

  @override
  void initState() {
    
    super.initState();

    _captureController.onCapture((id) {
      setState(() async{
        _captureText = id;
         Response response = await post(
                            "https://leomenu.com/leoapp/public/api/reservedtable/$id");

                        status = jsonDecode(response.body)["availability"][0]
                            ["status"];
                        data = jsonDecode(response.body);
                        print(response);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainLayout(data: data)),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: QRCaptureView(
              controller: _captureController,
            ),
            ),
              Text(
                      "Scan the QR Code",
                      style: TextStyle(
                          fontSize: 30, color: AppColor.primarytextcolor),
                    ),
                    Padding(padding:EdgeInsets.fromLTRB(50, 0, 50, 0) ,
                   
                     child:Text(
                      "or if you want to enter it manually, click the button below",
                       textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: Colors.grey[700]
                            
                          )
                          ,
                    ),
                     ),
         
         
            
           Container(
              child:RaisedGradientButton(
                    child: Text(
                      "Enter Manually",
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primarytextcolor),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterManually()),
                        );
                    }),
            )
          ],
        ),
        ),
      ),
    );
  }
}