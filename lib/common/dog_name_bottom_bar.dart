import 'package:flutter/material.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';

class DogNameBottomBar extends StatelessWidget {
  final Breed breed;

  DogNameBottomBar({Key key, @required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "dogName" + breed.name.toString(),
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return DefaultTextStyle(
          style: DefaultTextStyle.of(toHeroContext).style,
          child: toHeroContext.widget,
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
        child: Container(
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        breed.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
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
    );
  }
}
