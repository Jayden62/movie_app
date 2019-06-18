import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/bottom_navigation/BottomNavigation.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/home/BlocHome.dart';
import 'package:movie/middle/provider/movie/BlocMovie.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/home/HomeHeader.dart';
import 'package:movie/screens/menu/MenuItem.dart';
import 'package:movie/screens/movie/MovieScreen.dart';
import 'package:movie/screens/notify/NotifyScreen.dart';
import 'package:movie/screens/promotion/PromotionScreen.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:movie/custom/button/Button.dart' as Button;
import 'package:movie/screens/theater/TheaterScreen.dart';
import 'package:movie/utils/SlideRoute.dart';

class HomeStateful extends StatefulWidget {
  final String userName;

  HomeStateful(this.userName);

  @override
  State<StatefulWidget> createState() {
    return HomeScreen(userName);
  }
}

class HomeScreen extends State<HomeStateful> {
  final String userName;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;

  Widget root;

  /// Constructor
  HomeScreen(this.userName);

  @override
  Widget build(BuildContext context) {
    if (root == null) {
      root = _initView();
    }
    return root;
  }

  Widget _initView() {
    final BlocHome blocHome = BlocProvider.of<BlocHome>(context);
    int index = 0;
    List<Widget> widgets = [
      BlocProvider<BlocMovie>(
          child: MovieScreen(scaffoldKey), bloc: BlocMovie()),
      TheaterScreen(),
      PromotionScreen()
    ];
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
        'About Us'));

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: HomeHeader(
            'SWEET MOVIES',
            onLeftPress: () {
              print('open drawer.');
              scaffoldKey.currentState.openDrawer();
            },
            onRightPress: () {
              Navigator.push(context, SlideRoute(widget: NotifyScreen(scaffoldKey)));
            },
          )),
      body: Container(
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
              })),
      bottomNavigationBar: BottomNavigation(),
      drawer: Drawer(
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
                      top: largerMargin,
                      left: normalMargin,
                      right: normalMargin),
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
                      Navigator.push(
                          context,
                          SlideRoute(
                              widget: BlocProvider<BlocSignIn>(
                                  child: SignInScreen(), bloc: BlocSignIn())));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
