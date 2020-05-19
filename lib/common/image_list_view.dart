import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/dog_card_compact.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/provider/provider.dart';

class ImageListView extends StatefulWidget {
  ImageListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final double expandedHeightFactor = 0.45;

  AnimationController _animationController;
  Animation<double> _heightFactorAnimation;

  ScrollController _scrollController;

  TextEditingController _editingController;

  Stream<List<Breed>> breedsStream = null;

  String _query;

  bool _changedQuery = false;
  bool _searchBoxVisible = true;

  @override
  void initState() {
    super.initState();
    _query = "";
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _editingController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    BreedManager manager = Provider.of(context);
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    if (_changedQuery) {
      _changedQuery = false;
      breedsStream = manager.filteredBreedList(_query);
      manager.listenToBreeeListStream(_query);
    } else {
      breedsStream = breedsStream ?? manager.filteredBreedList(_query);
      manager.listenToBreeeListStream(_query);
    }

    print("Rebuilding Widget");

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
              double searchBarHeight = _screenWidth * 0.15;
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 20.0, right: 20.0, bottom: 0.0),
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 200),
                      opacity: _searchBoxVisible ? 1.0 : 0.0,
                      child: AnimatedSize(
                        vsync: this,
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          color: Colors.transparent,
                      width: _screenWidth,
                          height: _searchBoxVisible ? searchBarHeight : 0.0,
                          margin: EdgeInsets.only(top: _searchBoxVisible ? 10 : 0),
                          child: TextField(
                            autocorrect: false,
                            controller: _editingController,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.white),
                                labelText: "Search for breeds",
                                labelStyle: new TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                            onSubmitted: (String query) {
                              print("onSubmitted called with query = " + query);
                              setState(() {
                                _query == query
                                    ? _changedQuery = false
                                    : _changedQuery = true;
                                _query = query;
                              });
                              // widget.onSubmittedCallback(query);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      child: ListView.separated(
                        // controller: _scrollController,
                        separatorBuilder: (context, index) => Divider(
                          height: 20,
                          color: Colors.transparent,
                        ),
                        padding: EdgeInsets.only(top: 20, bottom: 80),
                        // Must have an item count equal to the number of items!
                        addAutomaticKeepAlives: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: breeds.length,
                        // A callback that will return a widget.
                        itemBuilder: (context, int index) {
                          return DogCardCompact(breed: breeds[index]);
                        },
                      ),
                      onNotification: (scrollEndNotification) {
                        print("Calling setState with value = " +
                            scrollEndNotification.metrics.atEdge.toString());
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            print("Calling setState with value = " +
                                scrollEndNotification.metrics.atEdge
                                    .toString());
                            _searchBoxVisible =
                                scrollEndNotification.metrics.atEdge;
                          });
                        });
                        return false;
                      },
                    ),
                  ),
                ],
              );
          }
        });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _animationController.dispose();
    _editingController.dispose();
    super.dispose();
  }
}
