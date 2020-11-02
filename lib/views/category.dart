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
  @override
  _Category createState() => _Category();
}

class _Category extends State<Category> {
  final _formKey = GlobalKey<FormState>();
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
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;

    return Expanded(
            child: ListView(shrinkWrap: true, children: <Widget>[
              //alignment: WrapAlignment.spaceEvenly,
              // runAlignment: WrapAlignment.start,
              CategoryTile(
                image: 'images/pizza.jpg',
                title: 'Pizza',
                subtitle: 'Explore our varieteies',
                pushTo: Food(),
              ),
              CategoryTile(
                image: 'images/burger.jpg',
                title: 'Burgers',
                subtitle: "Aren't they mouth-watering",
                pushTo: Food(),
              ),
              CategoryTile(
                image: 'images/coffee.jpg',
                title: 'Coffee',
                subtitle: "Let us help you with the work",
                pushTo: Food(),
              ),
              CategoryTile(
                image: 'images/Juice.jpg',
                title: 'Juices',
                subtitle: "It's time to be healthy",
                pushTo: Food(),
              ),
              CategoryTile(
                image: 'images/desert.jpg',
                title: 'Desserts',
                subtitle: "Right at the end for you",
                pushTo: Food(),
              ),
              ]
            ),
          );
  }
}
