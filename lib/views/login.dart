import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leo/views/options.dart';
import 'package:leo/views/signup.dart';
import 'package:leo/views/mobile_signup.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:validators/validators.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _obscureText = true;
  bool invalidcredentails = false;
  bool invalidnumberemail = false;
  bool invalidpassword = false;
  bool invalidfields = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _password;
  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }


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
            child:
            Form(
              key: _formKey,
              child:ListView(
               //CrossAxisAlignment.center,
                children: <Widget>[
                  if(invalidcredentails==true)(
                   Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Enter Correct Credentails',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  )
                  )
                 
                
                  else if(invalidnumberemail==true)(
                     Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Please enter valid number or email',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  ))
                  else if(invalidpassword==true)(
                     Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Please enter valid password',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  ))
                  else if(invalidfields==true)(
                     Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Text('Please fill the fields',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Color.fromRGBO(255, 0, 0, 1),
                                      fontSize: 20,
                              ),
                          ),
                  )
                  ),

                  
                
Container(
  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text('Email/tring-tring:',
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
                  controller: emailController,
                  cursorColor: Colors.white,
                 // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Enter Email/Number',
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white24,
                    ),
                    border: InputBorder.none,
                    errorStyle: TextStyle(),
                  ),
                   validator: (value) =>
                  value.isEmpty ? 'Password cannot be blank' : null,
              // onSaved: (value) => _password = value,
            ),
                ),
            ),
             Container(
               padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text('Password:',
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
                TextFormField(
                  
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the valid code';
                    }
                    return null;
                  },
                ),
              )),
              Container(
                 padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                 alignment: Alignment.centerRight,
              child: FlatButton(
                

                onPressed: _toggle,
                child: new Icon(_obscureText ? (Icons.visibility_off):  (Icons.visibility)))),
           ] ),
      
        Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      
              
                 child:ClayContainer(
                    color: AppColor.bgcolor,
                     borderRadius: 15,
                     height:60,
                     //width: 200,
                     
                child: FlatButton(
                    child: Text(
                      "Dine In",
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primarytextcolor),
                    ),
                  onPressed:() {
                    if(emailController.text!="" && passwordController.text != ""){
                    print('Signin working');
                     setState(() {
                              _isLoading = true;
                            });
                            signIn(emailController.text, passwordController.text);
                    }
                    else if(emailController.text=="" && passwordController.text != ""){
                      print("Please enter valid number or email");
                      setState(() {
                          invalidnumberemail = true;
                           invalidpassword = true;
                          invalidfields = false;
                          invalidcredentails = false;
                          _isLoading = false;
                        });
                    }
                     else if(emailController.text!="" && passwordController.text == ""){
                      print("Please enter valid password");
                       setState(() {
                          invalidpassword = true;
                          invalidnumberemail = false;
                          invalidfields = false;
                          invalidcredentails = false;

                          _isLoading = false;
                        });
                    }
                    else if(emailController.text=="" && passwordController.text == ""){
                      print("Please enter valid credentails");
                      setState(() {
                          invalidfields = true;
                           invalidpassword = true;
                          invalidnumberemail = false;
                          invalidcredentails = false;
                          _isLoading = false;
                        });
                    }
                    },
                 )
                 )
                    ),
                    Padding(
                      padding:EdgeInsets.fromLTRB(0, 40, 0, 20),
                      child: Text(
                      "Don’t have an account?",
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
            MaterialPageRoute(builder: (BuildContext context) => MobileSignup()));
                },

                    child: Text(
                      "Dine Up?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.primarytextcolor),
                    ),
                      
                    ),
                    ),
                     Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                      "or Dine in via",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: AppColor.white),
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child:Image(
                image: AssetImage('images/google.png'),
                height: 50,
            ),),
            Padding(
                      padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child:
            Image(
                image: AssetImage('images/facebook.png'),
                height: 50,
            ),),
                ])],
              )
    )));
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isNumeric(email)){
      print("this is numeric");
      Map data = {'number': email, 'password': pass};
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
          sharedPreferences.setString("token", jsonResponse['token']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Options()),
              (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
    }
    else{
    Map data = {'email': email, 'password': pass};
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
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Options()),
            (Route<dynamic> route) => false);
      }
    }
    else if(response.statusCode == 401){
       setState(() {
        invalidcredentails = true;
         invalidpassword = true;
         invalidfields = false;
         invalidcredentails = false;
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
  }

}