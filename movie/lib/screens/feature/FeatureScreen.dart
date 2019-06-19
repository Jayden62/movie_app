import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/feature/FeatureHeader.dart';

class FeatureScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/photos/photo_direction.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: normalMargin),
                child: Text(
                  'This feature is temporarily under development.',
                  style: TextStyle(color: Colors.white70),
                ),
              )
            ]));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: FeatureHeader(
          'Feature',
        ));
  }
}
