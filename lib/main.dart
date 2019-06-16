import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final PageController controller = new PageController(
    initialPage: 1,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        primarySwatch: Colors.orange,
      ),
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => FirstRoute(controller: controller),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/second': (context) => SecondRoute(),
      },
    );
  }
}

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

class LeftPage extends StatefulWidget {
  LeftPage({Key key, this.title, this.controller}) : super(key: key);

  final String title;
  PageController controller;

  @override
  _LeftPageState createState() => _LeftPageState();
}

class RightPage extends StatefulWidget {
  RightPage({Key key, this.title, this.controller}) : super(key: key);

  final String title;
  PageController controller;

  @override
  _RightPageState createState() => _RightPageState();
}

class FirstRoute extends StatelessWidget {
  FirstRoute({Key key, this.controller}) : super(key: key);
  
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
        children: <Widget>[
          new LeftPage(
              title: 'Flutter Demo Left Page', controller: controller),
          new HomePage(
              title: 'Flutter Demo Home Page', controller: controller),
          new RightPage(
              title: 'Flutter Demo Right Page', controller: controller),
        ],
        controller: controller,
      );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
              child: Text('Open route'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        heroTag: "home_page_btn",
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _LeftPageState extends State<LeftPage>
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {
              print(widget.controller.page);
              widget.controller
                  .animateToPage(1, duration: _duration, curve: _curve);
            },
          ),
        ],
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
        heroTag: "left_page_btn",
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
