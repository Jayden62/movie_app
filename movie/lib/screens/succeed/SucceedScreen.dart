import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:uuid/uuid.dart';

import 'SucceedHeader.dart';

class SucceedScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      padding: EdgeInsets.all(normalPadding),
      child: ListView(
        children: <Widget>[
          initPhoto(),
          initTitle(),
//          initNumberQr(),
          initNumberPhoto()
        ],
      ),
    );
  }

  Widget initPhoto() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Image.asset(
          'assets/photos/check.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget initTitle() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: normalMargin),
      child: Text(
        'Please, do not  share with any one. This qrcode to get ticket at KIOSK.',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget initNumberQr() {
    var uuid = Uuid();
    return Container(
        margin: EdgeInsets.only(top: normalMargin),
        child: Center(
          child: Text(
            uuid.v1(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ));
  }

  Widget initNumberPhoto() {
    return Container(
      margin: EdgeInsets.only(top: superLargestMargin),
      child: Center(
        child: Image.asset(
          'assets/photos/barcode.png',
          height: 150,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: SucceedHeader(
          'SWEET MOVIES',
          onLeftPress: () {
            popScreen(context);
          },
        ));
  }
}
