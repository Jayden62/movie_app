import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/signin/SignInScreen.dart';

class IntroductionScreen extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    //making list of pages needed to pass in IntroViewsFlutter constructor.
    final pages = [
      PageViewModel(
        pageColor: Color.fromARGB(255, 122, 160, 222),
        body: Text(
          'Haselfree  booking  of  flight  tickets  with  full  refund  on  cancelation',
          style: TextStyle(fontSize: 16),
        ),
        mainImage: Image.asset('assets/photos/film.png'),
        title: Text('Films', style: TextStyle(fontSize: 35)),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: Color.fromARGB(255, 176, 170, 109),
        body: Text(
          'We  work  for  the  comfort ,  enjoy  your  stay  at  our  beautiful  hotels',
          style: TextStyle(fontSize: 16),
        ),
        mainImage: Image.asset('assets/photos/booking.png'),
        title: Text('Booking', style: TextStyle(fontSize: 35)),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
      PageViewModel(
        pageColor: const Color(0xFF607D8B),
        body: Text(
          'Easy  cab  booking  at  your  doorstep  with  cashless  payment  system',
          style: TextStyle(fontSize: 16),
        ),
        mainImage: Image.asset('assets/photos/popcorn.png'),
        title: Text('Menu', style: TextStyle(fontSize: 35)),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      ),
    ];
    return Builder(
      builder: (context) => IntroViewsFlutter(
        pages,
        onTapDoneButton: () {
          pushScreen(
              context,
              BlocProvider<BlocSignIn>(
                  child: SignInScreen(), bloc: BlocSignIn()));
        },
        showSkipButton: true,
        //Whether you want to show the skip button or not.
        pageButtonTextStyles: TextStyle(
          color: Colors.white70,
          fontSize: 16.0,
        ),
      ), //IntroViewsFlutter
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return null;
  }
}
