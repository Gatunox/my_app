import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/pages/third_route.dart';
import 'package:my_app/styles/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.controller}) : super(key: key);

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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String _animationName = 'Idle';

  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //print(_animationName);
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
            backgroundColor,
            backgroundColor,
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
                  RaisedButton(
                    child: Text('Open\nOne',style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.pushNamed(context, '/second');
                    },
                    elevation: 2,
                    color: Color(0xFF2A2D37),
                    padding: EdgeInsets.all(40),
                    shape: CircleBorder(
                      side: BorderSide(color: foregroungColor, width: 2),
                    )
                  ),
                  RaisedButton(
                    child: Text('Open\nTwo',style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      //Navigator.pushNamed(context, '/third');
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) {
                            return ThirdRoute(title: 'We Rate Dogs');
                          },
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return FadeTransition(
                              opacity: animation1,
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                    elevation: 2,
                    color: Color(0xFF2A2D37),
                    padding: EdgeInsets.all(40),
                    shape: CircleBorder(
                      side: BorderSide(color: foregroungColor, width: 2),
                    )
                  ),
                  RaisedButton(
                    child: Text(
                      'Open\nThree',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    elevation: 2,
                    color: Color(0xFF2A2D37),
                    onPressed: () {
                      // Navigate to forth route when tapped.
                      Navigator.pushNamed(context, '/forth');
                    },
                    padding: EdgeInsets.all(40),
                    shape: CircleBorder(
                      side: BorderSide(color: foregroungColor, width: 2),
                    )
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fifth');
                    },
                    elevation: 2,
                    color: Color(0xFF2A2D37),
                    child: Text(
                      "Open\nFour",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(40),
                    shape: CircleBorder(
                      side: BorderSide(color: foregroungColor, width: 2),
                    ),
                  ),
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

  void _onButtonTap() {
    setState(() {
      if (_animationName == 'Idle' || _animationName == 'Restart') {
        _animationName = 'Loading';
      } else {
        _animationName = 'Restart';
      }
    });
  }

  void _onFlareCompleted(String animationName) {
    if (animationName == 'Restart') {
      setState(() {
        _animationName = 'Idle';
      });
    }
    print(animationName + " Finished Animating");
  }

  @override
  bool get wantKeepAlive => true;
}
