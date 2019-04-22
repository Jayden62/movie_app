import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';

class TheaterScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(normalPadding),
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(
        children: <Widget>[],
      ),
    );
  }
}
