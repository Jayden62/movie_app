import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/theater/DateItem.dart';
import 'package:movie/screens/theater/ScheduleItem.dart';
import 'package:movie/screens/theater/TheaterItem.dart';
import 'package:movie/utils/DateUtil.dart';

class TheaterScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(normalPadding),
        color: Color.fromARGB(255, 30, 42, 58),
        child: ListView(
          children: <Widget>[
            initName(),
            initFormat(),
            initSchedule(),
            initDate(),
            initCurrentDate(),
            initDivider(),
            initListTheater(),
          ],
        ));
  }

  Widget initName() {
    return Container(
      margin: EdgeInsets.only(top: smallerMargin),
      child: Center(
        child: Text(
          'END GAME',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: yellowColor),
        ),
      ),
    );
  }

  Widget initFormat() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Movie format',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text('ALL',
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 193, 27, 27)))
        ],
      ),
    );
  }

  Widget initSchedule() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
//      color: Color.fromARGB(255, 234, 239, 239),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          initToday(),
          initDay('T2'),
          initDay('T3'),
          initDay('T4'),
          initDay('T5'),
          initDay('T6'),
          initDay('T7'),
          initDay('CN'),
        ],
      ),
    );
  }

  Widget initDate() {
    List<DateItem> items = [];
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    items.add(DateItem('26'));
    return Container(
      height: 50,
      color: Color.fromARGB(255, 30, 42, 58),
      margin: EdgeInsets.only(top: smallerMargin),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }

  Widget initCurrentDate() {
    return Container(
      margin: EdgeInsets.only(top: smallerMargin),
      child: Center(
        child: Text(
          DateUtil().getCurrentDate(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget initDivider() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Divider(
        height: 1,
        color: Color.fromARGB(255, 242, 237, 237),
      ),
    );
  }

  Widget initListTheater() {
    List<Widget> items = [];
    items.add(TheaterItem(' NewWork ', '100', '18:30'));
    items.add(TheaterItem(' NewWork ', '100', '21:10'));
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: items,
      ),
    );
  }

  Widget initToday() {
    return Text(
      'Today',
      style: TextStyle(
          color: Color.fromARGB(255, 193, 27, 27),
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }

  Widget initDay(String day) {
    return Text(
      day,
      style: TextStyle(color: Color.fromARGB(255, 145, 140, 136), fontSize: 16),
    );
  }
}
