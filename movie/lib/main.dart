import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie/screens/splash/SplashScr.dart';
import 'package:movie/screens/trailer/TrailerScreen.dart';
import 'package:movie/utils/LocalizationsDelegateUtil.dart';

void main() async {
  /// Method channel to call method from native
  const platform = const MethodChannel('com.movie');

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MainScreen());
  });
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Localization, support english and vietnamese languages
      localizationsDelegates: [
        const LocalizationsDelegateUtil(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
//          primaryColor: ye,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashSrc(),
//        home: TrailerScreen(),
    );
  }
}
