import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/booking/BookingStyle.dart';
import 'package:movie/screens/booking/ScheduleItem.dart';
import 'package:movie/screens/feature/FeatureScreen.dart';

class BookingItem extends BaseItem {
  final String photo;
  final String type;
  final String showingTime;
  final String address;
  final String km;

  BookingItem(this.photo, this.type, this.showingTime, this.address, this.km);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: normalMargin, left: normalMargin),
      padding: EdgeInsets.all(normalPadding),
      decoration: bookingDecoration,
      child: Column(
        children: <Widget>[
          createPhoto(photo),
          createShowing(),
          createType(type),
          createAddress(context, address)
        ],
      ),
    );
  }

  Widget createAddress(BuildContext context, String address) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              address,
              style: TextStyle(color: Colors.white),
            ),
          ),
          createDirection(context, km),
        ],
      ),
    );
  }

  Widget createDirection(BuildContext context, String km) {
    return GestureDetector(
        onTap: () {
          pushScreen(context, FeatureScreen());
        },
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                km + "km",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: smallestMargin),
              child: Icon(
                Icons.directions,
                color: Colors.blue,
              ),
            ),
          ],
        ));
  }

  Widget createType(String type) {
    return Container(
        margin: EdgeInsets.only(top: smallerMargin),
        child: Row(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: Colors.deepOrange,
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: smallerMargin),
            child: Text(type,
                style: TextStyle(
                    color: Color.fromARGB(255, 209, 159, 89),
                    fontWeight: FontWeight.bold)),
          ),
        ]));
  }

  Widget createShowing() {
    List<Widget> items = [];
    items.add(ScheduleItem(showingTime));
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: superLargestMargin),
        height: 50,
        child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: items));
  }

  Widget createPhoto(String photo) {
    return Container(
      child: Image.asset(
        photo,
      ),
    );
  }
}
