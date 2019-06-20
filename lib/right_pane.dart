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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print(widget.controller.page);
            widget.controller
                .animateToPage(1, duration: _duration, curve: _curve);
          },
        ),
      ),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override

  bool get wantKeepAlive => true;
}