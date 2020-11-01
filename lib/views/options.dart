import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/scan.dart';
import 'package:leo/views/dine_in.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/rendering.dart';

class Options extends StatefulWidget {
  @override
  _Options createState() => _Options();
}

class _Options extends State<Options> {
  @override
  Widget build(BuildContext context) {
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
        body: Center(
            child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => DineIn()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/dine_in.png')),
                      ),
                      Container(
                        child: Text(
                          "Dine In",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/takeaway.png')),
                      ),
                      Container(
                        child: Text(
                          "Take Away",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/happy_hours.png')),
                      ),
                      Container(
                        child: Text(
                          "Happy Hours",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/nearby.png')),
                      ),
                      Container(
                        child: Text(
                          "Nearby",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/inhouse_delivery.png')),
                      ),
                      Container(
                        child: Text(
                          "Inhouse Delivery",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               NeuCard(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Image(
                            height: 80,
                            image: AssetImage('images/table_reservation.png')),
                      ),
                      Container(
                        child: Text(
                          "Table Reservation",
                          style: TextStyle(
                              fontSize: 12, color: AppColor.primarytextcolor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          ],
        )));
  }
}
