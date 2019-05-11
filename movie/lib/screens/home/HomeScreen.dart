import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/home/BlocHome.dart';
import 'package:movie/middle/provider/movie/BlocMovie.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/home/HomeHeader.dart';
import 'package:movie/screens/menu/MenuItem.dart';
import 'package:movie/screens/movie/MovieScreen.dart';
import 'package:movie/screens/promotion/PromotionScreen.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:movie/custom/button/Button.dart' as Button;
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/screens/theater/TheaterScreen.dart';

class HomeScreen extends BaseScreen {
  final ScreenSize size;
  final String userName;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final int currentIndex = 0;

  /// Constructor
  HomeScreen(this.size, this.userName);

  @override
  Widget onInitBody(BuildContext context) {
    final BlocHome blocHome = BlocProvider.of<BlocHome>(context);
    int index = 0;
    List<Widget> widgets = [
      BlocProvider<BlocMovie>(
          child: MovieScreen(size, scaffoldKey), bloc: BlocMovie()),
      TheaterScreen(),
      PromotionScreen()
    ];
    return Container(
        color: Color.fromARGB(255, 30, 42, 58),
        child: StreamBuilder(
            initialData: currentIndex,
            stream: blocHome.homeStream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                print('value is $snapshot');
                index = snapshot.data;
              }
              return widgets[index];
            }));
  }

  /// Init bottom
  @override
  Widget onInitBottomNavigationBar(BuildContext context) {
    List<Color> colors = [yellowColor, Colors.grey];
    final BlocHome blocHome = BlocProvider.of<BlocHome>(context);

    return BottomNavigationBar(
        onTap: (value) async {
          blocHome.bottomSink.add(colors);
          blocHome.homeSink.add(value);
        },
        currentIndex: currentIndex,
        backgroundColor: Color.fromARGB(255, 30, 42, 58),
        unselectedItemColor: Colors.grey,
        fixedColor: yellowColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_creation,
              color: colors[currentIndex],
            ),
            title: Text(
              'Movie',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.theaters,
//              color: colors[currentIndex],
            ),
            title: Text('Theater'),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
//                color: colors[currentIndex],
              ),
              title: Text('Promotion'))
        ]);
  }

  Widget initBottomNavigationBarItem(BuildContext context) {
    final BlocHome blocHome = BlocProvider.of<BlocHome>(context);

    return StreamBuilder(
        stream: blocHome.bottomStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Color>> snapshot) {});
  }

  @override
  Widget onInitDrawer(BuildContext context) {
    List<Widget> items = [];
    items.clear();
    items.add(MenuItem(
        Icon(
          Icons.favorite,
          color: yellowColor,
        ),
        'My favorites'));
    items.add(MenuItem(
        Icon(
          Icons.people,
          color: yellowColor,
        ),
        'Friends'));
    items.add(MenuItem(
        Icon(
          Icons.movie,
          color: yellowColor,
        ),
        'Watch Parties'));
    items.add(MenuItem(
        Icon(
          Icons.edit,
          color: yellowColor,
        ),
        'Edit Profile'));
    items.add(MenuItem(
        Icon(
          Icons.settings,
          color: yellowColor,
        ),
        'Settings'));
    items.add(MenuItem(
        Icon(
          Icons.error,
          color: yellowColor,
        ),
        'About'));

    return Drawer(
      child: Container(
          width: 250,
          margin: EdgeInsets.only(top: normalMargin),
          color: Color.fromARGB(255, 19, 27, 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /// Header begin
              Container(
                  margin: EdgeInsets.only(
                      top: normalMargin,
                      left: normalMargin,
                      right: normalMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(scaffoldKey.currentContext);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: yellowColor,
                        ),
                      ),
                      Container(
                        child: Text(
                          'MOVIE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: yellowColor),
                        ),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                    top: largerMargin, left: normalMargin, right: normalMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.famousbirthdays.com/faces/chou-jay-image.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: yellowColor, width: 1),
                      ),
                    ),
                    Container(
                      child: Text(
                        userName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              /// Header end

              /// Menu list
              Container(
                child: ListView(
                  shrinkWrap: true,
                  children: items,
                ),
              ),

              /// Log out
              Expanded(
                child: Button.Button(
                  'Log out',
                  alignment: Alignment.center,
                  height: largeButtonHeight,
                  defaultStyle: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 19, 158, 214)),
                  highlightStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  enable: true,
                  onPress: () {
                    pushScreen(
                        context,
                        BlocProvider<BlocSignIn>(
                            child: SignInScreen(size), bloc: BlocSignIn()));
                  },
//                iconButton: Button.IconButton(
//                    'assets/photo/ic_event_highlight.png',
//                    Button.IconPosition.top,
//                    sizeIcon,
//                    sizeIcon,
//                    iconHighlight: 'assets/photo/ic_event_default.png')
                ),
              ),
            ],
          )),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: HomeHeader(
          'SWEET MOVIE',
          onLeftPress: () {
            print('open drawer.');
            scaffoldKey.currentState.openDrawer();
          },
          onRightPress: () {},
        ));
  }

  @override
  Key onInitKey(BuildContext context) {
    return scaffoldKey;
  }
}
