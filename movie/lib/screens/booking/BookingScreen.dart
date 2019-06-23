import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/screens/booking/BookingHeader.dart';
import 'package:movie/screens/booking/DateItem.dart';
import 'package:movie/screens/booking/BookingItem.dart';
import 'package:movie/utils/DateUtil.dart';

class BookingScreen extends BaseScreen {
  final Movie item;

  final TAG = "BookingScreen";

  final List<String> daysOfWeek = ["T2", "T3", "t4", "T5", "T6", "T7", "CN"];
  final int lengthDay = 7;

  BookingScreen(this.item);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(normalPadding),
        color: Color.fromARGB(255, 30, 42, 58),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            initToday(),
            initSchedule(),
            initDate(),
            initCurrentDate(),
            initDivider(),
            Expanded(
              child: initTheaters(),
            ),
          ],
        ));
  }

  Widget initToday() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Today',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 193, 27, 27),
                fontSize: 16),
          ),
          Text('ALL',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 193, 27, 27)))
        ],
      ),
    );
  }

  Widget initSchedule() {
    var value = DateUtil().getCurrentDay();
    print(value);
    var shortDay = DateUtil().convertShortDay(value);
    print(shortDay);
    if (shortDay == "CN") {
      shortDay = "T8";
    }
    var temp = shortDay.split("T");
//    var temp = shortDay.length - 1;
    var result = int.parse(temp[1]);
    print(result);

    List<Widget> items = [];
    items.clear();

    for (int index = 0; index < lengthDay; index++) {
      var value = (index + result) % 7;
      var data = DateUtil().convertDayNumber(value);
      if (data == "8") {
        data = "CN";
        items.add(initDayItem(data));
      } else {
        items.add(initDayItem('T' + data));
      }
    }

    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      height: 20,
      alignment: Alignment.centerLeft,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: items),
    );
  }

  Widget initDate() {
    List<DateItem> items = [];
    items.clear();

    var value = DateUtil().getCurrentDayNumber();
    var result = int.parse(value);
    for (result; result <= 31; result++) {
      if (result < 10) {
        items.add(DateItem('0' + result.toString()));
      } else {
        items.add(DateItem(result.toString()));
      }
    }

    return Container(
      height: 50,
      color: Color.fromARGB(255, 30, 42, 58),
      margin: EdgeInsets.only(top: smallerMargin),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: items,
      ),
    );
  }

  Widget initCurrentDate() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          DateUtil().getCurrentDate(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          DateUtil().getCurrentDayEng(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    ));
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

  Widget initTheaters() {
    List<Widget> items = [];
    items.add(BookingItem('assets/photos/photo_cinema.png', 'Sub viet', '18:30',
        '25 Broad way, Boston', '5', item.name));
    items.add(BookingItem('assets/photos/photo_cinema.png', 'Sub viet', '18:30',
        '25 Broad way, Boston', '5', item.name));

    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: items,
      ),
    );
  }

  Widget initDayItem(String day) {
    return Container(
      padding: EdgeInsets.only(right: normalMargin),
      child: Text(
        day,
        style: TextStyle(color: Color.fromARGB(255, 145, 140, 136)),
      ),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: BookingHeader(
          item.name,
          onLeftPress: () {
            popScreen(context);
          },
        ));
  }
}
