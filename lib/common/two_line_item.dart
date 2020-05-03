import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),        
        Text(
          secondText,
          style: TextStyle(fontFeatures: [
            FontFeature.proportionalFigures(),
          ], color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ],
    );
  }
}
