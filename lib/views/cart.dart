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
import 'package:leo/views/food.dart';
import 'package:leo/views/juice.dart';
import 'package:leo/views/desert.dart';
import 'package:leo/views/burger.dart';
import 'package:leo/components/button.dart';
import 'package:leo/views/placeorder.dart';

class Cart extends StatefulWidget {
  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  final _formKey = GlobalKey<FormState>();
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;
    return Center(
        child: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "Cart",
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.primarytextcolor),
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
                              child: Image(
                                  image: AssetImage('images/coffee/1.jpg')),
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
                                        style: TextStyle(color: Colors.white))),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  "Assam Tea",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 99 ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        "₹149 ",
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
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(6, 0, 6, 0),
                                            child: Text('-',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ))),
                                      ),
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: AppColor.bgcolor,
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Text('1',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ))),
                                      ),
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: AppColor.primarytextcolor,
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(3, 0, 3, 0),
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
                              child: Image(
                                  image: AssetImage('images/coffee/4.jpg')),
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
                                        style: TextStyle(color: Colors.white))),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  "Cafe Latte",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "₹ 299 ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        "₹399 ",
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
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(6, 0, 6, 0),
                                            child: Text('-',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ))),
                                      ),
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: AppColor.bgcolor,
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Text('1',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ))),
                                      ),
                                      Badge(
                                        shape: BadgeShape.square,
                                        badgeColor: AppColor.primarytextcolor,
                                        borderRadius: BorderRadius.circular(5),
                                        badgeContent: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(3, 0, 3, 0),
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
           Container(
              padding: const EdgeInsets.all(20.0),
              child: RaisedGradientButton(
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                        fontSize: 20, color: AppColor.primarytextcolor),
                  ),
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlaceOrder()),
                      );
                    
                  }),
            ),
    ]));
  }
}
