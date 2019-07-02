import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/food/BlocFood.dart';
import 'package:movie/screens/food/FoodHeader.dart';
import 'package:movie/screens/food/FoodItem.dart';

class FoodScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    int value = 0;
    List<Widget> list = [];
    list.clear();
//    blocFood.foodController.stream.listen((data) {
//      value = data;
//    });

    list.add(FoodItem(
      'assets/photos/photo_popcorn.png',
      '49.000',
      'Unflavored popcorn has a strong flavor impact mainly in toast, corn, oil, more toast, and a toasted, slightly bitter aftertaste',
      '29.000',
    ));

    list.add(FoodItem(
        'assets/photos/photo_popcorn_couple.png',
        '89.000',
        'Use a moderate sized metal pot with a lid. Put about 1 tablespoon of high temperature oil such as safflower or sunflower oil in the pan (corn oil or canola oil are OK too)',
        '69.000'));
//    list.add(FoodItem(
//        'assets/photos/photo_purple_popcorn.png',
//        '69.000',
//        'After the pan is hot add about 1/4 cup of popcorn kernels. Continue to heat the pan shaking the pan back and forth over the flame or heating element constantly',
//        '59.000'));
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      padding: EdgeInsets.all(normalPadding),
      child: ListView(children: list),
    );
//    return StreamBuilder(
//        stream: blocFood.foodController.stream,
//        builder: (context, snapshot) => Container(
//            color: Color.fromARGB(255, 30, 42, 58),
//            padding: EdgeInsets.all(normalPadding),
//            child: snapshot.hasData
//                ? ListView(children: list)
//                : ListView(children: list)));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: FoodHeader(
          'Popcorn',
          onLeftPress: () {
            popScreen(context);
          },
        ));
  }
}
