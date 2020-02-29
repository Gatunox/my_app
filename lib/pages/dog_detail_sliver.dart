import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/dog_detail_enter_animations.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class DogDetailSliver extends StatefulWidget {
  DogDetailSliver({Key key, this.breed, this.animation}) : super(key: key);

  final Breed breed;
  final DogDetailsEnterAnimations animation;

  @override
  _DogDetailPageState createState() => _DogDetailPageState(breed, animation);
}

class _DogDetailPageState extends State<DogDetailSliver>
    with AutomaticKeepAliveClientMixin {
  _DogDetailPageState(this._breed, this._animation);

  Breed _breed;
  DogDetailsEnterAnimations _animation;

  Future<void> executeAfterBuild() async {
    if (mounted) {
      setState(() {
        //print("executeAfterBuild");
      });
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [backgroundColor, backgroundColor],
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(screenWidth * 0.2, -screenHeight * 0.30),
        child: Transform.rotate(
          angle: -0.3,
          child: Icon(
            Icons.pets,
            color: Colors.white10,
            size: screenWidth,
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(screenWidth * -0.2, screenHeight * 0.245),
        child: Transform.rotate(
          angle: -0.7,
          child: Icon(
            Icons.pets,
            color: Colors.white10,
            size: screenWidth,
          ),
        ),
      ),
      NestedScrollView(
        body: Column(
          children: <Widget>[
            Container(
              child: Hero(
                tag: "dogName" + widget.breed.name.toString(),
                flightShuttleBuilder: (
                  BuildContext flightContext,
                  Animation<double> animation,
                  HeroFlightDirection flightDirection,
                  BuildContext fromHeroContext,
                  BuildContext toHeroContext,
                ) {
                  return DefaultTextStyle(
                    style: DefaultTextStyle.of(toHeroContext).style,
                    child: toHeroContext.widget,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, bottom: 0.0, left: 0.0, right: 0.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Material(
                        color: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Colors.transparent,
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.05,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  widget.breed.name,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 0.0, left: 0.0, right: 0.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                          // bottomLeft: Radius.circular(30.0),
                          // bottomRight: Radius.circular(30.0)
                          ),
                      child: Material(
                        color: darkerPurpleColor87,
                        elevation: 0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 2.0),
                          //height: 635,
                          //width: scrrenWidth,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  width: 0.0, color: Colors.transparent)),
                          child: Padding(
                            // The class that controls padding is called 'EdgeInsets'
                            // The EdgeInsets.only constructor is used to set
                            // padding explicitly to each side of the child.
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              bottom: 10.0,
                              left: 20.0,
                            ),
                            // Column is another layout widget -- like stack -- that
                            // takes a list of widgets as children, and lays the
                            // widgets out from top to bottom.
                            child: Column(
                              // These alignment properties function exactly like
                              // CSS flexbox properties.
                              // The main axis of a column is the vertical axis,
                              // `MainAxisAlignment.spaceAround` is equivalent of
                              // CSS's 'justify-content: space-around' in a vertically
                              // laid out flexbox.
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: widget.breed.location,
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.purpleAccent,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                ': ${widget.breed.rating} / 10',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                  expandedHeight: (screenHeight / 1.5), breed: _breed),
              pinned: false,
            ),
          ];
        },
      ),
    ]);
  }

  //Finally, the build method:
  //
  // Aside:
  // It's often much easier to build UI if you break up your widgets the way I
  // have in this file rather than trying to have one massive build method
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => executeAfterBuild());
    return new Scaffold(
      body: new AnimatedBuilder(
        animation: _animation.controller,
        builder: _buildAnimation,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -2 * math.pow(t, 1) + 2 * t + 1;
    //return -2 * math.pow(t, 2) + 2 * t + 1;
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Breed breed;

  MySliverAppBar({@required this.expandedHeight, @required this.breed});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Hero(
          // The same code, except the Dog property lives on the widget in this file.
          tag: "dogImage" + breed.id.toString(),
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            final Hero toHero = toHeroContext.widget;
            return ScaleTransition(
              scale: animation.drive(
                Tween<double>(begin: 0.0, end: 1.0).chain(
                  CurveTween(
                    curve: Interval(0.0, 1.0, curve: PeakQuadraticCurve()),
                  ),
                ),
              ),
              child: toHero.child,
            );
          },
          child: ClipRRect(
            borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(35),
                bottomRight: const Radius.circular(35),
                // topLeft: const Radius.circular(30),
                // topRight: const Radius.circular(30)
                ),
            child: Container(
              // child: FittedBox(
              //   fit: BoxFit.cover,
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("images/paw.png"),
                image: NetworkImage(breed.https),
              ),
              // Image.network(widget.breed.https,),
              // ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(35),
              bottomRight: const Radius.circular(35),
              // topLeft: const Radius.circular(30),
              // topRight: const Radius.circular(30)
              ),
          child: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3],
                // Add one stop for each color. Stops should increase from 0 to 1
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.black38,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.transparent, //No more green
          elevation: 0.0,
          primary: true,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
