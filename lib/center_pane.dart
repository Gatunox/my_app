import 'package:flutter/material.dart';
import 'package:my_app/third_route.dart';
import 'package:flare_flutter/flare_actor.dart';

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
  int _counter = 0;
  String _animationName = 'Idle';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
    return Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.0, 1],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.grey[800],
            Colors.grey[900],
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
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  RaisedButton(
                    child: Text('Open Second Route'),
                    onPressed: () {
                      // Navigate to second route when tapped.
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                  RaisedButton(
                    child: Text('Open Third Route'),
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
                  ),
                  SizedBox(
                    width: 500,
                    height: 75,
                    child: GestureDetector(
                      onTap: _onButtonTap,
                      child: FlareActor(
                        'assets/Super-cool-button.flr',
                        animation: _animationName,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
              heroTag: "home_page_btn",
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

  @override
  bool get wantKeepAlive => true;
}
