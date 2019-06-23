import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart' as mButton;
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/food/BlocFood.dart';
import 'package:movie/screens/food/FoodStyle.dart';

class FoodItem extends BaseItem {
  final String image;
  final String price;
  final String content;
  final String discount;

//  final Function() onTapIncrease;
//  final Function() onTapDecrease;

  FoodItem(this.image, this.price, this.content, this.discount);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      decoration: foodDecoration,
      margin: EdgeInsets.only(top: normalPadding),
      padding: EdgeInsets.all(normalPadding),
      child: Row(
        children: <Widget>[
          _createPhoto(image, price),
          _createContent(context, content),
        ],
      ),
    );
  }

  Widget _createPhoto(String image, String price) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            color: Color.fromARGB(255, 52, 64, 78),
            child: Image.asset(image),
          ),
          Container(
            margin: EdgeInsets.only(top: smallerMargin),
            child: Text(
              price + " đ",
              style: TextStyle(color: yellowColor, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _createContent(BuildContext context, String content) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: normalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                content,
                softWrap: true,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: smallerMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _createDiscount(discount),
                  _createPicking(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createDiscount(String discount) {
    return Column(
      children: <Widget>[
        Text(
          'discount',
          style: TextStyle(
              color: Colors.orangeAccent, fontWeight: FontWeight.bold),
        ),
        Container(
          child: Text(
            discount + " đ",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _createPicking(BuildContext context) {
    int value = 0;
    final BlocFood blocFood = BlocProvider.of<BlocFood>(context);
    blocFood.foodController.stream.listen((data) {
      value = data;
    });
    return Container(
      child: Row(
        children: <Widget>[
          _createButtonDecrease(context, '-', value),
          _createValue(value.toString(), context),
          _createButtonIncrease(context, '+', value),
        ],
      ),
    );
  }

  Widget _createValue(String value, BuildContext context) {
//    return Container(
//      margin: EdgeInsets.only(left: smallerMargin, right: smallerMargin),
//      child: Text(
//        value.toString(),
//        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//      ),
//    );
    final BlocFood blocFood = BlocProvider.of<BlocFood>(context);
    return StreamBuilder(
        stream: blocFood.foodController.stream,
        builder: (context, snapshot) => Container(
              margin:
                  EdgeInsets.only(left: smallerMargin, right: smallerMargin),
              child: snapshot.hasData
                  ? Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  : Text(
                      value.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
            ));
  }

  Widget _createButtonIncrease(BuildContext context, String label, int count) {
    final BlocFood blocFood = BlocProvider.of<BlocFood>(context);
    return mButton.Button(label,
        alignment: Alignment.center,
        height: 30,
        width: 40,
        defaultStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              colors: <Color>[yellowColor, lightYellowColor],
            )),
        highlightDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white30),
        highlightStyle:
            TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        enable: true, onPress: () {
      blocFood.increment();
    });
  }

  Widget _createButtonDecrease(BuildContext context, String label, int count) {
    final BlocFood blocFood = BlocProvider.of<BlocFood>(context);
    return mButton.Button(label,
        alignment: Alignment.center,
        height: 30,
        width: 40,
        defaultStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            gradient: LinearGradient(
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              colors: <Color>[mColor, myColor],
            )),
        highlightDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white30),
        highlightStyle:
            TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        enable: true, onPress: () {
      blocFood.decrement();
    });
  }
}
