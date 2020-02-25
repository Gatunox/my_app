import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
import 'package:my_app/styles/colors.dart';

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
    with SingleTickerProviderStateMixin {
  final double expandedHeightFactor = 0.85;
  final double collapsedHeightFactor = 0.50;

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  bool isAnimationCompleted = false;

  @override
  void initState() {
    print("--- initState ---");
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _heightFactorAnimation =
        Tween<double>(begin: expandedHeightFactor, end: collapsedHeightFactor)
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
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation.value,
          child: Image.asset("images/russell-terrier.jpg",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.hue,
              color: Colors.black38),
        ),
        GestureDetector(
          onTap: () {
            onButtonPartTap();
          },
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.05 - _heightFactorAnimation.value,
            child: Container(
              //color: Colors.purple,
              decoration: BoxDecoration(
                  color: darkerPurpleColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))
                  ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkerPurpleColor,
      bottomNavigationBar: AppBottomBar(),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) {
          print("Animation Called");
          return getWidget();
        },
      ),
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
