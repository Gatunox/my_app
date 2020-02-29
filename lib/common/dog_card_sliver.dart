import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return GestureDetector(
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(35),
            bottomRight: const Radius.circular(35),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(widget.breed.https,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.hue,
                  color: Colors.black38),
              // FadeInImage(
              //   fadeInDuration: Duration(milliseconds: 150),
              //   fit: BoxFit.cover,
              //   placeholder: AssetImage("images/paw.png"),
              //   image: NetworkImage(widget.breed.https),
              // ),
              // ClipRRect(
              //   borderRadius: new BorderRadius.only(
              //     bottomLeft: const Radius.circular(35),
              //     bottomRight: const Radius.circular(35),
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       // Box decoration takes a gradient
              //       gradient: LinearGradient(
              //         // Where the linear gradient begins and ends
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         stops: [0.7, 1],
              //         // Add one stop for each color. Stops should increase from 0 to 1
              //         colors: [
              //           // Colors are easy thanks to Flutter's Colors class.
              //           Colors.transparent,
              //           Colors.black38,
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
    return Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(color: Colors.transparent, child: dogImage));
  }

  showDogDetailPage() {
    bool showDetail = widget.breed.https == "" ? false : true;
    if (showDetail) {
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
    if (mounted) {
      // Avoid calling `setState` if the widget is no longer in the widget tree.
      setState(() {
        _renderUrl = widget.breed.imageUrl;
      });
    }
  }

  Widget get dogImageContainer {
    try {
      return ClipRRect(
        borderRadius: new BorderRadius.circular(30.0),
        child: Stack(children: <Widget>[
          Container(
            child: Hero(
              tag: "dogImage" + widget.breed.id.toString(),
              child: ClipRRect(
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30),
                    topLeft: const Radius.circular(30),
                    topRight: const Radius.circular(30)),
                child: Container(
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    // placeholder: AssetImage("images/paw.png"),
                    image: NetworkImage(widget.breed.https),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Hero(
              tag: "dogName" + widget.breed.name.toString(),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            color: Colors.transparent,
                            // width: 300.0,
                            // height: 24.0,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                widget.breed.name,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
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
        ]),
      );
    } on Exception catch (_) {
      print("Catched exception");
    } catch (error) {
      print('Catched error ' + error.toString());
    }
  }

  Widget get dogImage {
    var dogAvatar = GestureDetector(
            onTap: () {
              showDogDetailPage();
            },
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(30.0),
              child: widget.breed.https == "" ? Container() : dogImageContainer,
            ))
        //)
        ;

    //print("Getting dogImage = " + widget.dog.imageUrl);
    return widget.breed.imageUrl == "" ? Container() : dogAvatar;
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
