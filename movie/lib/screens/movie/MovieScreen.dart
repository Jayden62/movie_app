import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/movie/BlocMovie.dart';
import 'package:movie/screens/booking/BookingScreen.dart';
import 'package:movie/screens/movie/MovieHeader.dart';
import 'package:movie/screens/movie/MovieItem.dart';
import 'package:movie/screens/movie/MovieStyle.dart';
import 'package:movie/screens/movie/ComingSoonItem.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieScreen extends BaseScreen {
  final ScreenSize size;

  MovieScreen(this.size);

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
              /// Init now showing
              initNowShowing(context),

              /// Init special
              initSpecial(context),

              /// Init coming soon
              initComingSoon(),
            ]));
  }

  Widget initNowShowing(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        initShowingPoster(context),
        iniShowingInfo(context),
      ],
    );
  }

  Widget initSpecial(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        initSpecialPoster(context),
        initSpecialInfo(context),
      ],
    );
  }

  Widget initComingSoon() {
    List<Widget> items = [];
    items.add(ComingSoonItem(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGLCAYXoNu6R1l0sSiC0KOsAlSnmXnfU4tmoc_2VMXVhMSlqZg',
        'END GAME',
        '26 Thg 4, 2019',
        '5 days left'));
    items.add(ComingSoonItem(
        'https://instagram.frix3-1.fna.fbcdn.net/vp/2aeee3c5ed24745c103c2c61bae81852/5CE117F0/t51.2885-15/e35/50088358_667050733709730_8838093363722671040_n.jpg?_nc_ht=instagram.frix3-1.fna.fbcdn.net&ig_cache_key=MTk2MjYwNTU3NjI0MTY1MjY0NA%3D%3D.2',
        'UPIN & IPIN',
        '26 Thg 4, 2019',
        '5 days left'));
    items.add(ComingSoonItem(
        'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/2/p/2pikachu-_vietnamese_poster.jpg',
        'THÁM TỬ PIKACHA',
        '10 Tháng 5, 2019',
        '19 days left'));
    items.add(ComingSoonItem(
        'http://image.pmcontent.com/film/8493/poster.medium.jpg',
        'QUÝ CÔ LỪA ĐẢO',
        '10 Tháng 5, 2019',
        '19 days left'));
    items.add(ComingSoonItem(
        'http://media.vndaily.vn/files/lehungphucdl/2018/08/26/poster-nguoi-vo-ba-6984-1534907061-1220.jpg',
        'NGƯỜI VỢ BA',
        '17 Tháng 5, 2019',
        '26 days left '));
    return Container(
      padding: EdgeInsets.all(normalPadding),
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(shrinkWrap: true, children: items),
    );
  }

  Widget initShowingPoster(BuildContext context) {
    final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(normalPadding),
      child: PageView(
        children: [
          Container(
              child: StreamBuilder(

                  /// Get data from stream
                  stream: blocMovie.photoController.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      List<MovieItem> items = List(snapshot.data.length);
                      for (int index = 0;
                          index < snapshot.data.length;
                          index++) {
                        items[index] = MovieItem(snapshot.data[index].url);
                      }
                      if (snapshot.data.length != 0) {
                        blocMovie.infoController.sink.add(snapshot.data[0]);
                      }

                      return CarouselSlider(
                        items: items,
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        enlargeCenterPage: true,
                        onPageChanged: (value) {
                          /// Add data from stream by value onPageChanged. That means when u swipe, object will change by value(index).
                          final BlocMovie blocMovie =
                              BlocProvider.of<BlocMovie>(context);
                          blocMovie.infoController.sink
                              .add(snapshot.data[value]);
                        },
                        scrollDirection: Axis.horizontal,
                      );
                    } else {
                      return Text('No data');
                    }
                  }))
        ],
      ),
    ));
  }

  Widget iniShowingInfo(BuildContext context) {
    final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
    return StreamBuilder(
        stream: blocMovie.infoController.stream,
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          /// The first time when calling to stream, data is empty (no updating). Due to create params is empty to be waiting stream update data.
          Movie movie;
          String name = "";
          String time = "";
          String alpha = "";

          if (snapshot.hasData && snapshot != null) {
            movie = snapshot.data;
            name = movie.name;
            alpha = movie.alpha;
            time = movie.time;
          }

          return Container(
              margin: EdgeInsets.only(
                  left: normalMargin,
                  right: normalMargin,
                  bottom: normalMargin),
              decoration: movieDecoration,
              height: heightMovie,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: smallerMargin),
                        child: Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: smallerMargin),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 242, 115, 101),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    color: Colors.transparent),
                                child: Container(
                                  padding: EdgeInsets.all(1.5),
                                  child: Text(
                                    alpha,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 242, 115, 101),
                                        fontSize: 12),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: smallestMargin),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 104, 120),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: initBookButton(context, blocMovie, movie),
                  ),
                ],
              ));
        });
  }

  Widget initSpecialPoster(BuildContext context) {
    final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(normalPadding),
      child: PageView(
        children: [
          Container(
              child: StreamBuilder(

                  /// Get data from stream
                  stream: blocMovie.photoController.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Movie>> snapshot) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      List<MovieItem> items = List(snapshot.data.length);
                      for (int index = 0;
                          index < snapshot.data.length;
                          index++) {
                        items[index] = MovieItem(snapshot.data[index].url);
                      }
                      if (snapshot.data.length != 0) {
                        blocMovie.infoController.sink.add(snapshot.data[0]);
                      }

                      return CarouselSlider(
                        items: items,
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        enlargeCenterPage: true,
                        onPageChanged: (value) {
                          /// Add data from stream by value onPageChanged. That means when u swipe, object will change by value(index).
                          final BlocMovie blocMovie =
                              BlocProvider.of<BlocMovie>(context);
                          blocMovie.infoController.sink
                              .add(snapshot.data[value]);
                        },
                        scrollDirection: Axis.horizontal,
                      );
                    }
                  }))
        ],
      ),
    ));
  }

  Widget initSpecialInfo(BuildContext context) {
    final BlocMovie blocMovie = BlocProvider.of<BlocMovie>(context);
    return StreamBuilder(
        stream: blocMovie.infoController.stream,
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          /// The first time when calling to stream, data is empty (not updating). Due to create params is empty to be waiting stream update data.
          Movie movie;
          String name = "";
          String time = "";
          String alpha = "";

          if (snapshot.hasData && snapshot != null) {
            movie = snapshot.data;
            name = movie.name;
            alpha = movie.alpha;
            time = movie.time;
          }

          return Container(
              margin: EdgeInsets.only(
                  left: normalMargin,
                  right: normalMargin,
                  bottom: normalMargin),
              decoration: movieDecoration,
              height: heightMovie,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: smallerMargin),
                        child: Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: smallerMargin),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(255, 242, 115, 101),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                    color: Colors.transparent),
                                child: Container(
                                  padding: EdgeInsets.all(1.5),
                                  child: Text(
                                    alpha,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 242, 115, 101),
                                        fontSize: 12),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: smallestMargin),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Color.fromARGB(255, 93, 104, 120),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: initBookButton(context, blocMovie, movie),
                  ),
                ],
              ));
        });
  }

  /// Init book button
  Widget initBookButton(
      BuildContext context, BlocMovie blocMovie, Movie movie) {
    return Button('Book',
        alignment: Alignment.center,
        height: 30,
        width: 80,
        defaultStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color.fromARGB(255, 193, 13, 13)),
        highlightDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [buttonBoxShadow],
            color: Color.fromARGB(255, 144, 9, 9)),
        disableDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Colors.grey,
            boxShadow: [buttonBoxShadow]),
        disableStyle: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 16),
        enable: true,
        onPress: () => pushScreen(context, BookingScreen(movie)));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(45), child: MovieHeader());
  }
}
