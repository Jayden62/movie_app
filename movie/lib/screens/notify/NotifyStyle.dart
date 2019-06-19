import 'package:flutter/material.dart';

BoxShadow notifyBoxShadow = BoxShadow(
  color: Colors.transparent,
  offset: Offset(0.0, 5.0),
  blurRadius: 5.0,
);

var radius = 8.0;

BoxDecoration notifyDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: Color.fromARGB(255, 52, 64, 78),
    boxShadow: [notifyBoxShadow]);