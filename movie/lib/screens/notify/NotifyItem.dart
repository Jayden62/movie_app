import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/movie/MovieStyle.dart';

class NotifyItem extends BaseItem {
  final String image, title, content;

  NotifyItem(this.image, this.title, this.content);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      decoration: movieDecoration,
      margin: EdgeInsets.only(top: normalMargin),
      padding: EdgeInsets.all(normalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[createPhoto(image), createContent(title,content)],
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
        height: 80,
        width: 80,
      ),
    );
  }

  Widget createContent(String title, String content) {
    return Container(
      margin: EdgeInsets.only(left: normalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: smallerMargin),
            child: Text(content,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: 3,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white70,
                )),
          ),
        ],
      ),
    );
  }
}
