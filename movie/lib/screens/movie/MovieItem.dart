import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';

class MovieItem extends BaseItem {
  final String image;

  MovieItem(this.image);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      child: initPoster(),
    );
  }

  Widget initPoster() {
    return Container(
        child: Image.network(
      image,
      fit: BoxFit.cover,
      width: 250,
      height: 250,
    ));
  }
}
