import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';

class DateItem extends BaseItem {
  final String currentDate;

  DateItem(this.currentDate);

  @override
  Widget onInitBody(BuildContext context) {
    return InkWell(
        child: Container(
      margin: EdgeInsets.only(right: normalMargin),
      padding: EdgeInsets.all(smallPadding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //borderRadius: new BorderRadius.circular(30.0),
        color: Color.fromARGB(255, 127, 17, 17),
      ),
      child: Text(currentDate,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
    ));
  }
}
