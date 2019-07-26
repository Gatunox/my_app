import 'package:flutter/material.dart';
import 'package:my_app/pages/dog_detail_sliver.dart';
import 'package:my_app/model/dog_model.dart';
import 'dog_detail_enter_animations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:transparent_image/transparent_image.dart';

class DogCardSliver extends StatefulWidget {
  final Dog dog;

  DogCardSliver({Key key, this.dog}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCardSliver>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  _DogCardState(this._dog);

  String _renderUrl = "";
  Dog _dog;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.reset();
    _controller.forward();
    renderDogPic();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    timeDilation = 1.0;
    return Container(
      width: scrrenWidth - 30,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 0.0),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: dogImage)),
            ],
          ),
        ),
      ),
    );
    //);
  }

  showDogDetailPage() {
    bool showDetail = _renderUrl == "" ? false : true;
    if (showDetail) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return DogDetailSliver(
                dog: _dog, animation: DogDetailsEnterAnimations(_controller));
          },
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    }
  }

  // IRL, we'd want the Dog class itself to get the image
  // but this is a simpler way to explain Flutter basics
  void renderDogPic() async {
    // this makes the service call
    await _dog.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    if (mounted) {
      // Avoid calling `setState` if the widget is no longer in the widget tree.
      setState(() {
        _renderUrl = _dog.imageUrl;
      });
    }
  }

  Widget get dogImageContainer {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: new BorderRadius.circular(30.0),
      child: Stack(children: <Widget>[
        Container(
          height: scrrenHeight,
          width: scrrenWidth - 30,
          child: FittedBox(
            fit: BoxFit.cover,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _renderUrl,
            ),
          ),
        ),
        Container(
          height: scrrenHeight,
          width: scrrenWidth - 30,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30.0),
              // image: DecorationImage(
              //   // Just like CSS's `imagesize` property.
              //   fit: BoxFit.cover,
              //   image: NetworkImage(_renderUrl ?? ''),
              // ),
              border: Border.all(width: 1.0, color: Colors.black45)),
        ),
      ]),
    );
  }

  Widget get dogImage {
    final double scrrenWidth = MediaQuery.of(context).size.width;
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
        child: GestureDetector(
            onTap: () {
              showDogDetailPage();
            },
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(30.0),
                child: Container(
                  width: scrrenWidth - scrrenWidth / 7,
                  height: scrrenWidth + scrrenWidth / 7,
                  child: Stack(children: <Widget>[
                    Positioned(
                      width: scrrenWidth - scrrenWidth / 7,
                      height: scrrenWidth + scrrenWidth / 6,
                      child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                              child: Icon(
                                Icons.pets,
                                color: Colors.white,
                                size: 140.0,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black54)))),
                    ),
                    _renderUrl == "" ? Container() : dogImageContainer,
                  ]),
                ))));

    //print("Getting dogImage = " + widget.dog.imageUrl);
    return _dog.imageUrl == "" ? Container() : dogAvatar;
  }

  @override
  bool get wantKeepAlive => true;
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -2 * math.pow(t, 2) + 2 * t + 1;
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 1 * math.pow(t - 0.5, 2);
  }
}