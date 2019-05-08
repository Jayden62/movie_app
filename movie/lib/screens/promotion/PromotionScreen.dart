import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/screens/promotion/PromotionItem.dart';

class PromotionScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> items = [];
    items.clear();
    items.add(PromotionItem(
        'https://www.khuyenmaivui.com/wp-content/uploads/2015/01/CGV-Celadon-Tan-Phu-khuyen-mai-mung-sinh-nhat-don-nam-moi-958x718.jpg',
        'Offers for  VPBank credit cards',
        '15/04-08/10/2019'));
    items.add(PromotionItem(
        'https://www.khuyenmaivui.com/wp-content/uploads/2015/03/CGV-khuyen-mai-tuan-le-phai-dep-mua-2-ve-tang-coupon-doi-1-ve-mien-phi.jpg',
        'Weekly for women. Buy 1 get 1 free popcorn.',
        '10/02-04/06/2019'));
    items.add(PromotionItem(
        'https://khuyenmaiviet.vn/wp-content/uploads/2019/02/350x495.jpg',
        '50.000 for 2 tickets. Last monday each month.',
        '30/03-04/07/2019'));
    items.add(PromotionItem(
        'https://images.foody.vn/images/Culture-350-x-495.jpg',
        '50.000 for 2 tickets. Last monday each month.',
        '30/03-04/07/2019'));
    items.add(PromotionItem(
        'https://images.foody.vn/images/Culture-350-x-495.jpg',
        '50.000 for 2 tickets. Last monday each month.',
        '30/03-04/07/2019'));
    items.add(PromotionItem(
        'https://images.foody.vn/images/Culture-350-x-495.jpg',
        '50.000 for 2 tickets. Last monday each month.',
        '30/03-04/07/2019'));
    items.add(PromotionItem(
        'https://images.foody.vn/images/Culture-350-x-495.jpg',
        '50.000 for 2 tickets. Last monday each month.',
        '30/03-04/07/2019'));
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(children: items),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return null;
  }
}
