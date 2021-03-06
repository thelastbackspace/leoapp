import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';
import '../config/colors.dart';
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
                            "http://192.168.31.137:8001/api/reservedtable/$id");

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
        body: Stack(
          alignment: Alignment.center,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildToolBar(),
            ),
            Container(
              child: Text('$_captureText'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToolBar() {
    return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _captureController.pause();
              },
              child: Text('$_captureText'),
            ),
            FlatButton(
              onPressed: () {
                if (_isTorchOn) {
                  _captureController.torchMode = CaptureTorchMode.off;
                } else {
                  _captureController.torchMode = CaptureTorchMode.on;
                }
                _isTorchOn = !_isTorchOn;
              },
              child: Text('torch'),
            ),
            FlatButton(
              onPressed: () {
                _captureController.resume();
              },
              child: Text('resume'),
            ),
          ],
        );
  }
}