import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/screens/movie/comingsoon/ComingSoonItem.dart';

class ComingSoonScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
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

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return null;
  }
}
