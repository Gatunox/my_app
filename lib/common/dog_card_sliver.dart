import 'package:flutter/material.dart';
import 'package:my_app/pages/dog_detail_sliver.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';
import 'dog_detail_enter_animations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;
import 'package:transparent_image/transparent_image.dart';

class DogCardSliver extends StatefulWidget {
  final Dog dog;
  final double scale;

  DogCardSliver({Key key, this.dog, this.scale}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState();
}

class _DogCardState extends State<DogCardSliver>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  _DogCardState();

  bool _isVisible = true;
  String _renderUrl = "";
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
    //renderDogPic();
    //print("DogCardSliver initState");
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
    //print("DogCardSliver build = " + widget.dog.name);
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            children: <Widget>[
              Card(
                  elevation: 0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                      color: Colors.transparent,
                      width: (scrrenWidth) * widget.scale,
                      height: (scrrenWidth + 10) * widget.scale,
                      child: dogImage)),
            ],
          ),
        ),
      ),
    );
    //);
  }

  showDogDetailPage() {
    bool showDetail = widget.dog.https == "" ? false : true;
    if (showDetail) {
      setState(() {
        _isVisible = false;
      });
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return DogDetailSliver(
                dog: widget.dog, animation: DogDetailsEnterAnimations(_controller));
          },
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(
              opacity: animation1,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 600),
        ),
      );
    }
  }

  // IRL, we'd want the Dog class itself to get the image
  // but this is a simpler way to explain Flutter basics
  void renderDogPic() async {
    // this makes the service call
    await widget.dog.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    if (mounted) {
      // Avoid calling `setState` if the widget is no longer in the widget tree.
      setState(() {
        _renderUrl = widget.dog.imageUrl;
      });
    }
  }

  Widget get dogImageContainer {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    //print("dogImageContainer = " + widget.dog.name);
    return ClipRRect(
      borderRadius: new BorderRadius.circular(30.0),
      child: Stack(children: <Widget>[
        // Hero(
        //   tag: "dogImage" + _dog.id.toString(),
        //   flightShuttleBuilder: (
        //     BuildContext flightContext,
        //     Animation<double> animation,
        //     HeroFlightDirection flightDirection,
        //     BuildContext fromHeroContext,
        //     BuildContext toHeroContext,
        //   ) {
        //     final Hero toHero = toHeroContext.widget;
        //     return ScaleTransition(
        //       scale: animation.drive(
        //         Tween<double>(begin: 0.0, end: 1.0).chain(
        //           CurveTween(
        //             curve: Interval(0.0, 1.0, curve: PeakQuadraticCurve()),
        //           ),
        //         ),
        //       ),
        //       child: toHero.child,
        //     );
        //   },
        //  child:
        Container(
          child: Hero(
            tag: "dogImage" + widget.dog.id.toString(),
            child: ClipRRect(
              borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(30.0),
                  bottomRight: const Radius.circular(30),
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30)),
              child: Container(
                width: (scrrenWidth / 1.1) * widget.scale,
                height: (scrrenWidth / 1.1) * widget.scale,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.dog.https,
                  ),
                ),
              ),
            ),
          ),
        ),
        //),
        Container(
          child: Hero(
            tag: "dogName" + widget.dog.name.toString(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: ClipRRect(
                  borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30),
                      topLeft: const Radius.circular(30),
                      topRight: const Radius.circular(30)),
                  child: Container(
                    width: (scrrenWidth),
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.dog.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
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
        ),
      ]),
    );
  }

  Widget get dogImage {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    //print("dogImage = " + widget.dog.name + ' , ' + widget.dog.https);
    var dogAvatar =
        //Hero(
        // tag: "dogImage" + _dog.id.toString(),
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
        //child:
        GestureDetector(
            onTap: () {
              showDogDetailPage();
            },
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(30.0),
              child: Stack(children: <Widget>[
                Positioned(
                  child: Visibility(
                    visible: _isVisible,
                    child: Container(
                        width: (scrrenWidth / 1.1) * widget.scale,
                        height: (scrrenWidth / 1.1) * widget.scale,
                        child: Icon(
                          Icons.pets,
                          color: Colors.white,
                          size: 140.0,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: darkerPurpleColor,
                            borderRadius: BorderRadius.circular(30.0),
                            border:
                                Border.all(width: 2.0, color: Colors.purple))),
                  ),
                ),
                widget.dog.https == "" ? Container() : dogImageContainer,
              ]),
            ))
        //)
        ;

    //print("Getting dogImage = " + widget.dog.imageUrl);
    return widget.dog.imageUrl == "" ? Container() : dogAvatar;
  }

  @override
  bool get wantKeepAlive => true;
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -15 * math.pow(t, 2) + 15 * t + 1;
    //return -2 * math.pow(t, 1) + 2 * t + 1;
  }
}
