import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart' as mButton;

class FoodItem extends BaseItem {
  final String photo;
  final String name;
  final String price;
  final String description;
  final String flavor;

  FoodItem(this.photo, this.name, this.price, this.description, this.flavor);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.network(
            photo,
            width: 100,
            height: 100,
          ),
          Container(
            margin: EdgeInsets.only(left: smallMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  child: Text(price + " đ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Container(
                  child: Text(flavor, style: TextStyle(color: Colors.white70)),
                ),
                Container(
                  margin: EdgeInsets.only(top: smallerMargin),
                  child: Row(
                    children: <Widget>[
                      mButton.Button(
                        '-',
                        height: 25,
                        width: 25,
                        defaultStyle:
                            TextStyle(color: Colors.white30, fontSize: 16),
                        defaultDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white30)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: smallerMargin),
                        child: Text(
                          '0',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: smallestMargin, left: smallerMargin),
                        child: mButton.Button(
                          '+',
                          height: 25,
                          width: 25,
                          defaultStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                          defaultDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
