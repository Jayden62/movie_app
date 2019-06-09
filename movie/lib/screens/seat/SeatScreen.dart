import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart' as mButton;
import 'package:movie/screens/seat/SeatHeader.dart';

class SeatScreen extends BaseScreen {
  final String item;

  SeatScreen(this.item);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        padding: EdgeInsets.all(normalPadding),
        child: ListView(children: <Widget>[
          initScreenFrame(),
          initScreenLabel(),
          initTypesOfSeats(),
          initSeatsBox(),
          initDivider(),
          initSub(),
          initBook(),
        ]));
  }

  Widget initScreenFrame() {
    return Container(height: 150, color: Color.fromARGB(255, 93, 104, 120));
  }

  Widget initScreenLabel() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      alignment: Alignment.center,
      child: Text(
        'Screen',
        style: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(
            255,
            93,
            104,
            120,
          ),
        ),
      ),
    );
  }

  Widget initTypesOfSeats() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[initCouple(), initSingle(), initCouple()],
      ),
    );
  }

  Widget initCouple() {
    return Row(
      children: <Widget>[
        Image.asset('assets/photos/couple_seat.png'),
        Container(
          margin: EdgeInsets.only(left: smallerMargin),
          child: Text(
            'Couple',
            style: TextStyle(
              color: Color.fromARGB(
                255,
                93,
                104,
                120,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget initSingle() {
    return Row(
      children: <Widget>[
        Image.asset('assets/photos/single_seat.png'),
        Container(
          margin: EdgeInsets.only(left: smallerMargin),
          child: Text('Single',
              style: TextStyle(
                color: Color.fromARGB(
                  255,
                  93,
                  104,
                  120,
                ),
              )),
        )
      ],
    );
  }

  Widget initSeatsBox() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// For couple
          Column(
            children: <Widget>[
              initSeatCouple('A1', 'A2'),
              initSeatCouple('A3', 'A4'),
              initSeatCouple('A5', 'A6'),
              initSeatCouple('A7', 'A8'),
              initSeatCouple('A9', 'A10'),
            ],
          ),

          /// For single
          Column(
            children: <Widget>[
              initSeatRow('', 'C1'),
              initSeatRow('', 'C3'),
              initSeatRow('', 'C5'),
              initSeatRow('', 'C7'),
              initSeatRow('', 'C9'),
            ],
          ),

          /// For couple
          Column(
            children: <Widget>[
              initSeatCouple('B1', 'B2'),
              initSeatCouple('B3', 'B4'),
              initSeatCouple('B5', 'B6'),
              initSeatCouple('B7', 'B8'),
              initSeatCouple('B9', 'B10'),
            ],
          ),
        ],
      ),
    );
  }

  Widget initSeatRow(String empty, String book) {
    return Container(
        child: Row(
      children: <Widget>[
        initSeatSingle(empty, book),
        initSeatSingle(empty, book),
        initSeatSingle(empty, book),
      ],
    ));
  }

  Widget initSeatSingle(String empty, String book) {
    return Container(
      margin: EdgeInsets.only(top: smallestMargin),
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            child: mButton.Button(
              empty,
              defaultDecoration: BoxDecoration(color: Colors.grey),
              defaultStyle: TextStyle(color: Colors.transparent, fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: smallestMargin),
            height: 25,
            width: 25,
            child: mButton.Button(
              book,
              defaultDecoration: BoxDecoration(color: seatColor),
              defaultStyle: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget initSeatCouple(String one, String two) {
    return Container(
        margin: EdgeInsets.only(top: smallestMargin),
        child: Row(
          children: <Widget>[
            Container(
              height: 25,
              width: 25,
              child: mButton.Button(
                one,
                defaultDecoration: BoxDecoration(color: seatColor),
                defaultStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: smallestMargin),
              height: 25,
              width: 25,
              child: mButton.Button(
                two,
                defaultDecoration: BoxDecoration(color: seatColor),
                defaultStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ));
  }

  Widget initDivider() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  Widget initSub() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          initSubLabel(seatColor, 'Empty'),
          initSubLabel(Colors.grey, 'Reservation'),
          initSubLabel(Color.fromARGB(255, 25, 81, 54), 'Disability'),
        ],
      ),
    );
  }

  Widget initSubLabel(Color color, String str) {
    return Row(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          child: mButton.Button(
            '',
            defaultDecoration: BoxDecoration(color: color),
            defaultStyle: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: smallerMargin),
          child: Text(
            str,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget initBook() {
    return mButton.Button('Book',
        height: 40,
        margin: EdgeInsets.only(top: normalMargin),
        defaultStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color.fromARGB(255, 158, 37, 31)),
        highlightDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: seatColor),
        highlightStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        disableDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.grey,
        ),
        disableStyle: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        enable: true,
        onPress: () {});
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: SeatHeader(
          'SWEET MOVIES',
          onLeftPress: () {
            popScreen(context);
          },
        ));
  }
}
