import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/custom/slide/Slide.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/home/HomeHeader.dart';
import 'package:movie/screens/home/HomeStyle.dart';
import 'package:movie/screens/menu/MenuItem.dart';
import 'package:movie/screens/movie/MovieScreen.dart';
import 'package:movie/screens/promotion/PromotionScreen.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:movie/custom/button/Button.dart' as Button;
import 'package:movie/custom/iconbutton/IconButton.dart' as IconButton;
import 'package:movie/middle/model/ScreenSize.dart';

class HomeScreen extends BaseScreen {
  final ScreenSize size;
  final String userName;

  HomeScreen(this.size, this.userName);

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      child: Column(
        children: <Widget>[
          /// Init pages
          initPages(context),

          /// Init menu
          initMenu(context)
        ],
      ),
    );
  }

  /// Init menu
  Widget initMenu(BuildContext context) {
    return Container(
        decoration: homeMenuDecoration,
        height: heightMenu,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[initMovie(), initTheater(), initPromotion()],
        ));
  }

  Widget initMovie() {
    return Container(
        margin: EdgeInsets.only(top: smallestMargin),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.movie_creation,
              color: yellowColor,
              size: sizeIcon,
            ),
            Container(
              child: Text(
                'Movies',
                style: TextStyle(color: yellowColor),
              ),
            ),
          ],
        ));
  }

  Widget initTheater() {
    return Container(
        margin: EdgeInsets.only(top: smallestMargin),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.theaters,
              color: Colors.grey,
              size: sizeIcon,
            ),
            Container(
              child: Text(
                'Theaters',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ));
  }

  Widget initPromotion() {
    return Container(
        margin: EdgeInsets.only(top: smallestMargin),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.card_giftcard,
              color: Colors.grey,
              size: sizeIcon,
            ),
            Container(
              child: Text(
                'Promotions',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ));
  }

  /// Init pages
  Widget initPages(BuildContext context) {
    List<Widget> widgets = [MovieScreen(size), PromotionScreen()];
    return Expanded(child: Slide(size, widgets, (value) {}));
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

    return Container(
      width: 250,
      margin: EdgeInsets.only(top: largerMargin),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 19, 27, 40),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(largerRadius),
            bottomRight: Radius.circular(largerRadius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          /// Header begin
          Container(
              margin: EdgeInsets.only(
                  top: normalMargin, left: normalMargin, right: normalMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      popScreen(context);
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
              child: GestureDetector(
            onTap: () {
              pushScreen(context, SignInScreen(size));
//              popScreen(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: normalMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: smallerMargin),
                    child: Icon(Icons.fast_rewind,
                        color: Color.fromARGB(255, 19, 158, 214)),
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 19, 158, 214)),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: HomeHeader('MOVIES'));
  }
}
