import 'package:flutter/material.dart';
import 'package:my_app/common/app_bottom_bar.dart';
import 'package:my_app/common/dog_name_bottom_bar.dart';
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

  final double expandedHeightFactor = 0.76;
  final double collapsedHeightFactor = 0.60;
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
    // print("screenHeight = " + screenHeight.toString());
    // print("screenWidth = " + screenWidth.toString());
    return Stack(
      // fit: StackFit.expand,
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
          offset: Offset(screenWidth * 0.6 * 0.5, -screenWidth * 0.1),
          child: Transform.rotate(
            angle: -0.2,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: screenWidth,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-screenWidth * 0.6 * 0.5, screenHeight * 0.4),
          child: Transform.rotate(
            angle: -0.2,
            child: Icon(
              Icons.pets,
              color: Colors.white10,
              size: screenWidth,
            ),
          ),
        ),
        Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: _heightFactorAnimation.value,
              child: ImagePageView(),
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
                              screenHeight: screenHeight);
                        case ConnectionState.active:
                          final breed = snapshot.data;
                          print("Stream recived in Active, " + breed.name);
                          return BottomFraction(
                              screenHeight: screenHeight, breed: breed);
                        case ConnectionState.done:
                          final breed = snapshot.data;
                          print("Stream recived in Done, " + breed.name);
                          return BottomFraction(
                              screenHeight: screenHeight, breed: breed);
                      }
                    }),
              ),
            ),
          ],
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
