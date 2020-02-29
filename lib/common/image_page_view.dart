import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/common/dog_card_sliver.dart';

class ImagePageView extends StatefulWidget {
  ImagePageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageViewState createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView>
    with SingleTickerProviderStateMixin {
  Stream<List<Breed>> breedsStream;
  AnimationController _animationController;
  PageController _controller;
  ValueNotifier<double> _page = ValueNotifier<double>(0.0);
  BreadManager manager = BreadManager();

  @override
  void initState() {
    print("--- initState ---");
    super.initState();
    breedsStream = manager.filteredBreedList("");
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    ;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // return Image.asset("images/russell-terrier.jpg",
    //     fit: BoxFit.cover,
    //     colorBlendMode: BlendMode.hue,
    //     color: Colors.black38);
    return StreamBuilder<List<Breed>>(
        stream: breedsStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                  width: screenWidth,
                  height: screenHeight,
                  child: Center(child: CircularProgressIndicator()));
            case ConnectionState.done:
              breeds = snapshot.data;
              return PageView.builder(
                onPageChanged: (pos) {
                  HapticFeedback.lightImpact();
                },
                itemCount: (breeds == null) ? 0 : breeds.length,
                controller: _controller,
                itemBuilder: (BuildContext context, int itemIndex) {
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
    _animationController.dispose();
    super.dispose();
  }
}
