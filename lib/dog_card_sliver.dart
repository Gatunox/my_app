import 'package:flutter/material.dart';
import 'dog_detail_sliver.dart';
import 'dog_model.dart';
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

  Widget get dogCard {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: scrrenWidth - 60,
      height: 120.0,
      padding: const EdgeInsets.all(0.0),
      child: Hero(
        tag: "dogCard" + _dog.id.toString(),
        child: GestureDetector(
          onTap: () {
            showDogDetailPage();
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            margin: const EdgeInsets.only(left: 0, right: 0),
            color: Colors.white,
            // Wrap children in a Padding widget in order to give padding.
            child: Padding(
              // The class that controls padding is called 'EdgeInsets'
              // The EdgeInsets.only constructor is used to set
              // padding explicitly to each side of the child.
              padding: const EdgeInsets.only(
                top: 10.0,
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.dog.name,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20.0,
                              color: Colors.black.withOpacity(1.0)),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.dog.location,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              color: Colors.black.withOpacity(1.0)),
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
                              text: ': ${widget.dog.rating} / 10',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black.withOpacity(1.0)),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    timeDilation = 1.0;
    return
        // GestureDetector(
        //   onTap: () {
        //     showDogDetailPage();
        //   },
        // child:
        Container(
      height: scrrenHeight,
      width: scrrenWidth - 30,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 0.0),
        child: Container(
          child: Stack(
            children: <Widget>[
              // Positioned(
              //   top: 380.0,
              //   left: 0.0,
              //   child: dogCard,
              // ),
              Positioned(top: 0.0, left: 0.0, child: dogImage),
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
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            // Just like CSS's `imagesize` property.
            fit: BoxFit.cover,
            image: NetworkImage(_renderUrl ?? ''),
          ),
          border: Border.all(width: 1.0, color: Colors.black45)),
      // child: FadeInImage.memoryNetwork(
      //     placeholder: kTransparentImage,
      //     image: _renderUrl,
      //   ),
    );
  }

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
        child: GestureDetector(
            onTap: () {
              showDogDetailPage();
            },
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(30.0),
                child: Container(
                  width: scrrenWidth - scrrenWidth / 7,
                  height: scrrenWidth + scrrenWidth / 6,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 1.0,
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30.0),
                    // image: DecorationImage(
                    //   // Just like CSS's `imagesize` property.
                    //   fit: BoxFit.cover,
                    //   image: NetworkImage(_renderUrl ?? ''),
                    //),
                    //border: Border.all(width: 4.0, color: Colors.amber)
                  ),
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
                                      width: 2.0, color: Colors.black54)))),
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
