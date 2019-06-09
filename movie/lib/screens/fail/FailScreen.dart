import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';

class FailScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      padding: EdgeInsets.all(normalPadding),
      child: ListView(
        children: <Widget>[
          initPhoto(),
          initTitle(),
        ],
      ),
    );
  }

  Widget initPhoto() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Image.asset(
          'assets/photos/report.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget initTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: normalMargin),
      child: Text(
        'Sorry. try again !',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      ),
    );
  }
}
