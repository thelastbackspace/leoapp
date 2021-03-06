import 'package:flutter/material.dart';
import 'package:leo/components/bottomnavbar.dart';
import 'package:leo/components/category_tile.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/dine_in.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import '../config/colors.dart';
import 'package:leo/views/food.dart';
import 'package:leo/views/menu.dart';

class Category extends StatefulWidget {
  Map<String, dynamic> newdata;
   Category({Key key, this.newdata}) : super(key: key);
  _Category createState() => _Category();
}

class _Category extends State<Category> {
  final _formKey = GlobalKey<FormState>();
  int categoryId;
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
   int _selectedIndex = 0;
   static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    //CategoryList(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
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
    // print(widget.newdata);
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;

    return Expanded(
            child: ListView.builder(
              itemCount: widget.newdata["categories"].length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryTile(
                image: 'images/pizza.jpg',
                title: widget.newdata["categories"][index]["name"],
                subtitle: widget.newdata["categories"][index]["description"],
                pushTo: Food(jsonData: widget.newdata, categoryId: widget.newdata["categories"][index]["id"]),
               
                );
              
              }),
            
          );
  }
}
