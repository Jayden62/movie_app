import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';

class PromotionItem extends BaseItem {
  final String image;
  final String title;
  final String time;

  PromotionItem(
    this.image,
    this.title,
    this.time,
  );

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: normalMargin),
        constraints: BoxConstraints.expand(
          height: 250,
        ),
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: smallMargin, bottom: smallerMargin),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            Container(
              margin: EdgeInsets.only(top: smallerMargin),
              child: Text(time,
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
        ));
  }
}
