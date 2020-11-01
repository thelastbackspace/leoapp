import 'package:flutter/material.dart';
import 'package:leo/components/bottomnavbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/dine_in.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import '../config/colors.dart';
import 'package:leo/views/menu.dart';
import 'package:leo/views/cart.dart';

class BookingLayout extends StatefulWidget {
  @override
  _BookingLayout createState() => _BookingLayout();
}

class _BookingLayout extends State<BookingLayout> {
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
   int _selectedIndex = 0;
   static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 static List<Widget> _widgetOptions = <Widget>[
    Menu(),
    Cart(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              padding: EdgeInsets.only(right: 20.0, top: 0.0),
              child: InkWell(
                child: Text("<",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primarytextcolor,
                    )),
                onTap: () {},
              )),
        ],
      ),
      backgroundColor: AppColor.bgcolor,
      body: 
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'The Bowl Company',
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
        _widgetOptions.elementAt(_selectedIndex),
         ],
      ),
      bottomNavigationBar: 
      ClayContainer(
         color: baseColor,
        child: BottomNavigationBar(
          backgroundColor: baseColor,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label: "Home",
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.shopping_cart),
           label: "Cart",
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: "Profile",
         )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      ),
    );
  }
}
