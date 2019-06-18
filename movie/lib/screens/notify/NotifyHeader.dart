import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';

class NotifyHeader extends BaseHeader {
  final String title;
  final Function() onRightPress;

  NotifyHeader(this.title, {this.onRightPress});

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
            style: TextStyle(color: yellowColor),
            textAlign: TextAlign.center,
          ),
        )),

        /// Icon close or back
        leading: GestureDetector(
            onTap: () {
              onRightPress();
            },
            child: Container(
              child: Icon(Icons.arrow_back, color: yellowColor),
              width: appBarHeight,
              height: appBarHeight,
            )),
      )),
    );
  }
}
