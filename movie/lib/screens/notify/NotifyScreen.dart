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

    list.add(NotifyItem('assets/photos/photo_ticket.png', 'Daily notifiy',
        'this is my sweet home, i want u here with you. because of the best wish i alway give to you'));
    list.add(NotifyItem('assets/photos/photo_notify.png', 'Daily notifiy',
        'this is my sweet home, i want u here with you. because of the best wish i alway give to you'));
    list.add(NotifyItem('assets/photos/photo_notify.png', 'Daily notifiy',
        'this is my sweet home, i want u here with you. because of the best wish i alway give to you'));

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
          onLeftPress: () {
            popScreen(scaffoldKey.currentContext);
          },
        ));
  }
}
