import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/screens/seat/SeatHeader.dart';

class SeatScreen extends BaseScreen {
  final String item;

  SeatScreen(this.item);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      padding: EdgeInsets.all(normalPadding),
      child: ListView(
        children: <Widget>[
          initScreenFrame(),
          initScreenLabel(),
          initTypesOfSeats(),
          initSeatsBox(),
        ],
      ),
    );
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
            children: <Widget>[initSeatCouple('A1', 'A2')],
          ),

          /// For single
          Column(
            children: <Widget>[Text('single')],
          ),

          /// For couple
          Column(
            children: <Widget>[Text('couple')],
          ),
        ],
      ),
    );
  }

  Widget initSeatCouple(String one, String two) {
    return Row(
      children: <Widget>[
        Container(
          height: 25,
          width: 25,
          child: FlatButton(
            color: seatColor,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            onPressed: () {},
            child: Text(
              one,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 25,
          width: 25,
          margin: EdgeInsets.only(left: smallestMargin),
          child: FlatButton(
            color: seatColor,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            splashColor: Colors.grey,
            onPressed: () {},
            child: Text(
              two,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
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
