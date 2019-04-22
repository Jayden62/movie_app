import 'package:flutter/material.dart';
import 'package:movie/middle/model/ScreenSize.dart';

class SlideItem extends StatelessWidget {

  /// Margin
  static const double MARGIN = 5.0;

  /// Space
  static const double SPACE = 60.0;

  /// Widget.
  final Widget widget;

  /// Margin left
  final double left;

  /// Margin right
  final double right;

  /// Size of screen
  final ScreenSize size;

  /// Padding and margin.
  final bool isSpace;

  /// Constructor
  SlideItem(this.size, this.widget, {this.left, this.right, this.isSpace});

  @override
  Widget build(BuildContext context) {
    /// Margin
    EdgeInsets margin;

    /// Width
    double width;

    if(isSpace == null || !isSpace){
      /// Margin
      margin = EdgeInsets.all(0);
      /// Width
      width = size.width.toDouble();
    }else {
      /// Width
      width = (size.width.toDouble() - SPACE);

      /// Margin left
      double marginLeft = MARGIN;
      if (left != null) {
        marginLeft += left;
      }

      /// Margin right
      double marginRight = MARGIN;
      if (right != null) {
        marginRight += right;
      }

      /// Margin
      margin = EdgeInsets.only(left: marginLeft, right: marginRight);

    }
//
//    /// Create item
//    return Container(
//      width: width,
//      margin: margin,
//      child: Image.network(
//          link,
//          width: width,
//          fit: BoxFit.fill),
//    );

    /// Create item
    return Container(
      width: width,
      margin: margin,
      child: widget
    );
  }
}
