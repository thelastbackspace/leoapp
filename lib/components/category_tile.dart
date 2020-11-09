import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leo/config/colors.dart';

class CategoryTile extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final Widget pushTo;

  CategoryTile({ this.image, this.title, this.subtitle, this.pushTo});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    Color baseColor = Color(0xFF181818);
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ClayContainer(
          color: baseColor,
          height: 100,
          width: width * 0.8,
          borderRadius: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, a1, a2) => widget.pushTo,
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
                        image: AssetImage(widget.image)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        Container(
                          width: (width*0.8) - 100,
                          height: 23,
                          child: Text(
                            widget.subtitle,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
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
    );
  }
}
