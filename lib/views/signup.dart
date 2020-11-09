import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:leo/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leo/views/login.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:clay_containers/clay_containers.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isLoading = false;
  bool _obscureText = true;
  bool duplicate = false;
  bool numberproceed = false;
  bool passwordproceed = false;
  bool fillfields = false;
//  bool duplicatenumber = false;
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                          child: Text('Enter Unique Email or Number',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  ))
                  else if(fillfields ==true)(
                   Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Please enter all the mandatory fields',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  )),
Container(
  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text('Enter Name: *',
                        textAlign: TextAlign.left,
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
      
                  child:TextFormField(
                  controller: nameController,
                  cursorColor: Colors.white,
                 // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white24,
                    ),
                    border: InputBorder.none,
                    errorStyle: TextStyle(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter valid name';
                    }
                    return null;
                  },
                ),
            )),
            
             Container(
  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text('Enter Email:',
                        textAlign: TextAlign.left,
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
      
                  child:
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child:TextFormField(
                       validator: validateEmail,
                  controller: emailController,
                  cursorColor: Colors.white,
                 // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white24,
                    ),
                    border: InputBorder.none,
                    errorStyle: TextStyle(),
                  ),
                ),
            ))),
            
                Container(
  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text('Enter Number: *',
                        textAlign: TextAlign.left,
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
        
                  child:Form(
                    autovalidateMode: AutovalidateMode.always,
                    child:TextFormField(
                  validator: validatenumber,
                  controller: numberController,
                  cursorColor: Colors.white,
                 // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white24,
                    ),
                    border: InputBorder.none,
                    errorStyle: TextStyle(),
                  ),
                  keyboardType: TextInputType.number,
                  
                ),
            ))),
            
       Container(
               padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text('Password: *',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                        color: AppColor.primarytextcolor,
                        fontSize: 20,
                ),
            ),
          ),
                       Stack(
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
                child: 
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      
                  child:
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    child:TextFormField(
                  validator: validatepassword,
                  
                  controller: passwordController,
                  cursorColor: Colors.white,
                  //textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  onSaved: (val) => _password = val,
                  obscureText: _obscureText,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white24,
                    ),
                    border: InputBorder.none,
                    errorStyle: TextStyle(),
                  ),
                ),
              ))),
              Container(
                 padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                 alignment: Alignment.centerRight,
              child: FlatButton(
                

                onPressed: _toggle,
                child: new Icon(_obscureText ? (Icons.visibility_off):  (Icons.visibility)))),
           ] ),
      
        Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                 child:ClayContainer(
                    color: AppColor.bgcolor,
                     borderRadius: 15,
                     height:60,
                     //width: 200,
                     
                child: FlatButton(
                    onPressed:() 
                      //  passwordController.text == "" ||  nameController.text == "" ||  numberController.text == ""
                      //   ? null
                      //   : () {
                      //      print('Shubh');
                      //       setState(() {
                      //         _isLoading = true;
                      //       });
                      //       signIn(emailController.text,nameController.text,numberController.text,passwordController.text);
                      //       },
                    {
                    if(passwordController.text!="" && nameController.text !="" && numberController.text != "" && numberproceed==true &&  passwordproceed==true){
                    print('Signin working');
                      setState(() {
                              _isLoading = true;
                            });
                            signIn(emailController.text,nameController.text,numberController.text,passwordController.text);
                            
                    }
                    else{
                      print("Please enter valid number or email");
                      setState(() {
                          fillfields = true;
                          duplicate = false;
                          _isLoading = false;
                        });
            
                    }},


                    child: Text(
                      "Dine Up",
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primarytextcolor),
                    ),
)
                    )),
                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 40, 0, 20),
                      child: Text(
                      "Have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.white),
                    ),
                    ),
                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: 
                      FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                },

                    child: Text(
                      "Dine In?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primarytextcolor),
                    ),
                      
                    ),
                    ),
                     
                ],
              )
    ));
  }

  signIn(String email,name,number,pass) async {
    print("Working");
   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email,'name':name, 'number':number, 'password': pass};
    var jsonResponse = null;
    var response =
        await http.post("https://leomenu.com/leoapp/public/api/register", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    } 
    else if(response.statusCode == 500){
       setState(() {
        duplicate = true;
        fillfields = false;
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


  
}
