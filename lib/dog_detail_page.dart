import 'package:flutter/material.dart';
import 'dog_detail_enter_animations.dart';
import 'dog_model.dart';
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
        tag: widget.dog,
        // placeholderBuilder: (context, child) {
        //   return Opacity(opacity: 0.2, child: child);
        // },
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
            border: Border.all(width: 2.0, color: Colors.amber),
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
          padding: const EdgeInsets.only(top: 120.0),
          child: Transform(
            transform: new Matrix4.translationValues(
              0.0,
              _animation.videoScrollerXTranslation.value,
              0.0,
            ),
            child: Opacity(
              opacity: _animation.videoScrollerOpacity.value,
              child: Container(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: ClampingScrollPhysics(),
                    // Must have an item count equal to the number of items!
                    itemCount: 1,
                    // A callback that will return a widget.
                    itemBuilder: (context, int index) {
                      // In our case, a DogCard for each doggo.
                      return Container(
                        padding: EdgeInsets.only(top: 340.0),
                        height: 1110,
                        child: Container(
                          decoration: new BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black87,
                                blurRadius: 4.0,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40)),
                          ),
                          child: Card(
                            elevation: 0,
                            margin: const EdgeInsets.only(top: 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                            ),
                            color: Colors.white,
                            // Wrap children in a Padding widget in order to give padding.
                            child: Padding(
                              // The class that controls padding is called 'EdgeInsets'
                              // The EdgeInsets.only constructor is used to set
                              // padding explicitly to each side of the child.
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 70.0,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: widget.dog.name,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 20.0,
                                              color: Colors.black
                                                  .withOpacity(1.0)),
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
                                              color: Colors.black
                                                  .withOpacity(1.0)),
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
                                              text:
                                                  ': ${widget.dog.rating} / 10',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.black
                                                      .withOpacity(1.0)),
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
                    },
                  ),
                ),
              ),
            ),
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
