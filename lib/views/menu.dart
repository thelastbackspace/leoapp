import 'package:flutter/material.dart';
import 'package:leo/components/bottomnavbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/dine_in.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import '../config/colors.dart';
import 'package:leo/views/food.dart';
import 'package:leo/views/category.dart';

class Menu extends StatefulWidget {
   Map<String, dynamic> jsonData;
   Menu({Key key, this.jsonData}) : super(key: key);
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data;
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
   int _selectedIndex = 0;
     List<Widget> _widgetOptions;
   static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    @override  
    void initState() {
    super.initState();
   _widgetOptions =[
    Category(newdata:widget.jsonData),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
     Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];
    }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // print(widget.jsonData["branch"][0]["name"]);
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;

    //return  _widgetOptions[_selectedIndex];
    return 
    Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.jsonData["branch"][0]["name"],
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
                              style:
                                  TextStyle(color: AppColor.primarytextcolor),
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
                              style:
                                  TextStyle(color: AppColor.primarytextcolor),
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
                              style:
                                  TextStyle(color: AppColor.primarytextcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
         _widgetOptions[_selectedIndex],
        ]
    );     
  }
}