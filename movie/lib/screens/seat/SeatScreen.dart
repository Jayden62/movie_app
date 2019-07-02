import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart' as mButton;
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/food/BlocFood.dart';
import 'package:movie/screens/box/BoxScreen.dart';
import 'package:movie/screens/fail/FailScreen.dart';
import 'package:movie/screens/food/FoodScreen.dart';
import 'package:movie/screens/seat/SeatHeader.dart';
import 'package:movie/screens/succeed/SucceedScreen.dart';

class SeatScreen extends BaseScreen {
  final String item;
  final String name;

  SeatScreen(this.item, this.name);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        padding: EdgeInsets.all(normalPadding),
        child: ListView(children: <Widget>[
          _createScreenFrame(),
          _createTypes(),
          _createResult(),
          _createTime(),
          _createAlpha(),
          _createBox(context),
          _createLine(),
          _createBot(context),
        ]));
  }

  Widget _createScreenFrame() {
    return Container(
      constraints: BoxConstraints.expand(height: 150),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 93, 104, 120),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Text(
        'Screen',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  Widget _createTypes() {
    return Container(
      color: Color.fromARGB(255, 52, 64, 78),
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(smallerPadding),
            child: Text(
              'IMAX 3D',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(smallerPadding),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createResult() {
    return Container(
      color: Color.fromARGB(255, 52, 64, 78),
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(smallerPadding),
            child: Text(
              'Quantity : ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(smallPadding),
              child: Text(
                '0',
                style: TextStyle(color: grayColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createTime() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      alignment: Alignment.center,
      child: Text(
        'Time : $item',
        style: TextStyle(fontWeight: FontWeight.bold, color: yellowColor),
      ),
    );
  }

  Widget _createAlpha() {
    List<String> strAlpha = ["A", "B", "C", "D", "E", "F"];
    List<Widget> list = [];
    list.clear();
    String alpha = "";
    for (alpha in strAlpha) {
      list.add(_alphaItem(alpha));
    }
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            child: Divider(
              height: 1,
              color: Colors.white70,
            ),
          ),
          Container(
            height: 60,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: list,
            ),
          ),
          Container(
            width: 60,
            child: Divider(
              height: 1,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _alphaItem(String alpha) {
    return Container(
      margin: EdgeInsets.only(left: normalMargin),
      child: Text(
        alpha,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _createBox(BuildContext context) {
    return BoxScreen(context);
  }

  Widget _createLine() {
    return Container(
      height: 1,
      child: Divider(
        color: Colors.white70,
      ),
    );
  }

  Widget _createBot(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: normalMargin),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_drawTotal('0'), _drawBooking(context)]));
  }

  Widget _drawTotal(String total) {
    return Row(
      children: <Widget>[
        Text(
          'Total : ',
          style: TextStyle(color: yellowColor),
        ),
        Container(
          margin: EdgeInsets.only(left: normalMargin),
          child: Text('#' + total, style: TextStyle(color: yellowColor)),
        ),
      ],
    );
  }

  Widget _drawBooking(BuildContext context) {
    return mButton.Button(
      'Book',
      width: 80,
      height: 40,
      defaultDecoration: BoxDecoration(color: yellowColor),
      defaultStyle: TextStyle(color: Colors.white),
      highlightDecoration: BoxDecoration(color: grayColor),
      onPress: () {
//        pushScreen(context, SucceedScreen(name));
        pushScreen(context, FailScreen());
      },
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: SeatHeader(name, onLeftPress: () {
          popScreen(context);
        }, onRightPress: () {
          pushScreen(context, FoodScreen());
        }));
  }
}
