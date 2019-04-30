import 'package:flutter/material.dart';
import 'package:movie/base/screen/BaseScreen.dart';
import 'package:movie/base/style/BaseStyle.dart';
import 'package:movie/custom/button/Button.dart';
import 'package:movie/middle/model/Data.dart';
import 'package:movie/middle/model/ScreenSize.dart';
import 'package:movie/middle/provider/base/BlocProvider.dart';
import 'package:movie/middle/provider/home/BlocHome.dart';
import 'package:movie/middle/provider/signin/BlocSignIn.dart';
import 'package:movie/screens/home/HomeScreen.dart';

class SignInScreen extends BaseScreen {
  final userNameController = TextEditingController();
  final passwordNameController = TextEditingController();

  final ScreenSize size;

  SignInScreen(this.size);

  @override
  Widget onInitBody(BuildContext context) {
    final BlocSignIn blocSignIn = BlocProvider.of<BlocSignIn>(context);
    initSignInCallback(context, blocSignIn);
    return Container(
      padding: EdgeInsets.all(normalPadding),
      color: Color.fromARGB(255, 30, 42, 58),
      child: ListView(
        children: <Widget>[
          initTitle(),
          initUserNameLabel(),
          initUserName(blocSignIn),
          initPasswordLabel(),
          initPassword(),
          initLogin(blocSignIn),
        ],
      ),
    );
  }

  void initSignInCallback(BuildContext context, BlocSignIn blocSignIn) {
    blocSignIn.signInCallback = (data) async {
      if (data == true) {
        pushScreen(
            context,
            BlocProvider<BlocHome>(
                child: HomeScreen(size, userNameController.text),
                bloc: BlocHome()));
//        hideLoadingDialog(context);
      } else {
        showMessageDialog(context, 'Can not login with this account.');
      }

//      if (data == null) {
//        return;
//      } else if( data == "admin"){
//
//        pushScreen(context, HomeScreen(size, userNameController.text));
//      }
//      hideLoadingDialog(context);
    };
  }

  Widget initTitle() {
    return Container(
      margin:
          EdgeInsets.only(top: 100, left: normalMargin, right: normalMargin),
      child: Center(
        child: Text(
          'SWEET MOVIE',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 36, color: yellowColor),
        ),
      ),
    );
  }

  Widget initUserNameLabel() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Text(
        'USER NAME',
        style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 93, 104, 120),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget initUserName(BlocSignIn blocSignIn) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      padding: EdgeInsets.only(left: 20),
      decoration: userNameBoxDecoration,
      child: TextField(
        maxLines: 1,
        textAlign: TextAlign.justify,
        controller: userNameController,
        decoration: InputDecoration(border: InputBorder.none),
        style: TextStyle(color: Colors.white),
        onChanged: (text) {
          if (text.isNotEmpty) {
            blocSignIn.signInEnabledController.add(true);
          } else {
            blocSignIn.signInEnabledController.add(false);
          }
        },
      ),
    );
  }

  Widget initPasswordLabel() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        'PASSWORD',
        style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 93, 104, 120),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget initPassword() {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: userNameBoxDecoration,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.justify,
                obscureText: true,
                controller: passwordNameController,
                decoration: InputDecoration(border: InputBorder.none),
                style: TextStyle(color: Colors.white),
                onSubmitted: (String text) {},
              ),
            ),
            Container(
              child: Icon(Icons.remove_red_eye,
                  color: Color.fromARGB(255, 63, 75, 90)),
            ),
          ],
        ));
  }

  Widget initLogin(BlocSignIn blocSignIn) {
    return StreamBuilder(
      stream: blocSignIn.signInEnabledStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        bool enable = false;
        if (snapshot.hasData && snapshot.data) {
          enable = true;
        }
        return Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Text(
                    'FORGET SOMTHING ? ',
                    style: TextStyle(color: Color.fromARGB(255, 93, 104, 120)),
                  )),
                  Button('LOGIN',
                      alignment: Alignment.center,
                      height: 40,
                      width: 120,
                      defaultStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      defaultDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color.fromARGB(255, 253, 194, 12)),
                      highlightDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          boxShadow: [buttonBoxShadow],
                          color: yellowColor),
                      disableDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Colors.grey,
                          boxShadow: [buttonBoxShadow]),
                      disableStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      enable: enable, onPress: () {
                    if (userNameController.text.isEmpty ||
                        passwordNameController.text.isEmpty) {
                      showMessageDialog(context, 'Please, input empty.');
                    } else {
                      blocSignIn.inputSignInSink.add(Data(context, [
                        userNameController.text,
                        passwordNameController.text
                      ]));
//                      showLoadingDialog(context);
                    }
                  })
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Text(
                  'REGISTER ACCOUNT.',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
