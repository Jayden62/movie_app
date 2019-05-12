import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';

class ScheduleItem extends BaseItem {
  final String time;

  ScheduleItem(this.time);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: Button(time,
          alignment: Alignment.center,
          height: 50,
          width: 80,
          margin: EdgeInsets.only(left: normalMargin),
          defaultStyle: TextStyle(
              color: Color.fromARGB(255, 209, 159, 89),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          defaultDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 209, 159, 89),
              )),
//          highlightDecoration: BoxDecoration(
//            borderRadius: BorderRadius.all(Radius.circular(8)),
//            border: Border.all(width: 1, color: Colors.grey),
//          ),
//          highlightStyle: TextStyle(
//              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
          enable: true,
          onPress: () {}),
    );
  }
}