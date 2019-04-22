import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';

class MenuItem extends BaseItem {
  final String title;
  final Icon icon;

  MenuItem(this.icon, this.title);

  @override
  Widget onInitBody(BuildContext context) {
    return InkWell(
        onTap: () {
          print('hightlight item.');
        },
        splashColor: Color.fromARGB(255, 30, 42, 58),
        highlightColor: Color.fromARGB(255, 183, 169, 168),
        child: Container(
            margin: EdgeInsets.only(
                top: largerMargin, left: normalMargin, right: normalMargin),
            child: Row(
              children: <Widget>[
                Container(child: icon),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    title,
                    style: TextStyle(color: Color.fromARGB(255, 93, 104, 120)),
                  ),
                )
              ],
            )));
  }
}
