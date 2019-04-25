import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

EdgeInsets subTitleMargin = EdgeInsets.only(right: appBarHeight);
double heightMenu = 60.0;

var sizeIcon = 26.0;

TextStyle homeDefaultStyle =
    TextStyle(color: Colors.grey);

TextStyle homeHighlightStyle =
    TextStyle(color: yellowColor);

BoxShadow homeButtonBoxShadow = BoxShadow(
  color: Colors.black,
  offset: Offset(0.0, 5.0),
  blurRadius: 5.0,
);

BoxDecoration homeMenuDecoration = BoxDecoration(
    color: Color.fromARGB(255, 52, 64, 78), boxShadow: [homeButtonBoxShadow]);
