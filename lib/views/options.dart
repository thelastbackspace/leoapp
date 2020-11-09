import 'package:flutter/material.dart';
import 'package:leo/components/appbar.dart';
import 'package:leo/config/colors.dart';
import 'package:leo/components/card.dart';
import 'package:leo/views/coming_soon.dart';
import 'package:leo/views/scan.dart';
import 'package:leo/views/dine_in.dart';
import '../config/colors.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/rendering.dart';
import 'package:leo/views/enter_manually.dart';

class Options extends StatefulWidget {
  @override
  _Options createState() => _Options();
}

class _Options extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar().defaultAppBar(),
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
                       MaterialPageRoute(builder: (context) => Scan()),
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
