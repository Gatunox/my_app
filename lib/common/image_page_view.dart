import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/provider/provider.dart';

class ImagePageView extends StatefulWidget {
  ImagePageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageViewState createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView>
    with SingleTickerProviderStateMixin {

  // Stream<List<Breed>> breedsStream;

  AnimationController _animationController;
  
  PageController _pageController;

  // ValueNotifier<double> _page = ValueNotifier<double>(0.0);

  // BreedManager local_manager = BreedManager();

  @override
  void initState() {
    super.initState();
    // breedsStream = manager.filteredBreedList("");
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    ;
  }

  @override
  Widget build(BuildContext context) {
    BreedManager manager = Provider.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // return Image.asset("images/russell-terrier.jpg",
    //     fit: BoxFit.cover,
    //     colorBlendMode: BlendMode.hue,
    //     color: Colors.black38);
    return StreamBuilder<List<Breed>>(
        stream: manager.filteredBreedList(""),
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
              return PageView.builder(
                pageSnapping: true,
                onPageChanged: (pos) {
                  HapticFeedback.lightImpact();
                  print("Sink emited onPageChange, "+ breeds[pos].name);
                  manager.changeBreed(breeds[pos]);
                },
                itemCount: (breeds == null) ? 0 : breeds.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int itemIndex) {
                  print("Sink emited on itemBuilder, "+ breeds[itemIndex].name);
                  manager.changeBreed(breeds[itemIndex]);
                  return DogCardSliver(breed: breeds[itemIndex], scale: 1);
                },
              );
          }
        });
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
