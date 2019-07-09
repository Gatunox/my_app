import 'package:flutter/material.dart';
import 'dog_detail_enter_animations.dart';
import 'dog_model.dart';
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
        tag: _dog.hashCode,
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
          height: scrrenWidth,
          width: scrrenWidth,
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
            border: Border.all(width: 2.0, color: Colors.black54),
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
        print("executeAfterBuild");
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
            Colors.amber,
          ],
        ),
      ),
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 0.0),
          height: 200,
          child: AppBar(
            title: Text('Meet ${_dog.name}',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0)),
            backgroundColor: Colors.transparent, //No more green
            elevation: 0.0, //Shadow gone
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 125.0),
            dogImage,
          ],
        ),
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
          padding: const EdgeInsets.only(top: 0.0),
          child: Transform(
            transform: new Matrix4.translationValues(
              0.0,
              _animation.videoScrollerXTranslation.value,
              0.0,
            ),
            child: Opacity(
                opacity: _animation.videoScrollerOpacity.value,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: _dog.id,
                                          child: ClipRRect(
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0)),
                          child: Material(
                            color: Colors.white,
                            elevation: 10,
                            child: Container(
                              height: scrrenWidth + 10,
                              width: scrrenWidth,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(40.0),
                                  border: Border.all(
                  width: 2.0, color: Colors.black54)),
                            ),
                          )),
                    ),
                  )),
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
    return -4 * math.pow(t, 2) + 4 * t + 1;
  }
}
