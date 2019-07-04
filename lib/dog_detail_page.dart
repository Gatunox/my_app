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
  final double dogAvatarSize = 250.0;
  Dog _dog;

  _DogDetailPageState(this._dog);

  Widget get dogImage {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    //print("Call get dogImage");
    // Containers define the size of its children.
    var dogAvatar = Hero(
        // The same code, except the Dog property lives on the widget in this file.
        tag: widget.dog,
        
        child: Container(
          height: scrrenWidth,
          width: scrrenWidth,
          // Use Box Decoration to make the image a circle
          // and add an arbitrary shadow for styling.
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            shape: BoxShape.rectangle,
            // This is how you add an image to a Container's background.
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.dog.imageUrl ?? '')),
            border: Border.all(width: 3.0, color: Colors.amber),
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
      setState(() {});
    }
  }

  //Finally, the build method:
  //
  // Aside:
  // It's often much easier to build UI if you break up your widgets the way I
  // have in this file rather than trying to have one massive build method
  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    //print("Call build DogDetailPage");
    // This is a new page, so you need a new Scaffold
    Future.delayed(const Duration(seconds: 1), () => executeAfterBuild());
    return Scaffold(
      body: Container(
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
              title: Text('Meet ${widget.dog.name}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0)),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
                borderRadius:
                    new BorderRadius.only(topLeft: Radius.circular(40.0)),
                child: Container(
                  height: scrrenWidth,
                  width: scrrenWidth,
                  color: Colors.white,
                )),
          )
        ]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
