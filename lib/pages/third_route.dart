import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/common/dog_card_compact.dart';
import 'package:my_app/styles/colors.dart' as prefix0;

class ThirdRoute extends StatefulWidget {
  ThirdRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    super.build(context);
    return Container(
      // Add box decoration
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            backgroundColor,
            backgroundColor,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              width: 140,
              child: Container(
                color: prefix0.darkerPurpleColor54,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 6.0, top: 110, bottom: 20),
                  child: new Column(),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 20,
                color: Colors.transparent,
              ),
              // Must have an item count equal to the number of items!
              addAutomaticKeepAlives: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: initialDoggos.length,
              // A callback that will return a widget.
              itemBuilder: (context, int index) {
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
                return DogCardCompact(dog: initialDoggos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
