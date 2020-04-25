import 'package:flutter/material.dart';
import 'package:my_app/common/dog_detail_animatior.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:my_app/styles/colors.dart';

class DogCardCompact extends StatefulWidget {
  final Breed breed;

  DogCardCompact({Key key, this.breed}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState(breed);
}

class _DogCardState extends State<DogCardCompact>
    with AutomaticKeepAliveClientMixin {
  String _renderUrl = "";
  Breed _breed;

  _DogCardState(this._breed);

  Widget get dogCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 266.0,
      height: 120.5,
      padding: const EdgeInsets.all(0.0),
      child: Hero(
        tag: "dogCard" + _breed.id.toString(),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          margin: const EdgeInsets.only(left: 10, right: 10),
          color: snowWhiteColor26,
          // Wrap children in a Padding widget in order to give padding.
          child: Padding(
            // The class that controls padding is called 'EdgeInsets'
            // The EdgeInsets.only constructor is used to set
            // padding explicitly to each side of the child.
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 22.0,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.breed.name,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.breed.location,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.purple,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: ': ${widget.breed.rating} / 10',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return GestureDetector(
      onTap: () {
        showDogDetailPage();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 0.0),
        child: Container(
          height: 121.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(top: 0.0, left: 0.0, child: dogImage),
              Positioned(
                top: 0.0,
                left: 130.0,
                right: 0.0,
                child: dogCard,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    bool showDetail = _renderUrl == "" ? false : true;
    if (showDetail) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return DogDetailAnimator(breed: _breed);
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

  // State classes run this method when the state is created.
  // You shouldn't do async work in initState, so we'll defer it
  // to another method.
  void initState() {
    super.initState();
    renderDogPic();
  }

  // IRL, we'd want the Dog class itself to get the image
  // but this is a simpler way to explain Flutter basics
  void renderDogPic() async {
    // this makes the service call
    await _breed.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    if (!mounted) return;
    // Avoid calling `setState` if the widget is no longer in the widget tree.
    setState(() {
      _renderUrl = _breed.imageUrl;
    });
  }

  Widget get dogImageContainer {
    return Container(
        decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        // Just like CSS's `imagesize` property.
        fit: BoxFit.cover,
        image: NetworkImage(_renderUrl ?? ''),
      ),
      //border: Border.all(width: 2.0, color: backgroundColor),
    ));
  }

  Widget get dogImage {
    // if(renderUrl is String)
    //   print("renderUrl:" + renderUrl);

    var dogAvatar = Hero(
        tag: "dogImage" + _breed.id.toString(),

        // flightShuttleBuilder: (
        //   BuildContext flightContext,
        //   Animation<double> animation,
        //   HeroFlightDirection flightDirection,
        //   BuildContext fromHeroContext,
        //   BuildContext toHeroContext,
        // ) {
        //   final Hero toHero = toHeroContext.widget;
        //   return FadeTransition(
        //     opacity: animation.drive(
        //       Tween<double>(begin: 0.0, end: 1.0).chain(
        //         CurveTween(
        //           curve: Interval(0.0, 1.0, curve: ValleyQuadraticCurve()),
        //         ),
        //       ),
        //     ),
        //     child: toHero.child,
        //   );
        // },
        child: ClipRRect(
            borderRadius: new BorderRadius.circular(20.0),
            child: Container(
              width: 120.5,
              height: 120.5,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: darkerPurpleColor,
                    blurRadius: 0.0,
                  ),
                ],
                shape: BoxShape.rectangle,
                //borderRadius: BorderRadius.circular(20.0),
                // image: DecorationImage(
                //   // Just like CSS's `imagesize` property.
                //   fit: BoxFit.cover,
                //   image: NetworkImage(_renderUrl ?? ''),
                //),
                //border: Border.all(width: 1.0, color: Colors.amber)
              ),
              child: Stack(children: <Widget>[
                Positioned(
                  width: 120.0,
                  height: 120.0,
                  child: Container(
                    child: Icon(
                      Icons.pets,
                      color: Colors.white,
                      size: 45.0,
                    ),
                  ),
                ),
                _renderUrl == "" ? Container() : dogImageContainer,
              ]),
            )));

    return dogAvatar;
    //return dogAvatar;
    // return AnimatedOpacity(
    //   // If the widget is visible, animate to 0.0 (invisible).
    //   // If the widget is hidden, animate to 1.0 (fully visible).
    //   opacity: _renderUrl == "" ? 1.0 : 1.0,
    //   duration: Duration(milliseconds: 0),
    //   // The green box must be a child of the AnimatedOpacity widget.
    //   child: dogAvatar,
    //   curve: Curves.slowMiddle,
    // );

    // This is an animated widget built into flutter.
    // return AnimatedCrossFade(
    //   // You pass it the starting widget and the ending widget.
    //   firstChild: placeholderContainer,
    //   secondChild: dogAvatar,
    //   // Then, you pass it a ternary that should be based on your state
    //   //
    //   // If renderUrl is null tell the widget to use the placeholder,
    //   // otherwise use the dogAvatar.
    //   crossFadeState: _renderUrl == ""
    //       ? CrossFadeState.showFirst
    //       : CrossFadeState.showSecond,
    //   // Finally, pass in the amount of time the fade should take.
    //   duration: Duration(milliseconds: 2000),
    //   firstCurve: Curves.easeOutCubic,
    //   secondCurve: Curves.easeInCubic,
    // );
  }

  // Widget get placeholderContainer {
  //   // Placeholder is a static container the same size as the dog image.
  //   return ClipOval(
  //     child: Container(
  //       width: 115.0,
  //       height: 115.0,
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black54,
  //           ),
  //         ],
  //       ),
  //       child: BackdropFilter(
  //           filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
  //           child: Container(
  //               child: Icon(
  //                 Icons.pets,
  //                 color: Colors.white70,
  //                 size: 45.0,
  //               ),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   border: Border.all(width: 2.0, color: Colors.white70)))),
  //     ),
  //   );
  // }

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
