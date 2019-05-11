import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';

class MovieItem extends BaseItem {
  final String image;
  final Function onTapItem;

  MovieItem(this.image, {this.onTapItem});

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: initPoster(),
    );
  }

  Widget initPoster() {
    return GestureDetector(
      onTap: () {
        onTapItem();
      },
      child: Container(
          child: Image.network(
        image,
        fit: BoxFit.cover,
        width: 250,
        height: 250,
      )),
    );
  }
}
