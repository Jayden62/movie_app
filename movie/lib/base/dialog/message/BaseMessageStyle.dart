import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

/// Margin or  padding

EdgeInsets messageMargin = EdgeInsets.only(
    top: normalMargin,
    left: normalMargin,
    bottom: normalMargin,
    right: normalMargin);
EdgeInsets messagePadding = EdgeInsets.only(top: smallerPadding);
EdgeInsets titleMargin =
    EdgeInsets.only(top: largerMargin, left: normalMargin, right: normalMargin);
EdgeInsets contentPadding = EdgeInsets.all(0.0);

/// Style

TextStyle titleStyle = TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: largestFont);
TextStyle messageStyle = TextStyle(color: Colors.black);
TextStyle defaultStyleDialog =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

/// Default background of button
BoxDecoration defaultDecorationDialog = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(smallerRadius),
        bottomRight: Radius.circular(smallerRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[Colors.white, Colors.white],
    ),
    boxShadow: [buttonBoxShadow]);

/// Highlight background of button
BoxDecoration highlightDecorationDialog = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(smallerRadius),
        bottomRight: Radius.circular(smallerRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[grayColor, grayColor],
    ),
    boxShadow: [buttonBoxShadow]);
