import 'package:flutter/material.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart';

class DogNameBottomBar extends StatelessWidget {
  final Breed breed;
  final Animation fadeAnimation;

  DogNameBottomBar({Key key, @required this.breed, @required this.fadeAnimation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "dogName" + breed.name.toString(),
      child: FadeTransition(
        opacity: fadeAnimation,
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
      ),
    );
  }
}
