import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashSrc extends BaseScreen {
  final ScreenSize size;

  SplashSrc(this.size);

  @override
  Widget onInitBody(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: BlocProvider<BlocSignIn>(
          child: SignInScreen(size), bloc: BlocSignIn()),
      image: Image.asset('assets/photos/photo_splash.png'),
      backgroundColor: Color.fromARGB(255, 30, 42, 58),
      styleTextUnderTheLoader: TextStyle(),
      loaderColor: Color.fromARGB(255, 93, 104, 120),
    );
  }
}
