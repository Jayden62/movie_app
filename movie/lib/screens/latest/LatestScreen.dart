import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/latest/LatestItem.dart';

class LatestScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> items = [];
    items.clear();
    items.add(LatestItem());

    return Container(
      padding: EdgeInsets.all(normalPadding),
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(
        children: <Widget>[
          Text(
            'Trailers',
            style: TextStyle(
              color: Color.fromARGB(255, 93, 104, 120),
            ),
          ),
          Container(
            child: ListView(
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}
