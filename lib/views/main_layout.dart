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
import 'package:leo/views/profile.dart';

class MainLayout extends StatefulWidget {
  Map<String, dynamic> data;

  MainLayout({Key key, this.data}) : super(key: key);
  @override
  _MainLayout createState() => _MainLayout();

}

class _MainLayout extends State<MainLayout> {
 
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> data;
  
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;
   int _selectedIndex = 0;
   
   List<Widget> _widgetOptions;
   static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    @override  
    void initState() {
    
    super.initState();
   
   _widgetOptions =[
    Menu(jsonData:widget.data),
    Cart(),
    ProfilePage(),
    Text(
      'Index 2: School',
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
    //print(widget.data);
    Color baseColor = Color(0xFF181818);
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
                onTap: () {},
              )),
        ],
      ),
      backgroundColor: AppColor.bgcolor,
      body:  _widgetOptions[_selectedIndex],
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
         ),
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
