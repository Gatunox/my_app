import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
import 'package:my_app/common/dog_card_compact.dart';
import 'package:my_app/common/dog_name_bottom_bar.dart';
import 'package:my_app/common/image_list_view.dart';
import 'package:my_app/common/image_page_view.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/provider/provider.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/manager/breed_manager.dart';

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
    with SingleTickerProviderStateMixin {
  final double expandedHeightFactor = 0.70;
  final double collapsedHeightFactor = 0.60;

  // Stream<Breed> _breedStream;

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  int _bottomBarSelectedItem = 0;
  int _bottomBarPreviousSelectedItem = 0;

  double _screenHeight = 0;
  double _screenWidth = 0;

  String _query = "";
  String _breedCountValue = "";

  bool _isAnimationCompleted = false;
  bool _showSearhBottomBar = false;

  @override
  void initState() {
    super.initState();

    // _breedStream = manager.breedStream;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
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
    ;
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

  Widget getMainPageViewWidget(BreedManager manager) {
    // print("screenHeight = " + screenHeight.toString());
    // print("screenWidth = " + screenWidth.toString());
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
          offset: Offset(_screenWidth * 0.6 * 0.5, -_screenWidth * 0.1),
          child: Transform.rotate(
            angle: -0.2,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: _screenWidth,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-_screenWidth * 0.6 * 0.5, _screenHeight * 0.4),
          child: Transform.rotate(
            angle: -0.2,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: _screenWidth,
            ),
          ),
        ),
        Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: _heightFactorAnimation.value,
              child: ImagePageView(query: _query),
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
                          return EmptyBottomFraction(
                              screenHeight: _screenHeight);
                        case ConnectionState.active:
                          final breed = snapshot.data;
                          print("Stream recived in Active, " + breed.name);
                          return BottomFraction(
                              screenHeight: _screenHeight, breed: breed);
                        case ConnectionState.done:
                          final breed = snapshot.data;
                          print("Stream recived in Done, " + breed.name);
                          return BottomFraction(
                              screenHeight: _screenHeight, breed: breed);
                      }
                    }),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: (_showSearhBottomBar)
                  ? SearchAppBottomBar(_onSubmittedTextField,
                      _onBottomNavBarTab, _bottomBarSelectedItem)
                  : FullAppBottomBar(
                      _onBottomNavBarTab, _bottomBarSelectedItem),
            ),
          ],
        )
      ],
    );
  }

  Widget getMainListViewWidget(BreedManager manager) {
    return Stack(children: <Widget>[
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
        offset: Offset(_screenWidth * 0.6 * 0.5, -_screenWidth * 0.1),
        child: Transform.rotate(
          angle: -0.2,
          child: Icon(
            Icons.pets,
            color: Colors.white10,
            size: _screenWidth,
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(-_screenWidth * 0.6 * 0.5, _screenHeight * 0.4),
        child: Transform.rotate(
          angle: -0.2,
          child: Icon(
            Icons.pets,
            color: Colors.white10,
            size: _screenWidth,
          ),
        ),
      ),
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 1.0,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    brightness: Brightness.dark,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 100.0,
                    floating: false,
                    pinned: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: StreamBuilder<int>(
                          stream: manager.breedCountStream,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return Text("Breeds List " + _breedCountValue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ));
                              case ConnectionState.active:
                                _breedCountValue = snapshot.data.toString();
                                print("Stream recived in Active, " +
                                    _breedCountValue);
                                return Text("Breeds List " + _breedCountValue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ));
                              case ConnectionState.done:
                                _breedCountValue = snapshot.data.toString();
                                print("Stream recived in Done, " +
                                    _breedCountValue);
                                return Text("Breeds List " + _breedCountValue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ));
                            }
                          }),
                    ),
                  ),
                ];
              },
              body: ImageListView(query: _query),
            ),
            // ImageListView(query: _query),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: (_showSearhBottomBar)
                ? SearchAppBottomBar(_onSubmittedTextField, _onBottomNavBarTab,
                    _bottomBarSelectedItem)
                : FullAppBottomBar(_onBottomNavBarTab, _bottomBarSelectedItem),
          ),
        ],
      ),
    ]);
  }

  Widget getWidget(BreedManager manager) {
    switch (_bottomBarSelectedItem) {
      case 0:
        {
          return getMainPageViewWidget(manager);
        }
        break;
      case 1:
        {
          return getMainListViewWidget(manager);
        }
        break;
      case 2:
        {
          return getMainPageViewWidget(manager);
        }
        break;
      case 3:
        {
          return getMainPageViewWidget(manager);
        }
        break;
      case 4:
        {
          return getMainPageViewWidget(manager);
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
          body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              // print("Animation Called");
              // return getMainListViewWidget(manager);
              return getWidget(manager);
            },
          ),
        ),
      ],
    );
  }

  void _onSubmittedTextField(String query) {
    print("Received _onSubimittedTextFiled = " + query);
    setState(() {
      _query = query;
    });
  }

  void _onBottomNavBarTab(AppBottomBarOption option) {
    print("_onBottomNavBarTab pressed with value = " + option.toString());

    switch (option) {
      case AppBottomBarOption.dog:
        {
          _showSearhBottomBar = false;
        }
        break;
      case AppBottomBarOption.search:
        {
          _showSearhBottomBar = true;
        }
        break;
      case AppBottomBarOption.photo:
        {
          _showSearhBottomBar = false;
        }
        break;
      case AppBottomBarOption.share:
        {
          _showSearhBottomBar = false;
        }
        break;
      case AppBottomBarOption.list:
        {
          _showSearhBottomBar = false;
        }
        break;
      case AppBottomBarOption.none:
        {
          _showSearhBottomBar = false;
        }
        break;
    }
    setState(() {
      _bottomBarPreviousSelectedItem = _bottomBarSelectedItem;
      _bottomBarSelectedItem = option.index;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BottomFraction extends StatelessWidget {
  const BottomFraction({
    Key key,
    @required this.screenHeight,
    @required this.breed,
  }) : super(key: key);

  final double screenHeight;
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: screenHeight * 0.09, child: DogNameBottomBar(breed: breed)),
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
