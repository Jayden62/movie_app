import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/middle/model/Movie.dart';
import 'package:movie/middle/provider/movie/BlocMovie.dart';
import 'package:movie/screens/movie/MovieItem.dart';
import 'package:movie/screens/movie/MovieStyle.dart';

class SpecialStatefulWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BlocMovie blocMovie;

  SpecialStatefulWidget(this.scaffoldKey, this.blocMovie);

  @override
  State<StatefulWidget> createState() {
    return SpecialScreen(scaffoldKey, blocMovie);
  }
}

class SpecialScreen extends State<SpecialStatefulWidget>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BlocMovie blocMovie;

  SpecialScreen(this.scaffoldKey, this.blocMovie);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return onInitBody(context);
  }

  Widget onInitBody(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
//        initSpecialPoster(),
        initSpecialInfo(),
      ],
    );
  }

  /// view detail when click image from carousel
  void gotoDetails(BuildContext context, Movie data) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color.fromARGB(255, 30, 42, 58),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: normalMargin),
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              centerTitle: true,
              title: Container(
                margin: EdgeInsets.only(bottom: largerMargin),
                child: Text(
                  'Movie Detail',
                  style: TextStyle(color: yellowColor),
                ),
              )),
          body: Container(
            padding: EdgeInsets.all(normalPadding),
            color: Color.fromARGB(255, 30, 42, 58),
            child: ListView(
              children: <Widget>[
                Hero(
                  tag: 'movie-detail',
                  child: Container(
                    height: 250,
                    child: Image.network(data.url),
                  ),
                ),
              ],
            ),
          )),
    ));
  }

  Widget initSpecialPoster() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(normalPadding),
      child: PageView(
        children: [
          Container(
              child: Hero(
                  tag: 'movie-detail',
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
                            items[index] = MovieItem(
                              snapshot.data[index].url,

                              /// call back onTapItem
                              onTapItem: () {
                                print('call back onTapItem');

                                /// movie detail, get scaffold key from HomeScreen(). it means that MovieScreen() is contained by HomeScreen().
                                /// when i want to navigate new screen i have to use scaffold key from HomeScreen().
                                gotoDetails(scaffoldKey.currentContext,
                                    snapshot.data[index]);
                              },
                            );
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
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            pauseAutoPlayOnTouch: Duration(seconds: 10),
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (value) {
                              /// Add data from stream by value onPageChanged. That means when u swipe, object will change by value(index).
                              blocMovie.infoController.sink
                                  .add(snapshot.data[value]);
                            },
                          );
                        }
                      })))
        ],
      ),
    ));
  }

  Widget initSpecialInfo() {
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
        enable: true, onPress: () {
//      pushScreen(scaffoldKey.currentContext, BookingScreen(movie));
    });
  }

  @override
  bool get wantKeepAlive => true;
}
