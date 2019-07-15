import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_card_sliver.dart';

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;
  List<Dog> initialDoggos = []
    ..add(Dog(
        id: 1,
        name: 'Ruby',
        location: 'Portland, OR, USA',
        description:
            'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog(
        id: 2,
        name: 'Rex',
        location: 'Seattle, WA, USA',
        description: 'Best in Show 1999'))
    ..add(Dog(
        id: 3,
        name: 'Rod Stewart',
        location: 'Prague, CZ',
        description: 'Star good boy on international snooze team.'))
    ..add(Dog(
        id: 4,
        name: 'Herbert',
        location: 'Dallas, TX, USA',
        description: 'A Very Good Boy'))
    ..add(Dog(
        id: 5,
        name: 'Ruby',
        location: 'Portland, OR, USA',
        description:
            'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog(
        id: 6,
        name: 'Rex',
        location: 'Seattle, WA, USA',
        description: 'Best in Show 1999'))
    ..add(Dog(
        id: 7,
        name: 'Rod Stewart',
        location: 'Prague, CZ',
        description: 'Star good boy on international snooze team.'))
    ..add(Dog(
        id: 8,
        name: 'Herbert',
        location: 'Dallas, TX, USA',
        description: 'A Very Good Boy'))
    ..add(Dog(
        id: 9,
        name: 'Buddy',
        location: 'North Pole, Earth',
        description: 'Self proclaimed human lover.'));

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
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
      child: Stack(
        children: <Widget>[
          Positioned(
              //Place it at the top, and not use the entire screen
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              width: 138.5,
              child: Container(
                color: Colors.black12,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 6.0, top: 110, bottom: 20),
                  child: new Column(),
                ),
              )),
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics (),
              // Must have an item count equal to the number of items!
              itemCount: widget.initialDoggos.length,
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
                } else {
                  return DogCardSliver(dog: widget.initialDoggos[index]);
                }
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

