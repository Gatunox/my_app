import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';

class TwoLineItem extends StatelessWidget {
  final String firstText, secondText;
  final CrossAxisAlignment crossAxisAlignment;

  TwoLineItem({this.firstText, this.secondText, this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Text(
          firstText,
          style: TextStyle(
              color: snowWhiteColor, fontWeight: FontWeight.w300, fontSize: 16),
        ),        
        Text(
          secondText,
          style: TextStyle(fontFeatures: [
            FontFeature.proportionalFigures(),
          ], color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ],
    );
  }
}
