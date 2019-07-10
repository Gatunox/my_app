import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_card.dart';

class ForthRoute extends StatefulWidget {
  ForthRoute({Key key, this.title}) : super(key: key);

  final String title;
  List<Dog> initialDoggos = []
    ..add(Dog(id:1, name: 'Ruby', location: 'Portland, OR, USA',
        description: 'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog(id:2, name:  'Rex', location: 'Seattle, WA, USA', description: 'Best in Show 1999'))
    ..add(Dog(id:3, name: 'Rod Stewart', location: 'Prague, CZ',
        description: 'Star good boy on international snooze team.'))
    ..add(Dog(id:4, name: 'Herbert', location: 'Dallas, TX, USA', description:'A Very Good Boy'))
    ..add(Dog(id:5, name: 'Ruby', location: 'Portland, OR, USA',
        description: 'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog(id:6, name: 'Rex', location: 'Seattle, WA, USA', description: 'Best in Show 1999'))
    ..add(Dog(id:7, name: 'Rod Stewart', location: 'Prague, CZ',
        description: 'Star good boy on international snooze team.'))
    ..add(Dog(id:8, name: 'Herbert', location: 'Dallas, TX, USA', description: 'A Very Good Boy'))
    ..add(Dog(id:9, name: 'Buddy', location: 'North Pole, Earth', description: 'Self proclaimed human lover.'));

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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.0, 1],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.purple,
            Colors.amber,
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 0.0),
            child: ListView.builder(
              // Must have an item count equal to the number of items!
              itemCount: widget.initialDoggos.length,
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
                } else {
                  return DogCard(dog: widget.initialDoggos[index]);
                }
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
