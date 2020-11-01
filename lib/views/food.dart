import 'package:flutter/material.dart';
import 'package:leo/components/bottomnavbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/dine_in.dart';
import 'package:leo/views/main_layout_backup.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:leo/views/main_layout.dart';
import '../config/colors.dart';
import 'package:badges/badges.dart';
import 'package:leo/views/caffiene.dart';
import 'package:leo/views/juice.dart';
import 'package:leo/views/desert.dart';
import 'package:leo/views/burger.dart';


class Food extends StatefulWidget {
  @override
  _Food createState() => _Food();
}

class _Food extends State<Food> {
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;
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
                  child: Text("<",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.primarytextcolor,
                      )),
                  onTap: () {})),
        ],
      ),
      backgroundColor: AppColor.bgcolor,
      body: 
      Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Writer's Cafe",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColor.primarytextcolor),
              ),
              Image.asset(
                'images/dine_in.png',
                fit: BoxFit.cover,
                height: 40,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x7f0a0a0a),
                          blurRadius: 10,
                          offset: Offset(-5, -5),
                        ),
                        BoxShadow(
                          color: Color(0x4c262626),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                        ),
                      ],
                      color: Color(0xff181818),
                    ),
                    child: TextFormField(
                      //textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'What are you looking for?',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white24,
                        ),
                        border: InputBorder.none,
                        errorStyle: TextStyle(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white24,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter the valid code';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: AppColor.primarytextcolor,
                            value: this.valuefirst,
                            onChanged: (bool value) {
                              setState(() {
                                this.valuefirst = value;
                              });
                            },
                          ),
                          Text(
                            'Veg',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColor.primarytextcolor),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: AppColor.primarytextcolor,
                            value: this.valuesecond,
                            onChanged: (bool value) {
                              setState(() {
                                this.valuesecond = value;
                              });
                            },
                          ),
                          Text(
                            'Non-Veg',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColor.primarytextcolor),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: AppColor.primarytextcolor,
                            value: this.valuethird,
                            onChanged: (bool value) {
                              setState(() {
                                this.valuethird = value;
                              });
                            },
                          ),
                          Text(
                            'Jain',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColor.primarytextcolor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        Wrap(
            alignment: WrapAlignment.spaceEvenly,
             runAlignment: WrapAlignment.center,
            spacing: 40.0, // gap between adjacent chips
             runSpacing: 25.0, // gap between lines
            children: <Widget>[
              ClayContainer(
                  color: baseColor,
                  //height: 100,
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
                                      badgeColor: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Veg',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    "Barbaque Pizza",
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
                                        "₹ 599 ",
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
                                        Badge(
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
                                        Badge(
                                          shape: BadgeShape.square,
                                          badgeColor: AppColor.bgcolor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          badgeContent: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 0),
                                              child: Text('0',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ))),
                                        ),
                                        Badge(
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
                                      ]),
                                ),
                              ]),
                        )
                      ],
                    ),
                  )),
              ClayContainer(
                  color: baseColor,
                  //height: 100,
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
                                child: Image(image: AssetImage('images/pizza/3.jpg')),
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
                                      badgeColor: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Veg',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    "Italino Pizza",
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
                                        "₹ 899 ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          "₹999 ",
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
                                        Badge(
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
                                        Badge(
                                          shape: BadgeShape.square,
                                          badgeColor: AppColor.bgcolor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          badgeContent: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 0),
                                              child: Text('0',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ))),
                                        ),
                                        Badge(
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
                                      ]),
                                ),
                              ]),
                        )
                      ],
                    ),
                  )),
              
              ]),
      ]),
      floatingActionButton: FloatingActionButton(
       onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return ClayContainer(
                height: 250,
                color: AppColor.bgcolor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      badgeColor: AppColor.primarytextcolor,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Pizza',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                          onTap: () {
                            Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Food(),
                          ),
                        );
                          }
                      ),
                  
                     InkWell(
                          child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      badgeColor: AppColor.primarytextcolor,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Burgers',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                          onTap: () {
                            Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Burger(),
                          ),
                        );
                          }
                      ),
                      InkWell(
                          child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      badgeColor: AppColor.primarytextcolor,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Caffiene',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                          onTap: () {
                            Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Caffiene(),
                          ),
                        );
                          }
                      ),
                      InkWell(
                          child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      badgeColor: AppColor.primarytextcolor,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Juice',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                          onTap: () {
                            Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Juice(),
                          ),
                        );
                          }
                      ),
                      InkWell(
                          child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Badge(
                                      shape: BadgeShape.square,
                                      badgeColor: AppColor.primarytextcolor,
                                      borderRadius: BorderRadius.circular(5),
                                      badgeContent: Text('Desert',
                                          style:
                                              TextStyle(color: Colors.white))),
                                ),
                          onTap: () {
                            Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Desert(),
                          ),
                        );
                          }
                      ),
                      ElevatedButton(
                        child: const Text('Back'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
     
        });
          },
        child: Icon(Icons.menu),
        backgroundColor: AppColor.primarytextcolor,
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
