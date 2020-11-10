import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:leo/views/options.dart';
import 'package:leo/views/firstView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leo/views/login.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:sms_autofill/sms_autofill.dart';

class DetectLoginOtp extends StatefulWidget {
  Map data;
   DetectLoginOtp({Key key, this.data}) : super(key: key);
  @override
  _DetectLoginOtpState createState() => _DetectLoginOtpState();
}

class _DetectLoginOtpState extends State<DetectLoginOtp> {
  bool _isLoading = false;
  bool _obscureText = true;
  bool duplicate = false;
  bool numberproceed = false;
  bool passwordproceed = false;
  bool resent = false;
//  bool duplicatenumber = false;
  final TextEditingController nameController = new TextEditingController();
  //final TextEditingController emailController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  //final TextEditingController passwordController = new TextEditingController();

  String _password;
   String otpCode;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
 

  
  @override
  void initState() {
    super.initState();
    _listenOtp();
    print("Shubh");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
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
      body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : 
          Container(
            margin: const EdgeInsets.all(50.0),
            child:ListView(
               //CrossAxisAlignment.center,
                children: <Widget>[
                   if(duplicate==true)(
                   Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Enter Correct Otp',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  ))
                  else if(resent ==true)(
                   Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('You will receive a new OTP',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  )),
Container(
  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text('Enter OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: AppColor.primarytextcolor,
                        fontSize: 20,
                ),
            ),
          ),
                 
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
                child:   Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      
                  child:PinFieldAutoFill(
                    codeLength: 4,
                    decoration: UnderlineDecoration(
                      textStyle: TextStyle(fontSize: 20, color: Colors.white24),
                      colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0)),
                      ),
                    onCodeChanged: (code){
                     if (code.length == 4) {

                      if(code == "1234"){
                     signIn(code, widget.data["number"]);
                      }
                      else
                     wrongOtp();
                    }
                    }
                
                  
                ),
            )),
            Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: 
                      FlatButton(
                    onPressed: () {
                      otpResent();
                },

                    child: Text(
                      "Resend Otp?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.white),
                    ),
                      
                    ),
                    ),
                     
                ],
              )
    ));
  }

void _listenOtp() async {
  await SmsAutoFill().listenForCode;
}
  signIn(code,number) async {
    print("Working");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'number':number, 'otpverified':'yes'};
    var jsonResponse = null;
    var response =
        await http.post("https://leomenu.com/leoapp/public/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
     if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          sharedPreferences.setString("token", jsonResponse['data']);
          sharedPreferences.setInt("user",jsonResponse['user']);
           print(sharedPreferences.getInt("user"));
          print(sharedPreferences.getString("token"));
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Options()),
              (Route<dynamic> route) => false);
      }
    } 
    else if(response.statusCode == 500){
       setState(() {
        duplicate = true;
        resent = false;
        _isLoading = false;
      }); 
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }
 String validatenumber(value) {
  
    
    Pattern pattern =
        r"^[6-9]\d{9}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null){
      numberproceed=false;
      return 'please enter valid number:';
    }
    else{
     numberproceed=true;
      return null;
    }
  }

String validatepassword(String value) {
    Pattern pattern =
        r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null){
      passwordproceed=false;
      return 'Minimum 8 chars, 1 letter and 1 number:';
    }
    else{
      passwordproceed=true;
      return null;
    }
  }  

  void wrongOtp(){
    setState(() {
        duplicate = true;
        _isLoading = false;
      });
  }
   void otpResent(){
    setState(() {
        resent = true;
         duplicate = false;
        _isLoading = false;
      });
  }
}


 