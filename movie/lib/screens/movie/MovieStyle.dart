import 'package:flutter/material.dart';

double heightMovie = 60.0;

BoxShadow movieBoxShadow = BoxShadow(
  color: Colors.transparent,
  offset: Offset(0.0, 5.0),
  blurRadius: 5.0,
);

var movieRadius = 8.0;

BoxDecoration movieDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(movieRadius)),
    color: Color.fromARGB(255, 52, 64, 78),
    boxShadow: [movieBoxShadow]);

double heightComingSoon = 60.0;
double comingSoonRadius = 8.0;

BoxDecoration comingSoonDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(comingSoonRadius),
        bottomRight: Radius.circular(comingSoonRadius)),
    color: Colors.white);
