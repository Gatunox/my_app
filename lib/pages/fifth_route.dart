import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
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
  Stream<Breed> _breedStream;

  // BreedManager manager = BreedManager();

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  final double expandedHeightFactor = 0.88;
  final double collapsedHeightFactor = 0.65;
  double screenHeight = 0;
  double screenWidth = 0;

  bool isAnimationCompleted = false;

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
      if (isAnimationCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }

  Widget getWidget(BreedManager manager) {
    var container = Container(

        // child: Hero(
        //     tag: "dogName" + breeds[0].name.toString(),
        //     flightShuttleBuilder: (
        //       BuildContext flightContext,
        //       Animation<double> animation,
        //       HeroFlightDirection flightDirection,
        //       BuildContext fromHeroContext,
        //       BuildContext toHeroContext,
        //     ) {
        //       return DefaultTextStyle(
        //         style: DefaultTextStyle.of(toHeroContext).style,
        //         child: toHeroContext.widget,
        //       );
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.only(
        //           top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
        //       child: Container(
        //         child: Align(
        //           alignment: Alignment.topCenter,
        //           child: Material(
        //             color: Colors.transparent,
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 Container(
        //                   color: Colors.transparent,
        //                   child: FittedBox(
        //                     fit: BoxFit.scaleDown,
        //                     child: Text(
        //                       breeds[0].name.toString(),
        //                       overflow: TextOverflow.ellipsis,
        //                       textAlign: TextAlign.center,
        //                       style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.w700,
        //                         fontSize: 23,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        // ),
        );
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
              color: snowWhiteColor05,
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
              color: snowWhiteColor05,
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
              child: StreamBuilder<Breed>(
                  stream: manager.breedStream,
                  builder: (context, snapshot) {
                    print("snapshot.connectionState = " + snapshot.connectionState.toString());
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Container();
                      case ConnectionState.active:
                        final breed = snapshot.data;
                        print("Stream recived, " + breed.name);
                        return Container();
                      case ConnectionState.done:
                        final breed = snapshot.data;
                        print("Stream recived, " + breed.name);
                        return Container();
                    }
                  }),
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
    BreedManager manager = Provider.of(context);
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
              return getWidget(manager);
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
