import 'package:flutter/material.dart';
import 'package:movie/base/item/BaseItem.dart';

class MovieItem extends BaseItem {
  final String image, name, alpha, time;

  MovieItem(this.image, this.name, this.alpha, this.time);

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
      width: 400,
    ));
  }
}
