import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';

class FailHeader extends BaseHeader {
  final String title;
  final Function() onLeftPress;

  FailHeader(this.title, {this.onLeftPress});

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
              child: Icon(Icons.arrow_back, color: yellowColor),
              width: appBarHeight,
              height: appBarHeight,
            )),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: normalMargin),
            child: Icon(
              Icons.sms_failed,
              color: yellowColor,
            ),
          )
        ],
      )),
    );
  }
}
