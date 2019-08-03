import 'package:flutter/material.dart';
import 'package:my_app/common/dog_detail_enter_animations.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class DogDetailSliver extends StatefulWidget {
  DogDetailSliver({Key key, this.dog, this.animation}) : super(key: key);

  final Dog dog;
  final DogDetailsEnterAnimations animation;

  @override
  _DogDetailPageState createState() => _DogDetailPageState(dog, animation);
}

class _DogDetailPageState extends State<DogDetailSliver>
    with AutomaticKeepAliveClientMixin {
  _DogDetailPageState(this._dog, this._animation);

  Dog _dog;
  DogDetailsEnterAnimations _animation;

  Widget get dogImage {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    //print("Call get dogImage");
    // Containers define the size of its children.
    var dogAvatar = Hero(
        // The same code, except the Dog property lives on the widget in this file.
        tag: "dogImage" + _dog.id.toString(),
        // flightShuttleBuilder: (
        //   BuildContext flightContext,
        //   Animation<double> animation,
        //   HeroFlightDirection flightDirection,
        //   BuildContext fromHeroContext,
        //   BuildContext toHeroContext,
        // ) {
        //   final Hero toHero = toHeroContext.widget;
        //   return ScaleTransition(
        //     scale: animation.drive(
        //       Tween<double>(begin: 0.0, end: 1.0).chain(
        //         CurveTween(
        //           curve: Interval(0.0, 1.0, curve: PeakQuadraticCurve()),
        //         ),
        //       ),
        //     ),
        //     child: toHero.child,
        //   );
        // },
        child: Container(
          height: scrrenWidth + 84,
          width: scrrenWidth + 84,
          // Use Box Decoration to make the image a circle
          // and add an arbitrary shadow for styling.
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            shape: BoxShape.rectangle,
            // This is how you add an image to a Container's background.
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(_dog.imageUrl ?? '')),
            border: Border.all(width: 1.0, color: Colors.black54),
          ),
        ));

    //print("Getting dogImage = " + widget.dog.imageUrl);
    return widget.dog.imageUrl == "" ? Container() : dogAvatar;
  }

  Future<void> executeAfterBuild() async {
    if (mounted) {
      setState(() {
        //print("executeAfterBuild");
      });
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeigh = MediaQuery.of(context).size.height;
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
              Color(0xFF1b202b),
              Color(0xFF1b202b),
            ],
          ),
        ),
        child: Stack(children: <Widget>[
          NestedScrollView(
            // body: Align(
            //   alignment: Alignment.bottomLeft,
            //   child: ClipRRect(
            //       borderRadius: new BorderRadius.only(
            //           topLeft: Radius.circular(40.0),
            //           topRight: Radius.circular(40.0)),
            //       child: Container(
            //         height: 710,
            //         width: scrrenWidth,
            //         color: Colors.white,
            //       )),
            // ),
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                    borderRadius: new BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    child: Material(
                      color: Colors.purple,
                      elevation: 0,
                      child: Container(
                        margin: const EdgeInsets.only(top: 2.0),
                        height: 735,
                        width: scrrenWidth,
                        decoration: BoxDecoration(
                            color: darkerPurpleColor,
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
                                      text: widget.dog.location,
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
                                          text: ': ${widget.dog.rating} / 10',
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
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                // SliverAppBar(
                //   elevation: 0,
                //   expandedHeight: 600.0,
                //   floating: false,
                //   pinned: true,
                //   backgroundColor: Colors.transparent,
                //   flexibleSpace: FlexibleSpaceBar(
                //     centerTitle: true,
                //     title: Container(

                //         // Use Box Decoration to make the image a circle
                //         // and add an arbitrary shadow for styling.
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(40),
                //               topRight: Radius.circular(40),
                //               bottomLeft: Radius.circular(40),
                //               bottomRight: Radius.circular(40)),
                //           shape: BoxShape.rectangle,

                //           // This is how you add an image to a Container's background.
                //         ),
                //         child: Text("Collapsing Toolbar",
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 16.0,
                //             ))),
                //     background: Container(
                //       margin: const EdgeInsets.only(bottom: 60.0),
                //       // Use Box Decoration to make the image a circle
                //       // and add an arbitrary shadow for styling.
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(40),
                //             topRight: Radius.circular(40),
                //             bottomLeft: Radius.circular(40),
                //             bottomRight: Radius.circular(40)),
                //         shape: BoxShape.rectangle,
                //         color: Colors.transparent,
                //         // This is how you add an image to a Container's background.
                //         image: DecorationImage(
                //             fit: BoxFit.cover,
                //             image: NetworkImage(_dog.imageUrl ?? '')),
                //         border: Border.all(width: 1.0, color: Colors.black54),
                //       ),
                //     ),
                //   ),
                // ),
                SliverPersistentHeader(
                  delegate: MySliverAppBar(expandedHeight: 730.0, dog: _dog),
                  pinned: true,
                ),
              ];
            },
          ),
        ]));
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
  final Dog dog;

  MySliverAppBar({@required this.expandedHeight, @required this.dog});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        SafeArea(
          bottom: false,
          child: Hero(
            // The same code, except the Dog property lives on the widget in this file.
            tag: "dogImage" + dog.id.toString(),
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
            child: Container(
              margin: const EdgeInsets.only(bottom: 55.0),
              // Use Box Decoration to make the image a circle
              // and add an arbitrary shadow for styling.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                // This is how you add an image to a Container's background.
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(dog.imageUrl ?? '')),
                border: Border.all(width: 2.0, color: foregroungColor),
              ),
            ),
          ),
        ),

        // Image.network(
        //   dog.imageUrl,
        //   fit: BoxFit.cover,
        // ),
        Container(
          child: Hero(
            tag: "dogName" + dog.name.toString(),
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Opacity(
                    opacity: 1.0,
                    //opacity: shrinkOffset / expandedHeight,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        dog.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent, //No more green
          elevation: 0.0, //Shadow gone
          primary: true,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
