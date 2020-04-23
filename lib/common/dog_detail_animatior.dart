import 'package:flutter/material.dart';
import 'package:my_app/pages/dog_detail_page.dart';
import 'package:my_app/pages/fifth_route.dart';
import 'dog_detail_enter_animations.dart';
import 'package:my_app/model/dog_model.dart';

class DogDetailAnimator extends StatefulWidget {
  final Breed breed;

  DogDetailAnimator({Key key, this.breed}) : super(key: key);

  @override
  _DogDetailAnimator createState() => new _DogDetailAnimator(breed);
}

class _DogDetailAnimator extends State<DogDetailAnimator>
    with SingleTickerProviderStateMixin {

  _DogDetailAnimator(this._breed);

  Breed _breed;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FifthRoute(title: "More Dod Breeds",);
    return DogDetailPage(breed: _breed, animation: DogDetailsEnterAnimations(_controller));
  }
}
