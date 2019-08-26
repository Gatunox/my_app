import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/common/dog_card.dart';

class ForthRoute extends StatefulWidget {
  ForthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ForthRoute>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.0, 1],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            backgroundColor,
            backgroundColor,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: ListView.builder(
              addAutomaticKeepAlives: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: initialDoggos.length,
              // A callback that will return a widget.
              itemBuilder: (context, int index) {
                // In our case, a DogCard for each doggo.
                if (index == 0) {
                  // return the header
                  return Container(
                    height: 120,
                    color: Colors.transparent,
                    child: AppBar(
                      title: Text("Dogs List"),
                      backgroundColor: Colors.transparent, //No more green
                      elevation: 0.0, //Shadow gone
                    ),
                  );
                }
                index -= 1; 
                return DogCard(dog: initialDoggos[index]);
                
              },
            ),
            //child: DogCard(dog: widget.initialDoggos[1]), // New code
          ),
          // Positioned(
          //   //Place it at the top, and not use the entire screen
          //   top: 0.0,
          //   left: 0.0,
          //   right: 0.0,
          //   child: AppBar(
          //     title: Text("Hello"),
          //     backgroundColor: Colors.transparent, //No more green
          //     elevation: 0.0, //Shadow gone
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
