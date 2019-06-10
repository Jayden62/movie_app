import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/home/HomeStyle.dart';

class BookingHeader extends BaseHeader {
  final String title;

  final Function() onLeftPress;

  BookingHeader(this.title, {this.onLeftPress});

  @override
  Widget onInitHeader(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
        /// Remove background of appbar
        backgroundColor: Color.fromARGB(255, 30, 42, 58),
        centerTitle: true,
        elevation: 0,
        title: Center(
            child: Container(
          margin: subTitleMargin,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: yellowColor),
          ),
        )),

        /// Icon close or back
        leading: GestureDetector(
            onTap: () {
              onLeftPress();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back,
                color: yellowColor,
              ),
              width: appBarHeight,
              height: appBarHeight,
            )),
      )),
    );
  }
}
