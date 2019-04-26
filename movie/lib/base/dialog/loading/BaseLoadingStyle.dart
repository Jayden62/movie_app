import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

/// Color
Color colorLoading = Color.fromARGB(255, 46, 147, 135);

/// Padding or margin
EdgeInsets contentPadding = EdgeInsets.all(normalPadding);
EdgeInsets loadingMargin =
    EdgeInsets.only(top: normalMargin, left: normalMargin);
EdgeInsets waitingMargin = EdgeInsets.only(
    bottom: normalMargin, top: smallestMargin, left: normalMargin);

/// Style

TextStyle loadingStyle =
    TextStyle(fontWeight: FontWeight.bold, color: colorLoading);

TextStyle waitingStyle = TextStyle(color: Colors.white,fontSize: 16);


