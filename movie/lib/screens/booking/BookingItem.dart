import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/booking/ScheduleItem.dart';

class BookingItem extends BaseItem {
  final String theaterName;
  final String distance;
  final String time;

  BookingItem(this.theaterName, this.distance, this.time);

  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> items = [];
    items.add(ScheduleItem(time));
    items.add(ScheduleItem(time));
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'SB',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 209, 159, 89),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: smallerMargin),
                      child: Text(
                        theaterName,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Text(
                distance + "km",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 209, 159, 89),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: smallerMargin),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Color.fromARGB(255, 209, 159, 89),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: normalMargin),
                  child: Text('2D Sub Viet',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: EdgeInsets.only(top: smallerMargin),
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: items,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: normalMargin),
            child: Divider(
              height: 1,
              color: Color.fromARGB(255, 242, 237, 237),
            ),
          )
        ],
      ),
    );
  }
}
