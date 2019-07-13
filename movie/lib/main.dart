import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/introduction/IntroductionScreen.dart';
import 'package:movie/screens/signin/SignInScreen.dart';
import 'package:movie/utils/LocalizationsDelegateUtil.dart';

void main() async {
  /// Method channel to call method from native
  const platform = const MethodChannel('com.movie');

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MainScreen());
  });

//  final taskId = await FlutterDownloader.enqueue(
//    url:
//        'https://drive.google.com/file/d/115gixznv2C5iG-I6rOjL1Z8aGRyKIPic/view?usp=sharing',
//    savedDir: 'assets/images/',
//    showNotification: true,
//    // show download progress in status bar (for Android)
//    openFileFromNotification:
//        true, // click on notification to open downloaded file (for Android)
//  );
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'N-movie',

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
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: IntroductionScreen(),
    );
  }
}
