import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/movie/MovieStyle.dart';

class ComingSoonItem extends BaseItem {
  final String image, name, time, countdown;

  ComingSoonItem(this.image, this.name, this.time, this.countdown);

  @override
  Widget onInitBody(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: normalMargin),
        color: Color.fromARGB(255, 30, 42, 58),
        elevation: 4.0,
        child: Container(
            height: 280,
            constraints: BoxConstraints.expand(
              height: 220,
            ),
            alignment: Alignment.bottomRight,
//          padding: EdgeInsets.only(left: smallMargin, bottom: smallerMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
                decoration: comingSoonDecoration,
                height: heightComingSoon,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: smallerMargin),
                          child: Row(
                            children: <Widget>[
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
//
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: smallestMargin),
                          child: Text(
                            time,
                            style: TextStyle(
                              color: Color.fromARGB(255, 93, 104, 120),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(smallestPadding),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 239, 22, 7))),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.event,
                                color: Color.fromARGB(255, 239, 22, 7),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                countdown,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 239, 22, 7),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}
