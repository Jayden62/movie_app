import 'package:flutter/material.dart';
import 'package:movie/base/header/BaseHeader.dart';
import 'package:movie/base/style/BaseStyle.dart';

class MovieHeader extends BaseHeader {
  final ValueChanged<int> onTap;
  MovieHeader(this.onTap);
  @override
  Widget onInitHeader(BuildContext context) {
    return Container(
        child: AppBar(
      /// Remove background of appbar
      backgroundColor: Color.fromARGB(255, 30, 42, 58),
      elevation: 0,
      bottom: TabBar(
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        onTap: onTap,
        tabs: <Widget>[
          initTitle('Showing'),
//          initTitle('Special'),
          initTitle('Coming soon'),
        ],
      ),
    ));
  }

  Widget initTitle(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: normalMargin),
      child: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
