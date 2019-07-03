import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSrc extends BaseScreen {
  @override
  Widget onInitBody(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:
          BlocProvider<BlocSignIn>(child: SignInScreen(), bloc: BlocSignIn()),
      image: Image.asset('assets/photos/photo_splash.png'),
      backgroundColor: Color.fromARGB(255, 30, 42, 58),
      styleTextUnderTheLoader: TextStyle(),
      loadingText: Text(
        'Welcome to flutter',
        style: TextStyle(fontSize: 16, color: Colors.white70),
      ),
      loaderColor: Color.fromARGB(255, 93, 104, 120),
    );
  }

  @override
  PreferredSize onInitAppBar(BuildContext context) {
    return null;
  }
}
