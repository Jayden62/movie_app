import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/notify/NotifyStyle.dart';
import 'package:movie/utils/DateUtil.dart';

class NotifyItem extends BaseItem {
  final String image, title, content;

  NotifyItem(this.image, this.title, this.content);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      decoration: notifyDecoration,
      margin: EdgeInsets.only(top: normalMargin),
      padding: EdgeInsets.all(normalPadding),
      child: Row(
        children: <Widget>[createPhoto(image), createContent(title, content)],
      ),
    );
  }

  Widget createPhoto(String image) {
    return Container(
      height: 80,
      width: 80,
      color: Color.fromARGB(255, 52, 64, 78),
      child: Image.asset(
        image,
      ),
    );
  }

  Widget createContent(String title, String content) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: normalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(color: yellowColor),
                  ),
                ),
                Container(
                  child: Text(
                    DateUtil().getCurrentDate(),
                    style: TextStyle(
                        color: yellowColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: smallerMargin),
                child: Text(content,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white70))),
          ],
        ),
      ),
    );
  }
}
