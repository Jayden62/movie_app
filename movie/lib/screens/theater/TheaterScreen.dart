import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/switch/SwitchButton.dart';
import 'package:movie/screens/theater/TheaterItem.dart';
import 'package:movie/widgets/MyDivider.dart';

class TheaterScreen extends BaseScreen {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget onInitBody(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(
        children: <Widget>[
          initSearching(),
          initAreas(),
          initItems(),
        ],
      ),
    );
  }

  Widget initAreas() {
    return SwitchButton(
      'Texas',
      'Dallas',
      height: 50,
      margin: EdgeInsets.only(
          top: normalMargin, left: normalMargin, right: normalMargin),
    );
  }

  Widget initItems() {
    List<Widget> items = [];

    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));
    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));
    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));
    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));
    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));
    items.add(TheaterItem('Marvel', '10km', '10:30- 21:30', '25A Broadway'));

    return Container(
      margin: EdgeInsets.only(left: normalMargin, right: normalMargin),
      child: ListView(shrinkWrap: true, children: items),
    );
  }

  Widget initSearching() {
    return Container(
        height: 50,
        margin: EdgeInsets.only(left: normalMargin, right: normalMargin),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white70),
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.left,
                    controller: searchController,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                        hintText: 'searching...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: normalPadding, top: smallerMargin),
                        hintStyle: TextStyle(color: Colors.white70)),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: normalMargin, top: smallerMargin),
                  child: Icon(
                    Icons.search,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return null;
  }
}
