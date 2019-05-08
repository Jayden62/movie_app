import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';
import 'package:movie/base/style/BaseStyle.dart';

class TheaterItem extends BaseItem {
  final String name;
  final String distance;
  final String hour;
  final String address;

  TheaterItem(this.name, this.distance, this.hour, this.address);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: normalMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          initPhotos(),
          initNameAndDistance(),
          initHour(),
          initAddress(),
        ],
      ),
    );
  }

  Widget initNameAndDistance() {
    return Container(
      margin: EdgeInsets.only(top: normalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: normalMargin),
            child: Text(name),
          ),
          Container(
            margin: EdgeInsets.only(right: normalMargin),
            child: Text(distance),
          ),
        ],
      ),
    );
  }

  Widget initAddress() {
    return Container(
      margin: EdgeInsets.only(top: smallerMargin, left: normalMargin),
      child: Text(address),
    );
  }

  Widget initHour() {
    return Container(
      margin: EdgeInsets.only(top: smallerMargin, left: normalMargin),
      child: Text(hour),
    );
  }

  Widget initPhotos() {
    List<Widget> photos = [];

    photos.add(createPhoto(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwIuegttg3hhtlr3NEbQ1YrbPDs6Ev1RCnC9hrKuDcf6ePQPfo'));
    photos.add(createPhoto(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwIuegttg3hhtlr3NEbQ1YrbPDs6Ev1RCnC9hrKuDcf6ePQPfo'));
    photos.add(createPhoto(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwIuegttg3hhtlr3NEbQ1YrbPDs6Ev1RCnC9hrKuDcf6ePQPfo'));

    return Container(
      height: 100,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: normalMargin),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: photos,
      ),
    );
  }

  Widget createPhoto(String image) {
    return Container(
      margin: EdgeInsets.only(top: normalMargin, right: normalMargin),
      child: Image.network(image),
    );
  }
}
