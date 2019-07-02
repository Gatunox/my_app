import 'package:flutter/material.dart';
import 'dog_detail_page.dart';
import 'dog_model.dart';
import 'dart:ui' as ui;

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard({Key key, this.dog}) : super(key: key);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> with AutomaticKeepAliveClientMixin {
  String _renderUrl = "";
  Dog _dog;

  _DogCardState(this._dog);

  Widget get dogCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 330.0,
      height: 135.0,
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0,
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(55),
            topRight: Radius.circular(55),
            bottomLeft: Radius.circular(55),
            bottomRight: Radius.circular(55)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55),
              topRight: Radius.circular(55),
              bottomLeft: Radius.circular(55),
              bottomRight: Radius.circular(55)),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDogDetailPage();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 3.0),
        child: Container(
          height: 190.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 45.0,
                left: 50.0,
                child: dogCard,
              ),
              //Positioned(top: 0.0, child: placeholderContainer),
              Positioned(top: 0.0, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    bool showDetail = _renderUrl == "" ? false : true;
    if (showDetail) {
      Navigator.of(context).push(
        MaterialPageRoute(
          // builder methods always take context!
          builder: (context) {
            return DogDetailPage(dog: _dog);
          },
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

  Widget get dogImage {
    // if(renderUrl is String)
    //   print("renderUrl:" + renderUrl);

    var dogAvatar = Hero(
        tag: widget.dog,
        // placeholderBuilder: (context, child) {
        //   return Opacity(opacity: 0.2, child: child);
        // },
        child: ClipRRect(
          borderRadius: new BorderRadius.circular(55.0),
            child: Container(
          width: 110.0,
          height: 110.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 1.0,
              ),
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(55.0),
            // image: DecorationImage(
            //   // Just like CSS's `imagesize` property.
            //   fit: BoxFit.cover,
            //   image: NetworkImage(_renderUrl ?? ''),
            //),
            //border: Border.all(width: 4.0, color: Colors.amber)
          ),
          child: Stack(children: <Widget>[
            Positioned(
              width: 110.0,
              height: 110.0,
              child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                      child: Icon(
                        Icons.pets,
                        color: Colors.white70,
                        size: 45.0,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(55.0),
                          // image: DecorationImage(
                          //   // Just like CSS's `imagesize` property.
                          //   fit: BoxFit.cover,
                          //   image: NetworkImage(_renderUrl ?? ''),
                          // ),
                          border:
                              Border.all(width: 4.0, color: Colors.amber)))),
            ),
            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius:BorderRadius.circular(55.0),
                    image: DecorationImage(
                      // Just like CSS's `imagesize` property.
                      fit: BoxFit.cover,
                      image: NetworkImage(_renderUrl ?? ''),
                    ),
                    border: Border.all(width: 4.0, color: Colors.amber))),
          ]),
        )));

    return _renderUrl == "" ? Container() : dogAvatar;
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

  Widget get placeholderContainer {
    // Placeholder is a static container the same size as the dog image.
    return ClipOval(
      child: Container(
        width: 115.0,
        height: 115.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
            ),
          ],
        ),
        child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
                child: Icon(
                  Icons.pets,
                  color: Colors.white70,
                  size: 45.0,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4.0, color: Colors.amber)))),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
