import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';

class AppBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
            padding: const EdgeInsets.only(bottom: 30, left: 24, right: 24, top:24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.library_books, color: Colors.black),
          Icon(Icons.search, color: Colors.black),
          Icon(Icons.add, color: Colors.black),
          Icon(Icons.alarm, color: Colors.black),
          Icon(Icons.chat, color: Colors.black),
        ],
      ),
    );
  }
}
