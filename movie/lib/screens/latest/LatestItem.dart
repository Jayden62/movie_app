import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';

class LatestItem extends BaseItem {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[initItem()],
      ),
    );
  }

  Widget initPoster(String poster) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: Image.asset(
        poster,
        height: 150,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget initItem() {
    return Container(
      child: Row(
        children: <Widget>[
          initPoster('assets/photos/photo_aquaman.jpg'),
//          initTitle('Aquaman', '(2018)', '7.3'),
//          initInfo(
//              '2h 20min', 'PG-13', 'James Wan', 'A film from DC corperation')
        ],
      ),
    );
  }

  Widget initTitle(String name, String year, String rating) {
    return Container(
      margin: EdgeInsets.only(left: 120),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Container(
                child: Text(
                  year,
                  style: TextStyle(color: Color.fromARGB(255, 93, 104, 120)),
                ),
              ),
            ],
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: smallerMargin),
                  child: Button('BOOK',
                      alignment: Alignment.center,
                      height: 40,
                      width: 60,
                      defaultStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      defaultDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color.fromARGB(255, 253, 194, 12)),
                      highlightDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          boxShadow: [buttonBoxShadow],
                          color: yellowColor),
                      disableDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Colors.grey,
                          boxShadow: [buttonBoxShadow]),
                      disableStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      enable: true,
                      onPress: () {})),
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget initInfo(
      String times, String room, String author, String description) {
    return Container(
      margin: EdgeInsets.only(top: smallMargin),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Card(
        elevation: 4.0,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 100,
                  margin:
                      EdgeInsets.only(left: smallerMargin, top: smallerMargin),
//                  color: Color.fromARGB(255, 72, 84, 98),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: smallestMargin),
                        child: Text(
                          times,
                          style: TextStyle(color: yellowColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: smallestMargin),
                        child: Text(
                          room,
                          style: TextStyle(color: yellowColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: smallerMargin),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: smallerMargin),
                  child: Text('DIRECTOR'),
                ),
                Container(
                  margin: EdgeInsets.only(left: normalMargin),
                  child: Text(
                    author,
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 76, 106, 135)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: smallerMargin),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
