import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/movie/BlocMovie.dart';
import 'package:movie/screens/movie/MovieHeader.dart';
import 'package:movie/screens/movie/comingsoon/ComingSoonScreen.dart';
import 'package:movie/screens/movie/showing/ShowingScreen.dart';
import 'package:movie/screens/movie/special/SpecialScreen.dart';

class MovieScreen extends BaseScreen {
  final ScreenSize size;
  final GlobalKey<ScaffoldState> scaffoldKey;

  MovieScreen(this.size, this.scaffoldKey);

  @override
  Widget onInitBody(BuildContext context) {
    TabController tabController;
    final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
    blocMovie.loadDataController.sink.add(true);
    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              ShowingStatefulWidget(scaffoldKey, blocMovie),
//              SpecialStatefulWidget(scaffoldKey, blocMovie),
              ComingSoonScreen(),
//              BaseFull(ComingSoonScreen(scaffoldKey, blocMovie)),
            ]));
  }

  @override
  bool initTabBarView(BuildContext context) {
    return true;
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    int position = 0;
    return PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: MovieHeader((value) {
          if (position != value) {
            position = value;
            final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
            blocMovie.init();
          }
        }));
  }
}
