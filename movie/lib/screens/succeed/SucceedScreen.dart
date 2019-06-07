import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';

class SucceedScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      padding: EdgeInsets.all(normalPadding),
      child: ListView(
        children: <Widget>[],
      ),
    );
  }

  Widget initPhoto() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: ClipOval(

        ),
      ),
    );
  }
}
