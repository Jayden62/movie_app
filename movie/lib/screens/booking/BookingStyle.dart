import 'package:flutter/material.dart';

BoxShadow bookingBoxShadow = BoxShadow(
  color: Colors.transparent,
  offset: Offset(0.0, 5.0),
  blurRadius: 5.0,
);

var radius = 8.0;

BoxDecoration bookingDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: Colors.white30,
    boxShadow: [bookingBoxShadow]);
