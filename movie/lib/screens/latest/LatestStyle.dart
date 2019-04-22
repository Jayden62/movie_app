import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

var maxLength = 11;

double widthBorder = 1;

double widthSpace = 20.0;

double cardHeight = 140.0;

double height = 60.0;

double radius = 5.0;

double borderRadius = 2.0;

double blurRadius = 2.0;

double photoSize = 80.0;

int maxLinesSearch = 1;
int maxLengthSearch = 11;

EdgeInsets contentPaddingSearch = EdgeInsets.only(
    left: smallerPadding,
    right: smallerPadding,
    top: normalPadding,
    bottom: normalPadding);

var searchMargin =
EdgeInsets.only(left: normalMargin, top: normalMargin, right: normalMargin);
var cardMargin = EdgeInsets.only(left: 50.0, right: normalMargin);

var containerMargin = EdgeInsets.only(top: normalMargin, left: 60.0);

var searchDecoration = BoxDecoration(
    border: Border.all(color: grayColor),
    borderRadius: BorderRadius.all(Radius.circular(radius)));

var questionDecoration = BoxDecoration(
    border: Border.all(color: grayColor),
    borderRadius: BorderRadius.all(Radius.circular(radius)));

var cardDecoration = BoxDecoration(
  color: Colors.white,
  shape: BoxShape.rectangle,
  borderRadius: BorderRadius.circular(radius),
  boxShadow: <BoxShadow>[
    BoxShadow(color: Colors.black, blurRadius: blurRadius)
  ],
);
