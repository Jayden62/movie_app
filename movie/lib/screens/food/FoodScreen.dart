import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/food/FoodHeader.dart';
import 'package:movie/screens/food/FoodItem.dart';

class FoodScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> list = [];
    list.clear();
    list.add(FoodItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlc0bRyrJvq4OpTYmp84rr0efnk4Q0JHfIOdQ5o74MIXXW5bjo',
        'WAFFKE MY COMBO',
        '99.000',
        'One big drink and popcorn',
        'Mixing cheese and caramel'));

    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        padding: EdgeInsets.all(normalPadding),
        child: ListView(children: list));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: FoodHeader(
          'SWEET MOVIES',
          onLeftPress: () {
            popScreen(context);
          },
        ));
  }
}
