import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';

enum AppBottomBarOption { dog, search, photo, share, list, none }

class FullAppBottomBar extends StatelessWidget {
  final Function bottomBarCallback;
  final int selectedItem;

  FullAppBottomBar(this.bottomBarCallback, this.selectedItem);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: kBottomNavigationBarHeight * 1.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      padding: const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                bottomBarCallback(AppBottomBarOption.dog);
              },
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.pets,
                    size: (selectedItem == 0) ? 35 : 25,
                    color: (selectedItem == 0) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                bottomBarCallback(AppBottomBarOption.search);
              },
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.search,
                    size: (selectedItem == 1) ? 35 : 25,
                    color: (selectedItem == 1) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                bottomBarCallback(AppBottomBarOption.photo);
              },
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.camera_alt,
                    size: (selectedItem == 2) ? 35 : 25,
                    color: (selectedItem == 2) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                bottomBarCallback(AppBottomBarOption.share);
              },
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.share,
                    size: (selectedItem == 3) ? 35 : 25,
                    color: (selectedItem == 3) ? Colors.black : Colors.black38),
              )),
          GestureDetector(
              onTap: () {
                bottomBarCallback(AppBottomBarOption.list);
              },
              child: Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                // color: Colors.grey,
                child: Icon(Icons.list,
                    size: (selectedItem == 4) ? 35 : 25,
                    color: (selectedItem == 4) ? Colors.black : Colors.black38),
              )),
        ],
      ),
    );
  }
}

class SearchAppBottomBar extends StatefulWidget {
  SearchAppBottomBar(this.onSubmittedCallback, this.bottomBarCallback, this.selectedItem);

  final Function onSubmittedCallback;
  final Function bottomBarCallback;
  final int selectedItem;

  @override
  _SearchAppBottomBarState createState() => _SearchAppBottomBarState();
}

class _SearchAppBottomBarState extends State<SearchAppBottomBar> {
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      height: kBottomNavigationBarHeight * 2.15,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      padding: const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // GestureDetector(
              //     onTap: () {
              //       widget.callback(AppBottomBarOption.close);
              //     },
              //     child: Container(
              //       width: screenWidth * 0.10,
              //       height: screenWidth * 0.15,
              //       // color: Colors.grey,
              //       child: Icon(Icons.close, size: 25, color: Colors.black),
              //     )),
              Container(
                width: screenWidth * 0.92,
                height: screenWidth * 0.12,
                child: TextField(
                  controller: _editingController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      labelText: "Search",
                      // hintText: "Dog's breed",
                      labelStyle: new TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  onSubmitted: (String query) {
                    widget.onSubmittedCallback(query);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    widget.bottomBarCallback(AppBottomBarOption.dog);
                  },
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    // color: Colors.grey,
                    child: Icon(Icons.pets,
                        size: (widget.selectedItem == 0) ? 35 : 25,
                        color: (widget.selectedItem == 0)
                            ? Colors.black
                            : Colors.black38),
                  )),
              GestureDetector(
                  onTap: () {
                    widget.bottomBarCallback(AppBottomBarOption.search);
                  },
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    // color: Colors.grey,
                    child: Icon(Icons.search,
                        size: (widget.selectedItem == 1) ? 35 : 25,
                        color: (widget.selectedItem == 1)
                            ? Colors.black
                            : Colors.black38),
                  )),
              GestureDetector(
                  onTap: () {
                    widget.bottomBarCallback(AppBottomBarOption.photo);
                  },
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    // color: Colors.grey,
                    child: Icon(Icons.camera_alt,
                        size: (widget.selectedItem == 2) ? 35 : 25,
                        color: (widget.selectedItem == 2)
                            ? Colors.black
                            : Colors.black38),
                  )),
              GestureDetector(
                  onTap: () {
                    widget.bottomBarCallback(AppBottomBarOption.share);
                  },
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    // color: Colors.grey,
                    child: Icon(Icons.share,
                        size: (widget.selectedItem == 3) ? 35 : 25,
                        color: (widget.selectedItem == 3)
                            ? Colors.black
                            : Colors.black38),
                  )),
              GestureDetector(
                  onTap: () {
                    widget.bottomBarCallback(AppBottomBarOption.list);
                  },
                  child: Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    // color: Colors.grey,
                    child: Icon(Icons.list,
                        size: (widget.selectedItem == 4) ? 35 : 25,
                        color: (widget.selectedItem == 4)
                            ? Colors.black
                            : Colors.black38),
                  )),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the con troller when the widget is disposed.
    _editingController.dispose();
    super.dispose();
  }
}
