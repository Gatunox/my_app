import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/dog_card_compact.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/provider/provider.dart';

class ImageListView extends StatefulWidget {
  ImageListView({Key key, this.title, this.query}) : super(key: key);

  final String title;
  final String query;

  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final double expandedHeightFactor = 0.45;

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  Stream<List<Breed>> breedsStream = null;

  String _query = "";

  bool _firstValueSet = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    BreedManager manager = Provider.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    if (widget.query != _query) {
      _query = widget.query;
      breedsStream = manager.filteredBreedList(_query);
      manager.listenToBreeeListStream(_query);
    } else {
      breedsStream = breedsStream ??
          manager.filteredBreedList(_query);
      manager.listenToBreeeListStream(_query);
    }

    return StreamBuilder<List<Breed>>(
        stream: breedsStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print("Building - ListView ");
              return FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: expandedHeightFactor,
                child: Center(
                    child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                )),
              );
            case ConnectionState.done:
              print("Build Done - ListView");
              breeds = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.only(top: 20, bottom: 150),
                // Must have an item count equal to the number of items!
                addAutomaticKeepAlives: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: breeds.length,
                // A callback that will return a widget.
                itemBuilder: (context, int index) {
                  return DogCardCompact(breed: breeds[index]);
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
