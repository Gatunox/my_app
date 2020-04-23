import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/manager/breed_manager.dart';
//import 'package:my_app/pages/left_pane.dart';
//import 'package:my_app/pages/center_pane.dart';
//import 'package:my_app/pages/right_pane.dart';
//import 'package:my_app/pages/second_route.dart';
import 'package:my_app/pages/third_route.dart';
//import 'package:my_app/pages/forth_route.dart';
import 'package:my_app/pages/fifth_route.dart';
import 'package:my_app/provider/provider.dart';
import 'package:my_app/styles/colors.dart';
//import 'package:my_app/splash_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PageController controller = new PageController(
    initialPage: 1,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent, // Color for Android
      ));
    } else if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent, // Color for Android
      ));
    }

    return Provider(
      data: BreedManager(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.light,
          accentColor: Colors.black,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          '/': (context) => FifthRoute(title: 'Dog Breeds'),
          // When we navigate to the "/second" route, build the SecondScreen Widget
          // '/second': (context) => SecondRoute(),
          '/third': (context) => ThirdRoute(title: 'We Rate Dogs'),
          // '/forth': (context) => ForthRoute(),
          // '/splash': (context) => SplashRoute(),
          // '/fifth': (context) => FifthRoute(title: 'We Rate Dogs'),
        },
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  FirstRoute({Key key, this.controller}) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        new FifthRoute(title: 'Dos Breeds'),
        //new LeftPage(title: 'Flutter Demo Left Page', controller: controller),
        //new HomePage(title: 'Flutter Demo Home Page', controller: controller),
        //new RightPage(title: 'Flutter Demo Right Page', controller: controller),
      ],
      controller: controller,
    );
  }
}
