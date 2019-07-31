import 'dart:ui';
import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF1b202b);
final Color foregroungColor = Color(0xFF3A3D37);
final Color disableTextColor = Colors.white12;

final selectedListItemStyle = TextStyle(
                fontFamily: 'Roboto', fontSize: 18.0, color: Colors.white);
final accentListItemStyle = TextStyle(
                fontFamily: 'Roboto', fontSize: 20.0, color: Colors.purpleAccent);
final unselectedListItemStyle = TextStyle(
                fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.bold, color: disableTextColor);
final fadedListTitle = TextStyle(
                fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.bold, color: disableTextColor);