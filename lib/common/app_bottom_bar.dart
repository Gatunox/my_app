import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';

class AppBottomBar extends StatelessWidget {
  final Function _callback;
  final int _selectedItem;

  double screenHeight = 0;
  double screenWidth = 0;

  AppBottomBar(this._callback, this._selectedItem);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: kBottomNavigationBarHeight * 1.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      padding: const EdgeInsets.only(bottom: 0, left: 24, right: 24, top: 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                _callback(0);
              },
              child: Container(
                width: screenWidth  * 0.15,
                height: screenWidth  * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.pets,
                    size: (_selectedItem == 0) ? 35 : 25,
                    color: (_selectedItem == 0) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                _callback(1);
              },
              child: Container(
                width: screenWidth  * 0.15,
                height: screenWidth  * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.search,
                    size: (_selectedItem == 1) ? 35 : 25,
                    color: (_selectedItem == 1) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                _callback(2);
              },
              child: Container(
                width: screenWidth  * 0.15,
                height: screenWidth  * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.camera_alt,
                    size: (_selectedItem == 2) ? 35 : 25,
                    color: (_selectedItem == 2) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                _callback(3);
              },
              child: Container(
                width: screenWidth  * 0.15,
                height: screenWidth  * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.share,
                    size: (_selectedItem == 3) ? 35 : 25,
                    color: (_selectedItem == 3) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                _callback(4);
              },
              child: Container(
                width: screenWidth  * 0.15,
                height: screenWidth  * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.list,
                    size: (_selectedItem == 4) ? 35 : 25,
                    color: (_selectedItem == 4) ? Colors.black : Colors.black38),
              )),
        ],
      ),
    );
  }
}
