import 'package:flutter/material.dart';
import 'package:my_app/common/dog_detail_enter_animations.dart';
import 'package:my_app/model/dog_model.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class DogDetailPage extends StatefulWidget {
  DogDetailPage({Key key, this.dog, this.animation}) : super(key: key);

  final Dog dog;
  final DogDetailsEnterAnimations animation;

  @override
  _DogDetailPageState createState() => _DogDetailPageState(dog, animation);
}

class _DogDetailPageState extends State<DogDetailPage>
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
          height: scrrenWidth + 84,
          width: scrrenWidth + 84,
          // Use Box Decoration to make the image a circle
          // and add an arbitrary shadow for styling.
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
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

  // The rating section that says ★ 10/10.
  Widget get rating {
    // Use a row to lay out widgets horizontally.
    return Row(
      // Center the widgets on the main-axis
      // which is the horizontal axis in a row.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(' ${widget.dog.rating} / 10',
            style: Theme.of(context).textTheme.display2),
      ],
    );
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
    return Container(
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
            Colors.purple,
          ],
        ),
      ),
      child: Stack(children: <Widget>[
        // Align(
        //   alignment: Alignment.bottomLeft,
        //   child: ClipRRect(
        //       borderRadius: new BorderRadius.only(
        //           topLeft: Radius.circular(40.0),
        //           topRight: Radius.circular(40.0)),
        //       child: Container(
        //         height: scrrenWidth,
        //         width: scrrenWidth,
        //         color: Colors.white,
        //       )),
        // )
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Hero(
              tag: "dogCard" + _dog.id.toString(),
              child: ClipRRect(
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      height: scrrenWidth + 44,
                      width: scrrenWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                              width: 0.0, color: Colors.transparent)),
                    ),
                  )),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 0.0),
            dogImage,
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 0.0),
          height: 130,
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 1],
              // Add one stop for each color. Stops should increase from 0 to 1
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.black54,
                Colors.transparent,
              ],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, //No more green
            elevation: 0.0, //Shadow gone
          ),
        ),
      ]),
    );
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
    return -2 * math.pow(t, 2) + 2 * t + 1;
  }
}
