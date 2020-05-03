import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/two_line_item.dart';
import 'package:my_app/pages/dog_detail_sliver.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';
import 'dog_detail_enter_animations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;
import 'package:transparent_image/transparent_image.dart';

class DogCardSliver extends StatefulWidget {
  final Breed breed;
  final double scale;

  DogCardSliver({Key key, this.breed, this.scale}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState();
}

class _DogCardState extends State<DogCardSliver>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  _DogCardState();

  // bool _isVisible = true;
  String _renderUrl = "";
  AnimationController _controller;
  bool _visible;

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
    _visible = false;
    Image downloadImage = Image.network(widget.breed.https,
        fit: BoxFit.cover, colorBlendMode: BlendMode.hue, color: Colors.black);
    downloadImage.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          if (!mounted) return;
          setState(() {
            _visible = !_visible;
          });
          print('DogCardState - Networkimage is fully loaded and saved');
          // do something
        },
      ),
    );
    return GestureDetector(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(35),
            bottomRight: const Radius.circular(35),
          ),
          child: Hero(
            // The same code, except the Dog property lives on the widget in this file.
            tag: "dogImage" + widget.breed.id.toString(),
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
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  downloadImage,
                  FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: widget.breed.https),
                  // FadeInImage(
                  //   fadeInDuration: Duration(milliseconds: 150),
                  //   fit: BoxFit.cover,
                  //   placeholder: AssetImage("images/paw.png"),
                  //   image: NetworkImage(widget.breed.https),
                  // ),
                  AnimatedOpacity(
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black38,
                            Colors.transparent,
                            Colors.black26
                          ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    bool showDetail = widget.breed.https == "" ? false : true;
    if (showDetail) {
      setState(() {
        _visible = false;
      });
      // setState(() {
      //   _isVisible = false;
      // });
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return DogDetailSliver(
                breed: widget.breed,
                animation: DogDetailsEnterAnimations(_controller));
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
    await widget.breed.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    if (!mounted) return;
    // Avoid calling `setState` if the widget is no longer in the widget tree.
    setState(() {
      _renderUrl = widget.breed.imageUrl;
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return -2 * math.pow(t, 1) + 2 * t + 1;
  }
}

