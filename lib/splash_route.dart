import 'package:flutter/material.dart';

class SplashRoute extends StatefulWidget {
  SplashRoute({Key key, this.title, this.controller}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final PageController controller;

  @override
  _SplashRouteState createState() => _SplashRouteState();
}

class _SplashRouteState extends State<SplashRoute>
    with AutomaticKeepAliveClientMixin {

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.purple,
            Colors.amber,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 
          
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          Positioned(
            //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: Text(widget.title),
              backgroundColor: Colors.transparent,
              elevation: 0.0, //Shadow gone
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
