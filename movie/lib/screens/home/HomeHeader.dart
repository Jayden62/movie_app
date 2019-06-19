import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';

class HomeHeader extends BaseHeader {
  final String title;

  final Function() onLeftPress;
  final Function() onRightPress;

  HomeHeader(this.title, {this.onLeftPress, this.onRightPress});

  @override
  Widget onInitHeader(BuildContext context) {
    String count = '3';
    return Container(
      child: Scaffold(
          appBar: AppBar(
        /// Remove background of appbar
        backgroundColor: Color.fromARGB(255, 30, 42, 58),
        centerTitle: true,
        elevation: 0,
        title: Center(
            child: Container(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: yellowColor),
            textAlign: TextAlign.center,
          ),
        )),

        /// Icon close or back
        leading: GestureDetector(
            onTap: () {
              onLeftPress();
            },
            child: Container(
              child: Icon(Icons.person, color: yellowColor),
              width: appBarHeight,
              height: appBarHeight,
            )),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              onRightPress();
            },
            child: Container(
                margin: EdgeInsets.only(right: smallerMargin, top: 12),
                child: Stack(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      size: 26,
                      color: yellowColor,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints:
                            BoxConstraints(minHeight: 12, minWidth: 12),
                        child: Text(
                          count,
                          style: TextStyle(color: Colors.white, fontSize: 9),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
