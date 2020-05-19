import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
import 'package:my_app/common/dog_name_bottom_bar.dart';
import 'package:my_app/common/image_list_view.dart';
import 'package:my_app/common/image_page_view.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/provider/provider.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:share/share.dart';

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title, this.breed}) : super(key: key);

  final Breed breed;
  final String title;

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute> with TickerProviderStateMixin {
  final double expandedHeightFactor = 0.70;
  final double collapsedHeightFactor = 0.55;

  // Stream<Breed> _breedStream;

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;
  ScrollController _scrollController;

  AnimationController _fadeAnimationController;
  Animation _fadeAnimation;

  int _bottomBarSelectedItem = 0;
  int _bottomBarPreviousSelectedItem = 0;

  double _screenHeight = 0;
  double _screenWidth = 0;

  String _query = "";
  String _breedCountValue = "";

  bool _isAnimationCompleted = false;
  bool _showSearhBottomBar = false;
  bool _visible = false;

  Widget _animatedWidget;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(onScrollChange);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _heightFactorAnimation = Tween<double>(
      begin: expandedHeightFactor,
      end: collapsedHeightFactor,
    ).animate(_animationController)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print("Animation completed");
        } else if (state == AnimationStatus.dismissed) {
          print("Animation dismissed");
        }
      })
      ..addListener(() {
        print("value:${_heightFactorAnimation.value}");
        //setState(() {});
      });
    _fadeAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _fadeAnimation = TweenSequence([
      // TweenSequenceItem<double>(weight: 50, tween: Tween(begin: 1, end: 0)),
      TweenSequenceItem<double>(weight: 50, tween: Tween(begin: 0, end: 1))
    ]).animate(_fadeAnimationController);
  }

  onButtonPartTap() {
    setState(() {
      if (_isAnimationCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      _isAnimationCompleted = !_isAnimationCompleted;
    });
  }

  void onScrollChange() {
    print("onStrollChange() = " + _scrollController.offset.toString());
  }

  Widget getMainStackWidget(BreedManager manager) {
    // print("screenHeight = " + screenHeight.toString());
    // print("screenWidth = " + screenWidth.toString());
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value,
          child: ImagePageView(
            query: _query,
            breed: widget.breed,
          ),
        ),
        GestureDetector(
          onTap: onButtonPartTap,
          onVerticalDragUpdate: onHandleVerticalUpdate,
          onVerticalDragEnd: onHandleVerticalEnd,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1 - _heightFactorAnimation.value,
            child: StreamBuilder<Breed>(
                stream: manager.breedStream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return EmptyBottomFraction(screenHeight: _screenHeight);
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final breed = snapshot.data;
                      _fadeAnimationController.reset();
                      _fadeAnimationController.forward();
                      print("Stream recived in Done, " + breed.name);
                      return BottomFraction(
                        screenHeight: _screenHeight,
                        breed: breed,
                        fadeAnimation: _fadeAnimation,
                      );
                  }
                }),
          ),
        ),
      ],
    );
  }

  Widget getMainListWidget(BreedManager manager) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              stretch: true,
              leading: Container(),
              brightness: Brightness.dark,
              backgroundColor: Colors.transparent,
              expandedHeight: _screenHeight * 0.10,
              floating: true,
              pinned: false,
              snap: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Stack(children: <Widget>[
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.white.withOpacity(0.1),
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
                centerTitle: true,
                title: StreamBuilder<int>(
                    stream: manager.breedCountStream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          if (_breedCountValue.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(_breedCountValue + "  Breeds found",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )),
                            );
                          }
                          return Container();
                        case ConnectionState.active:
                        case ConnectionState.done:
                          _breedCountValue = snapshot.data.toString();
                          print("Stream recived in Done, " + _breedCountValue);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(_breedCountValue + "  Breeds found",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                          );
                        
                      }
                    }),
              ),
            ),
          ];
        },
        body: ImageListView(),

      ),
      // ImageListView(query: _query),
    );
  }

  Widget getMainPageWidgets(BreedManager manager) {
    return Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          Container(
            //Add box decoration
            width: _screenWidth,
            height: _screenHeight,
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                colors: [backgroundColor, backgroundColor],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(_screenWidth * 0.22, -_screenWidth * 0.1),
            child: Transform.rotate(
              angle: -0.2,
              child: Icon(
                Icons.pets,
                color: snowWhiteColor05,
                size: _screenWidth,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-_screenWidth * 0.22, _screenHeight * 0.4),
            child: Transform.rotate(
              angle: -0.2,
              child: Icon(
                Icons.pets,
                color: snowWhiteColor05,
                size: _screenWidth,
              ),
            ),
          ),
          getMainWidget(manager),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child:
                // (_showSearhBottomBar)
                // ? SearchAppBottomBar(_onSubmittedTextField,
                //     _onBottomNavBarTab, _bottomBarSelectedItem)
                // :
                AppBottomBar(onTapBottomNavBar, onDoubleTapBottomNavBar),
          ),
        ]);
  }

  Widget getMainWidget(BreedManager manager) {
    switch (_bottomBarSelectedItem) {
      case 0:
        {
          return getMainStackWidget(manager);
        }
        break;
      case 1:
        {
          return getMainListWidget(manager);
        }
        break;
      case 2:
        {
          return getMainStackWidget(manager);
        }
        break;
      case 3:
        {
          return getMainStackWidget(manager);
        }
        break;
      case 4:
        {
          return getMainStackWidget(manager);
        }
        break;
    }
  }

  onHandleVerticalUpdate(DragUpdateDetails updateDetails) {
    double fractionDragged = updateDetails.primaryDelta / _screenHeight;
    _animationController.value =
        _animationController.value - 4 * fractionDragged;
  }

  onHandleVerticalEnd(DragEndDetails endDetails) {
    if (_animationController.value >= 0.4) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    BreedManager manager = Provider.of(context);
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: snowWhiteColor,
          // bottomNavigationBar:
          //     SearchAppBottomBar(_onBottomNavBarTab, _bottomBarSelectedItem),
          body: getMainPageWidgets(manager),

          // AnimatedBuilder(
          //   animation: _animationController,
          //   builder: (context, widget) {
          //     print("Animation Called");
          //     // return getMainListViewWidget(manager);
          //     // return AnimatedSwitcher(
          //     //     duration: const Duration(milliseconds: 1000),
          //     // transitionBuilder:
          //     //     (Widget child, Animation<double> animation) {
          //     //   return ScaleTransition(child: child, scale: animation);
          //     // },
          //     // child:
          //     return getMainPageWidgets(
          //         ValueKey(_bottomBarSelectedItem), manager);
          //   },
          // ),
        ),
      ],
    );
  }

  // void _onSubmittedTextField(String query) {
  //   print("Received _onSubimittedTextFiled = " + query);
  //   if (!mounted) return;
  //   setState(() {
  //     _query = query;
  //   });
  // }

  void onTapBottomNavBar(AppBottomBarOption option) {
    print("onTapBottomNavBar pressed with value = " + option.toString());
    if (!mounted) return;
    int tapItem = option.index;
    //   switch (option) {
    //     case AppBottomBarOption.dog:
    //       {
    //         _showSearhBottomBar = false;
    //       }
    //       break;
    //     case AppBottomBarOption.search:
    //       {
    //         _showSearhBottomBar = true;
    //       }
    //       break;
    //     case AppBottomBarOption.photo:
    //       {
    //         _showSearhBottomBar = false;
    //       }
    //       break;
    //     case AppBottomBarOption.share:
    //       {
    //         // Future.delayed(const Duration(milliseconds: 500), () {
    //         //   final RenderBox box = context.findRenderObject();
    //         //   Share.share("check out my website https://example.com",
    //         //           subject: "Look what I made!",
    //         //           sharePositionOrigin:
    //         //               box.localToGlobal(Offset.zero) & box.size)
    //         //       .then((value) {
    //         //     print(" -- Then is called -- ");
    //         //   }).whenComplete(() {
    //         //     print(" -- called when future completes -- ");tsug
    //         //   });
    //         // });

    //         _showSearhBottomBar = true;
    //       }
    //       break;
    //     case AppBottomBarOption.list:
    //       {
    //         _showSearhBottomBar = false;
    //       }
    //       break;
    //     case AppBottomBarOption.none:
    //       {
    //         _showSearhBottomBar = false;
    //       }
    //       break;
    //   }
    setState(() {
      //  _bottomBarPreviousSelectedItem = _bottomBarSelectedItem;
      _query = "";
      _breedCountValue = "";
      _bottomBarSelectedItem = tapItem;
    });
  }

  void onDoubleTapBottomNavBar(AppBottomBarOption option) {
    print("onDoubleTabBottomNavBar pressed with value = " + option.toString());
    if (!mounted) return;
    int doubleTapItem = option.index;
   
    setState(() {

    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class BottomFraction extends StatelessWidget {
  const BottomFraction({
    Key key,
    @required this.screenHeight,
    @required this.breed,
    @required this.fadeAnimation,
  }) : super(key: key);

  final double screenHeight;
  final Breed breed;
  final Animation fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: screenHeight * 0.09,
            child: DogNameBottomBar(
              breed: breed,
              fadeAnimation: fadeAnimation,
            )),
        Expanded(
          child: Hero(
            tag: "dogDetail" + breed.id.toString(),
            child: Container(
              decoration: BoxDecoration(
                  color: snowWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyBottomFraction extends StatelessWidget {
  const EmptyBottomFraction({
    Key key,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight * 0.10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: snowWhiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0))),
          ),
        ),
      ],
    );
  }
}
