import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:my_app/pages/left_pane.dart';
//import 'package:my_app/pages/center_pane.dart';
//import 'package:my_app/pages/right_pane.dart';
//import 'package:my_app/pages/second_route.dart';
import 'package:my_app/pages/third_route.dart';
//import 'package:my_app/pages/forth_route.dart';
import 'package:my_app/pages/fifth_route.dart';
//import 'package:my_app/splash_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PageController controller = new PageController(
    initialPage: 1,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
        
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.purple,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => FifthRoute(title: 'Dos Breeds'),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        // '/second': (context) => SecondRoute(),
        '/third': (context) => ThirdRoute(title: 'We Rate Dogs'),
        // '/forth': (context) => ForthRoute(),
        // '/splash': (context) => SplashRoute(),
        // '/fifth': (context) => FifthRoute(title: 'We Rate Dogs'),
      },
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
