import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/home/BlocHome.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomState();
  }
}

class BottomState extends State<BottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final BlocHome blocHome = BlocProvider.of<BlocHome>(context);
    return Container(
      child: BottomNavigationBar(
          onTap: (value) async {
            onItemTapped(value);
            blocHome.homeSink.add(value);
          },
          currentIndex: currentIndex,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Color.fromARGB(255, 30, 42, 58),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_creation,
//                color: colors[currentIndex],
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
          ]),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
