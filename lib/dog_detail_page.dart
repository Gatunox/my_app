import 'package:flutter/material.dart';

import 'dog_model.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  DogDetailPage({Key key, this.dog}) : super(key: key);

  @override
  _DogDetailPageState createState() => _DogDetailPageState(dog);
}

class _DogDetailPageState extends State<DogDetailPage>
    with AutomaticKeepAliveClientMixin {
  // Arbitrary size choice for styles
  final double dogAvatarSize = 500.0;
  Dog _dog;

  _DogDetailPageState(this._dog);

  Widget get dogImage {
    //print("Call get dogImage");
    // Containers define the size of its children.
    var dogAvatar = Hero(
      // The same code, except the Dog property lives on the widget in this file.
      tag: widget.dog,
      child: Container(
          height: dogAvatarSize,
          width: dogAvatarSize,
          // Use Box Decoration to make the image a circle
          // and add an arbitrary shadow for styling.
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // Like in CSS you often want to add multiple
              // BoxShadows for the right look so the
              // boxShadow property takes a list of BoxShadows.
              boxShadow: [
                const BoxShadow(
                    // just like CSS:
                    // it takes the same 4 properties
                    offset: const Offset(1.0, 2.0),
                    blurRadius: 1.0,
                    spreadRadius: -1.0,
                    color: const Color(0x33000000)),
                const BoxShadow(
                    offset: const Offset(2.0, 1.0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    color: const Color(0x24000000)),
                const BoxShadow(
                    offset: const Offset(3.0, 1.0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    color: const Color(0x1F000000)),
              ],
              // This is how you add an image to a Container's background.
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.dog.imageUrl ?? '')),
              border: Border.all(width: 4.0, color: Colors.transparent))),
    );

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

  // The widget that displays the image, rating and dog info.
  Widget get dogProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),

      // The Dog Profile information.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          dogImage,
          Text(
            '${widget.dog.name}  🎾',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            widget.dog.location,
            style: TextStyle(fontSize: 20.0),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.dog.description),
          ),
          rating
        ],
      ),
    );
  }

  //Finally, the build method:
  //
  // Aside:
  // It's often much easier to build UI if you break up your widgets the way I
  // have in this file rather than trying to have one massive build method
  @override
  Widget build(BuildContext context) {
    //print("Call build DogDetailPage");
    // This is a new page, so you need a new Scaffold!
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
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: dogProfile,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 0.0),
          height: 110,
          child: AppBar(
            title: Text('Meet ${widget.dog.name}'),
            backgroundColor: Colors.black38, //No more green
            elevation: 1.0, //Shadow gone
          ),
        ),
      ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
