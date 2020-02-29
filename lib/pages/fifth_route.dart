import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
import 'package:my_app/common/image_page_view.dart';
import 'package:my_app/styles/colors.dart';

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  final double expandedHeightFactor = 0.88;
  final double collapsedHeightFactor = 0.50;
  double screenHeight = 0;
  double screenWidth = 0;

  bool isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _heightFactorAnimation =
        Tween<double>(begin: expandedHeightFactor, end: collapsedHeightFactor, )
            .animate(_animationController)
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
      if (isAnimationCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }

  Widget getWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          //Add box decoration
          width: screenWidth,
          height: screenHeight,
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
          offset: Offset(screenWidth * 0.2, -screenHeight * 0.244),
          child: Transform.rotate(
            angle: -0.3,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: screenWidth,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(screenWidth * -0.2, screenHeight * 0.30),
          child: Transform.rotate(
            angle: -0.7,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: screenWidth,
            ),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value - 0.129,
          child: ImagePageView(),
        ),
        GestureDetector(
          onTap: onButtonPartTap,
          onVerticalDragUpdate: onHandleVerticalUpdate,
          onVerticalDragEnd: onHandleVerticalEnd,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.999 - _heightFactorAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                  color: snowWhiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
            ),
          ),
        )
      ],
    );
  }

  onHandleVerticalUpdate(DragUpdateDetails updateDetails) {
    double fractionDragged = updateDetails.primaryDelta / screenHeight;
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
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Scaffold(
      backgroundColor: snowWhiteColor,
          bottomNavigationBar: AppBottomBar(),
          body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              print("Animation Called");
              return getWidget();
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
