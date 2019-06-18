import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/notify/NotifyHeader.dart';
import 'package:movie/screens/notify/NotifyItem.dart';

class NotifyScreen extends BaseScreen {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NotifyScreen(this.scaffoldKey);

  @override
  Widget onInitBody(BuildContext context) {
    List<Widget> list = [];

    list.add(NotifyItem('assets/photos/photo_ticket.png', 'Title 1',
        'Our latest collection of deep love quotes'));
    list.add(NotifyItem('assets/photos/photo_notify.png', 'Title 2',
        'Love is an incredible feeling. It is one of life’s '));

    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        padding: EdgeInsets.all(normalPadding),
        child: ListView(children: list));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: NotifyHeader(
          'Notifications',
          onRightPress: () {
            popScreen(scaffoldKey.currentContext);
          },
        ));
  }
}
