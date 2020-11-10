import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:leo/views/options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leo/views/login.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/button.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:badges/badges.dart';

class Cart extends StatefulWidget {
  Map data;
   Cart({Key key, this.data}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
   List<dynamic> jsonData;
     List<Map> filteredList;
  bool _isLoading = false;
  bool _obscureText = true;
  bool duplicate = false;
  bool numberproceed = false;
  bool passwordproceed = false;
  bool resent = false;
    int userid;
    SharedPreferences sharedPreferences;
//  bool duplicatenumber = false;
  final TextEditingController nameController = new TextEditingController();
  //final TextEditingController emailController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();
  //final TextEditingController passwordController = new TextEditingController();
 
 _nameRetriever()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getInt("user");
    String userintid = userid.toString();
    print(userintid);
    getCart(userintid,"1");
   }

  
  @override
  void initState() {
    
   _nameRetriever();
    print("Shubh");
    super.initState();
    
  }

  addmycart(itemid,userid,restid,itemname,itemtype,itemprice) async {
    print("Working");
    
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {'item_id' : itemid, 
                        'user_id' : userid,
                        'rest_id' : restid,
                        'item_name' : itemname,
                        'item_type' : itemtype,
                        'item_price' : itemprice,
                    };
                    print(data);
                    
        var response = await http.post(Uri.encodeFull("https://leomenu.com/leoapp/public/api/addtocart"), body: data);
        if (response.statusCode == 200) {
      print('updated');
    } 
   }
     removemycart(itemid,userid,restid,itemname,itemtype,itemprice) async {
    print("Working");
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Map<String, dynamic> data = {'item_id' : itemid, 
                        'user_id' : userid,
                        'rest_id' : restid,
                        'item_name' : itemname,
                        'item_type' : itemtype,
                        'item_price' : itemprice,
                    };
          var response = await http.post(Uri.encodeFull("https://leomenu.com/leoapp/public/api/removefromcart"), body: data);
        if (response.statusCode == 200) {
           print('removed');
    } 
    } 
  @override
  Widget build(BuildContext context) {
    //print(filteredList);
    print(userid);
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
  
      backgroundColor: AppColor.bgcolor,
      body: 
      Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
         child:
        Expanded(
        child: GridView.builder(
              
              itemCount: jsonData.length,

              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
   childAspectRatio: MediaQuery.of(context).size.height / 1200,),
              itemBuilder: (BuildContext context, int index) {
                return 

                Padding(
                  padding:const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  child:ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.4,
                  borderRadius: 10,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 160,
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                heightFactor: 0.50,
                                child: Image(image: AssetImage('images/pizza/4.jpg')),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      
                                      badgeColor: getItemBadgeColor(jsonData[index]["item_type"]),
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text( jsonData[index]["item_type"],
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    jsonData[index]["item_name"],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        jsonData[index]["item_rate"].toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          "₹799 ",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                        onTap: () {
                                          print("Tapped -");
                                          //removefromcart(filteredList[index]);
                                           removemycart(jsonData[index]["id"].toString(),userid.toString(),"1",jsonData[index]["item_name"].toString(), jsonData[index]["item_type"].toString(), jsonData[index]["item_rate"].toString());
                                        },
                                        child:Badge(
                                          shape: BadgeShape.square,
                                          badgeColor: AppColor.primarytextcolor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          badgeContent: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  6, 0, 6, 0),
                                              child: Text('-',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ))),
                                        ),
                                        ),
                                        Badge(

                                          shape: BadgeShape.square,
                                          badgeColor: AppColor.bgcolor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          badgeContent: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 0),
                                              child: Text("0",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ))),
                                        ),
                                        GestureDetector(
                                        onTap: () {
                                          print("Tapped +");
                                          //addtocart(filteredList[index]);
                                          addmycart(jsonData[index]["id"].toString(),userid.toString(),"1",jsonData[index]["item_name"].toString(), jsonData[index]["item_type"].toString(), jsonData[index]["item_rate"].toString());
                                          // var mycart = Provider.of<CartList>(context, listen: false);
                                          // mycart.addtocart(item);
                                        },
                                        child: Badge(
                                          shape: BadgeShape.square,
                                          badgeColor: AppColor.primarytextcolor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          badgeContent: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 0),
                                              child: Text('+',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ))),
                                        ),
                                        ),
                                      ]),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
        ));

      }
      )
      
         ) )]
      )); }
Color getItemBadgeColor(String itemType) {
 if (itemType == "Veg") {
    return Colors.green;
 } else if (itemType == "Non-veg"){
   return Colors.red;
 }
   else if (itemType == "Jain"){
   return Colors.blue;
  }
}

  getCart(userid,restid) async {
    print("Working");
    Map data = {'user_id':userid, 'rest_id':restid};
    print(data);
    var jsonResponse = null;
         var response = await http.post(Uri.encodeFull("https://leomenu.com/leoapp/public/api/getcart"), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      jsonData = new List<String>.from(jsonResponse);
     if (jsonResponse != null) {
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(builder: (BuildContext context) => Options()),
          //     (Route<dynamic> route) => false);
      }
    } 
    else {
      print(response.body);
    }
  }
}


 