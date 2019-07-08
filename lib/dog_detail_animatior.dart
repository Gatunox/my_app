import 'package:flutter/material.dart';
import 'dog_detail_page.dart';
import 'dog_detail_enter_animations.dart';
import 'dog_model.dart';

class DogDetailAnimator extends StatefulWidget {
  final Dog dog;

  DogDetailAnimator({Key key, this.dog}) : super(key: key);

  @override
  _DogDetailAnimator createState() => new _DogDetailAnimator(dog);
}

class _DogDetailAnimator extends State<DogDetailAnimator>
    with SingleTickerProviderStateMixin {

  _DogDetailAnimator(this._dog);

  Dog _dog;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DogDetailPage(dog: _dog, animation: DogDetailsEnterAnimations(_controller));
  }
}
