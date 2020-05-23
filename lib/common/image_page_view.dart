import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/two_line_item.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/provider/provider.dart';

class ImagePageView extends StatefulWidget {
  ImagePageView({Key key, this.title, this.query, this.breed})
      : super(key: key);

  final String title;
  final String query;
  final Breed breed;

  @override
  _ImagePageViewState createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  BreedManager manager;

  Stream<List<Breed>> breedsStream;

  AnimationController _animationController;
  Animation _slideAnimation;
  Animation _fadeAnimation;

  PageController _pageController;

  // ValueNotifier<double> _page = ValueNotifier<double>(0.0);

  // BreedManager local_manager = BreedManager();

    int _previousPage;

  String _query = "";

  bool _firstValueSet = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _slideAnimation = TweenSequence([
      TweenSequenceItem<Offset>(
          weight: 10, tween: Tween(begin: Offset(0, 0), end: Offset(0, 0.8))),
      TweenSequenceItem<Offset>(
      weight: 90, tween: Tween(begin: Offset(0, 0.8), end: Offset(0, 0)))
    ]).animate(_animationController);
    _fadeAnimation = TweenSequence([
      TweenSequenceItem<double>(weight: 10, tween: Tween(begin: 1, end: 0)),
      TweenSequenceItem<double>(weight: 90, tween: Tween(begin: 0, end: 1))
    ]).animate(_animationController);
  }

  void _onScroll() {
    // print(' ----- onScroll Called -----');
    // if (_pageController.page.toInt() == _pageController.page) {
    //   _previousPage = _pageController.page.toInt();
    // }
    // // widget.notifier?.value = _pageController.page - _previousPage;
    // if (_pageController.position.userScrollDirection == ScrollDirection.forward) {
    //   print(' ----- swiped to right -----' + _previousPage.toString());
    // } else {
    //   print(' ----- swiped to left -----' + _previousPage.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    manager = Provider.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    _pageController = PageController(
        initialPage: manager.lastPositionShown,
        keepPage: true,
        viewportFraction: 1)..addListener(_onScroll);
        _pageController.addListener(_onScroll);
    if (widget.query != _query) {
      _query = widget.query;
      breedsStream = manager.filteredBreedList(_query);
    } else {
      breedsStream = breedsStream ?? manager.filteredBreedList("");
    }


    return Stack(
      children: <Widget>[
        StreamBuilder<List<Breed>>(
            stream: breedsStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Container(
                      width: screenWidth,
                      height: screenHeight,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ));
                case ConnectionState.done:
                  breeds = snapshot.data;
                  if (widget.breed is Breed) {
                    int initialPage = breeds.indexOf(widget.breed);
                    print(
                        "-- Should Display breed " + widget.breed.name + " --");
                    _pageController = PageController(
                        initialPage: initialPage,
                        keepPage: true,
                        viewportFraction: 1);
                    _pageController.addListener(_onScroll);
                  }
                  return PageView.builder(
                    pageSnapping: true,
                    onPageChanged: (pos) {
                      setState(() {
                        _animationController.reset();
                        _animationController.forward();
                        HapticFeedback.lightImpact();
                        print("Sink emited onPageChange, " + breeds[pos].name);
                        manager.changeBreed(breeds[pos], position: pos);
                      });
                    },
                    itemCount: (breeds == null) ? 0 : breeds.length,
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int itemIndex) {
                      if (_firstValueSet == false) {
                        _firstValueSet = true;
                        print("Sink emited on itemBuilder, " +
                            breeds[itemIndex].name);
                        manager.changeBreed(breeds[itemIndex]);
                      }
                      return DogCardSliver(breed: breeds[itemIndex], scale: 1);
                    },
                  );
              }
            }),
        Positioned(
          bottom: 16,
          left: 20,
          right: 20,
          child: DogProfileDetails(
            manager: manager,
            slideAnimation: _slideAnimation,
            fadeAnimation: _fadeAnimation,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class DogProfileDetails extends StatelessWidget {
  final BreedManager manager;
  final Animation slideAnimation, fadeAnimation;

  DogProfileDetails({this.manager, this.slideAnimation, this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<Breed>(
          stream: manager.breedStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container();
              case ConnectionState.active:
              case ConnectionState.done:
                final breed = snapshot.data;
                print("-- Stream recived in Done, " + breed.name);
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TwoLineItem(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          firstText: "Height",
                          secondText: breed.height + " inches",
                        ),
                        TwoLineItem(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          firstText: "Weight",
                          secondText: breed.weight + " pounds",
                        ),
                        TwoLineItem(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          firstText: "Lifespan",
                          secondText: breed.longevety + " years",
                        ),
                      ],
                    ),
                  ),
                );
            }
          }),
    );
  }
}
