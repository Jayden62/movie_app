import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/home/HomeStyle.dart';

class HomeHeader extends BaseHeader {
  final String title;

  HomeHeader(this.title);

  @override
  Widget onInitHeader(BuildContext context) {
    return Container(
        child: AppBar(
      /// Remove background of appbar
      backgroundColor: Color.fromARGB(255, 30, 42, 58),
      centerTitle: true,
      elevation: 0,
      title: Center(
          child: Container(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: yellowColor),
          textAlign: TextAlign.center,
        ),
      )),

      /// Icon close or back
      leading: InkWell(
          onTap: () {},
          child: Container(
            child: Icon(Icons.person, color: yellowColor),
            width: appBarHeight,
            height: appBarHeight,
          )),
      actions: <Widget>[
        Container(
            margin: EdgeInsets.only(right: smallerMargin, top: 12),
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  size: 26,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(minHeight: 12, minWidth: 12),
                    child: Text(
                      '9+',
                      style: TextStyle(color: Colors.white, fontSize: 9),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
