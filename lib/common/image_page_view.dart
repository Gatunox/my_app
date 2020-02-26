import 'package:flutter/material.dart';

class ImagePageView extends StatefulWidget {
  ImagePageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImagePageViewState createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<ImagePageView>
    with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;

  @override
  void initState() {
    print("--- initState ---");
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/russell-terrier.jpg",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.hue,
              color: Colors.black38);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
