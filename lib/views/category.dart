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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.8,
                  borderRadius: 10,
                  child: GestureDetector(
                    onTap: () { 
                      Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Food(),
                          ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                height: 100,
                                image: AssetImage('images/pizza.jpg')),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Pizza",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Explore our varieteies",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  "See all >",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.primarytextcolor),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.8,
                  borderRadius: 10,
                  child: GestureDetector(
                    onTap: () { 
                      Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Food(),
                          ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                height: 100,
                                image: AssetImage('images/burger.jpg')),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Burgers",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Aren't they mouth-watering",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  "See all >",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.primarytextcolor),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.8,
                  borderRadius: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ComingSoon()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                height: 100,
                                image: AssetImage('images/coffee.jpg')),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Caffeine",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Let us help you with the work",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  "See all >",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.primarytextcolor),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.8,
                  borderRadius: 10,
                  child: GestureDetector(
                    onTap: () { 
                      Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Food(),
                          ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                height: 100,
                                image: AssetImage('images/Juice.jpg')),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Juices",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "It's time to be healthy",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  "See all >",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.primarytextcolor),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ClayContainer(
                  color: baseColor,
                  height: 100,
                  width: width * 0.8,
                  borderRadius: 10,
                  child: GestureDetector(
                    onTap: () { 
                      Navigator.pushReplacement(
                            context, 
                            PageRouteBuilder(
                              pageBuilder: (context, a1, a2) => Food(),
                          ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image(
                                height: 100,
                                image: AssetImage('images/desert.jpg')),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Deserts",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Text(
                                  "Right at the end for you",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  "See all >",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.primarytextcolor),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ]),
          );    
  }
}
