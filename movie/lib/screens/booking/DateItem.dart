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
      padding: EdgeInsets.only(right: superLargestPadding),
      child: Text(currentDate,
          style: TextStyle(
              color: Color.fromARGB(255, 145, 140, 136),
              fontWeight: FontWeight.bold)),
      //child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
    ));
  }
}
