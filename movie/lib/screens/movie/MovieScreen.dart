import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/screens/movie/MovieHeader.dart';
import 'package:movie/screens/movie/MovieItem.dart';
import 'package:movie/screens/movie/MovieStyle.dart';
import 'package:movie/screens/movie/ComingSoonItem.dart';

class MovieScreen extends BaseScreen {
  final ScreenSize size;

  MovieScreen(this.size);

  @override
  Widget onInitBody(BuildContext context) {
    TabController tabController;
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
        initCommonPoster(context),
        initCommonInfo(context),
      ],
    );
  }

  Widget initSpecial(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        initCommonPoster(context),
        initCommonInfo(context),
      ],
    );
  }

  Widget initComingSoon() {
    List<Widget> items = [];
    items.clear();
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
      child: ListView(children: items),
    );
  }

  Widget initCommonPoster(BuildContext context) {
    List<Widget> items = [];
    items.clear();
    items.add(MovieItem(
        'http://lestoilesheroiques.fr/wp-content/uploads/2019/03/D2HmK8zUcAAJPiq.jpg',
        'HELL BOY',
        'C16',
        '2giờ 2phút 12 Thg 4, 2019'));
    items.add(MovieItem(
        'http://lestoilesheroiques.fr/wp-content/uploads/2019/03/D2HmK8zUcAAJPiq.jpg',
        'HELL BOY',
        'C16',
        '2giờ 2phút 12 Thg 4, 2019'));
    return Expanded(
        child: Container(
            padding: EdgeInsets.all(normalPadding),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: items,
            )));
  }

  Widget initCommonInfo(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: normalMargin, right: normalMargin, bottom: normalMargin),
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
                        'HELL BOY',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
                              'C16',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 242, 115, 101),
                                  fontSize: 12),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: smallestMargin),
                  child: Text(
                    '2giờ 2phút 12 Thg 4, 2019',
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 104, 120),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: initBookButton(context),
            ),
          ],
        ));
  }

  /// Init book button
  Widget initBookButton(BuildContext context) {
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
        onPress: () {});
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(45), child: MovieHeader());
  }
}