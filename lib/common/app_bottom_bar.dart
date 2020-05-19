import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/styles/colors.dart';

enum AppBottomBarOption { dog, search, photo, share, list, none }

// class FullAppBottomBar extends StatefulWidget {
//   FullAppBottomBar(
//       this.onSubmittedCallback, this.bottomBarCallback, this.selectedItem);

//   final Function onSubmittedCallback;
//   final Function bottomBarCallback;
//   final int selectedItem;

//   @override
//   _FullAppBottomBarState createState() => _FullAppBottomBarState();
// }

// class _FullAppBottomBarState extends State<FullAppBottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;

//     return Container(
//       width: screenWidth,
//       height: kBottomNavigationBarHeight * 1.3,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(35), topRight: Radius.circular(35))),
//       padding: const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 8),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           GestureDetector(
//               onTap: () {
//                 widget.bottomBarCallback(AppBottomBarOption.dog);
//               },
//               child: Container(
//                 width: screenWidth * 0.15,
//                 height: screenWidth * 0.15,
//                 color: Colors.white,
//                 child: Icon(Icons.pets,
//                     size: (widget.selectedItem == 0) ? 35 : 25,
//                     color: (widget.selectedItem == 0)
//                         ? Colors.black
//                         : Colors.black38),
//               )),
//           GestureDetector(
//               onTap: () {
//                 widget.bottomBarCallback(AppBottomBarOption.search);
//               },
//               child: Container(
//                 width: screenWidth * 0.15,
//                 height: screenWidth * 0.15,
//                 color: Colors.white,
//                 child: Icon(Icons.search,
//                     size: (widget.selectedItem == 1) ? 35 : 25,
//                     color: (widget.selectedItem == 1)
//                         ? Colors.black
//                         : Colors.black38),
//               )),
//           GestureDetector(
//               onTap: () {
//                 widget.bottomBarCallback(AppBottomBarOption.photo);
//               },
//               child: Container(
//                 width: screenWidth * 0.15,
//                 height: screenWidth * 0.15,
//                 color: Colors.white,
//                 child: Icon(Icons.camera_alt,
//                     size: (widget.selectedItem == 2) ? 35 : 25,
//                     color: (widget.selectedItem == 2)
//                         ? Colors.black
//                         : Colors.black38),
//               )),
//           GestureDetector(
//               onTap: () {
//                 widget.bottomBarCallback(AppBottomBarOption.share);
//               },
//               child: Transform.translate(
//                 offset: Offset(0.0, 0.0),
//                 child: Container(
//                   width: screenWidth * 0.15,
//                   height: screenWidth * 0.15,
//                   color: Colors.white,
//                   child: Icon(Icons.share,
//                       size: (widget.selectedItem == 3) ? 35 : 25,
//                       color: (widget.selectedItem == 3)
//                           ? Colors.black
//                           : Colors.black38),
//                 ),
//               )),
//           GestureDetector(
//               onTap: () {
//                 widget.bottomBarCallback(AppBottomBarOption.list);
//               },
//               child: Container(
//                 width: screenWidth * 0.15,
//                 height: screenWidth * 0.15,
//                 color: Colors.white,
//                 child: Icon(Icons.list,
//                     size: (widget.selectedItem == 4) ? 35 : 25,
//                     color: (widget.selectedItem == 4)
//                         ? Colors.black
//                         : Colors.black38),
//               )),
//         ],
//       ),
//     );
//   }
// }

// class SearchAppBottomBar extends StatefulWidget {
//   SearchAppBottomBar(
//       this.onSubmittedCallback, this.bottomBarCallback, this.selectedItem);

//   final Function onSubmittedCallback;
//   final Function bottomBarCallback;
//   final int selectedItem;

//   @override
//   _SearchAppBottomBarState createState() => _SearchAppBottomBarState();
// }

// class _SearchAppBottomBarState extends State<SearchAppBottomBar>
//     with TickerProviderStateMixin {
//   AnimationController _animationController;
//   TextEditingController _editingController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(duration: Duration(seconds: 1), vsync: this);
//     _editingController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       width: screenWidth,
//       height: kBottomNavigationBarHeight * 2.55,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(35), topRight: Radius.circular(35))),
//       padding: const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 8),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: screenWidth * 0.92,
//                 height: screenWidth * 0.15,
//                 margin: EdgeInsets.only(top: 10),
//                 child: TextField(
//                   controller: _editingController,
//                   cursorColor: Colors.black,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search, color: Colors.black),
//                       labelText: "Search",
//                       // hintText: "Dog's breed",
//                       labelStyle: new TextStyle(color: Colors.black),
//                       border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(20.0)))),
//                   onSubmitted: (String query) {
//                     print("onSubmitted called with query = " + query);
//                     widget.onSubmittedCallback(query);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                   onTap: () {
//                     widget.bottomBarCallback(AppBottomBarOption.dog);
//                   },
//                   child: Container(
//                     width: screenWidth * 0.15,
//                     height: screenWidth * 0.15,
//                     color: Colors.white,
//                     child: Icon(Icons.pets,
//                         size: (widget.selectedItem == 0) ? 35 : 25,
//                         color: (widget.selectedItem == 0)
//                             ? Colors.black
//                             : Colors.black38),
//                   )),
//               GestureDetector(
//                   onTap: () {
//                     widget.bottomBarCallback(AppBottomBarOption.search);
//                   },
//                   child: Container(
//                     width: screenWidth * 0.15,
//                     height: screenWidth * 0.15,
//                     color: Colors.white,
//                     child: Icon(Icons.search,
//                         size: (widget.selectedItem == 1) ? 35 : 25,
//                         color: (widget.selectedItem == 1)
//                             ? Colors.black
//                             : Colors.black38),
//                   )),
//               GestureDetector(
//                   onTap: () {
//                     widget.bottomBarCallback(AppBottomBarOption.photo);
//                   },
//                   child: Container(
//                     width: screenWidth * 0.15,
//                     height: screenWidth * 0.15,
//                     color: Colors.white,
//                     child: Icon(Icons.camera_alt,
//                         size: (widget.selectedItem == 2) ? 35 : 25,
//                         color: (widget.selectedItem == 2)
//                             ? Colors.black
//                             : Colors.black38),
//                   )),
//               GestureDetector(
//                   onTap: () {
//                     widget.bottomBarCallback(AppBottomBarOption.share);
//                   },
//                   child: Transform(
//                     transform: Matrix4.translationValues(0.0, 0.0, 0.0),
//                     child: Container(
//                       width: screenWidth * 0.15,
//                       height: screenWidth * 0.15,
//                       color: Colors.white,
//                       child: Icon(Icons.share,
//                           size: (widget.selectedItem == 3) ? 35 : 25,
//                           color: (widget.selectedItem == 3)
//                               ? Colors.black
//                               : Colors.black38),
//                     ),
//                   )),
//               GestureDetector(
//                   onTap: () {
//                     widget.bottomBarCallback(AppBottomBarOption.list);
//                   },
//                   child: Container(
//                     width: screenWidth * 0.15,
//                     height: screenWidth * 0.15,
//                     color: Colors.white,
//                     child: Icon(Icons.list,
//                         size: (widget.selectedItem == 4) ? 35 : 25,
//                         color: (widget.selectedItem == 4)
//                             ? Colors.black
//                             : Colors.black38),
//                   )),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // Clean up the con troller when the widget is disposed.
//     _animationController.dispose();
//     _editingController.dispose();
//     super.dispose();
//   }
// }

class AppBottomBar extends StatefulWidget {
  AppBottomBar(this.onTapCallback, this.onDobleTapCallback);

  final Function onTapCallback;
  final Function onDobleTapCallback;

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation _slideAnimation;
  Animation _fadeAnimation;
  TextEditingController _editingController = TextEditingController();
  bool _dogVisible = true;
  bool _searchVisible = true;
  bool _photoVisible = true;
  bool _shareVisible = true;
  bool _configVisible = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _slideAnimation = TweenSequence([
      TweenSequenceItem<Offset>(
          weight: 20, tween: Tween(begin: Offset(0, 0), end: Offset(0, 0.8))),
      TweenSequenceItem<Offset>(
          weight: 90, tween: Tween(begin: Offset(0, 0.8), end: Offset(0, 0)))
    ]).animate(_animationController);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(weight: 20, tween: Tween(begin: 1, end: 0)),
      TweenSequenceItem<double>(weight: 90, tween: Tween(begin: 0, end: 1))
    ]).animate(_animationController);
    // _animation =
    //     Tween<double>(begin: 1.0, end: 0.0).animate(_animationController)
    //       ..addListener(() {
    //         setState(() {});
    //       });
    _editingController = TextEditingController();
  }

  int _selectedItem = 0;

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
      padding: const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 10),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        widget.onTapCallback(AppBottomBarOption.dog);
                      },
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            color: Colors.white,
                            child: Icon(Icons.pets,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _animationController.reset();
                          _animationController.forward();
                        });
                        widget.onTapCallback(AppBottomBarOption.search);
                      },
                      onDoubleTap: () {
                        widget.onDobleTapCallback(AppBottomBarOption.search);
                      },
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            color: Colors.white,
                            child: Icon(Icons.search,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        widget.onTapCallback(AppBottomBarOption.photo);
                      },
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            color: Colors.white,
                            child: Icon(Icons.camera_alt,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        widget.onTapCallback(AppBottomBarOption.share);
                      },
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              color: Colors.white,
                              child: Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.black,
                              )),
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        widget.onTapCallback(AppBottomBarOption.list);
                      },
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            color: Colors.white,
                            child: Icon(Icons.list,
                                size: 30, color: Colors.black),
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the con troller when the widget is disposed.
    _animationController.dispose();
    _editingController.dispose();
    super.dispose();
  }
}
