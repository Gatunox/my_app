import 'package:flutter/material.dart';

class RightPage extends StatefulWidget {
  RightPage({Key key, this.title, this.controller}) : super(key: key);

  final String title;
  final PageController controller;

  @override
  _RightPageState createState() => _RightPageState();
}

class _RightPageState extends State<RightPage>
    with AutomaticKeepAliveClientMixin {
  static const _duration = const Duration(milliseconds: 300);
  static const _curve = Curves.ease;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
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
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
              heroTag: "right_page_btn",
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
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                tooltip: 'back to center',
                onPressed: () {
                  print(widget.controller.page);
                  widget.controller
                      .animateToPage(1, duration: _duration, curve: _curve);
                },
              ),
              backgroundColor: Colors.transparent, //No more green
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
