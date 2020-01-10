import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/letter_model.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/size_config.dart';

const SCALE_FRACTION = 0.9;
const FULL_SCALE = 1.0;
const VIEWPORT_FRACTION = 0.9;

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<double> _page = ValueNotifier<double>(0.0);
  int _currentPage = 0;
  int _selectedItem = 0;
  double _viewportScale = 0.84;
  bool _isLetterIndexVisible = true;
  bool _isFilterVisible = false;
  bool _onPageChanged = true;
  //Future<List<Breed>> breeds;
  BreadManager manager = BreadManager();
  Stream<List<Breed>> breedsStream;
  // Stream<List<Letter>> lettersStream;
  // Stream<int> countStream;

  TextEditingController _editingController;
  PageController _controller;

  @override
  void initState() {
    print("initState");
    super.initState();

    manager.listenToBreeeListStream("");
    breedsStream = manager.filteredBreedList("");
    // lettersStream = manager.breedLetterList;
    // countStream = manager.breedCount;

    _editingController = TextEditingController();
    _controller = PageController(
        initialPage: _currentPage,
        viewportFraction: _viewportScale,
        keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    super.build(context);
    print("-- FifthRoute Widget build --");
    return Container(
      //Add box decoration
      width: scrrenWidth,
      height: scrrenHeight,
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          colors: [
            backgroundColor,
            backgroundColor,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child:
              //   FutureBuilder<List<Breed>>(
              // future: breeds,
              // builder: (BuildContext context, AsyncSnapshot<List<Breed>> snapshot) {
              //   switch (snapshot.connectionState) {
              //     case ConnectionState.none:
              //     case ConnectionState.active:
              //     case ConnectionState.waiting:
              //       return Container(
              //           width: scrrenWidth,
              //           height: scrrenHeight,
              //           child: Center(child: CircularProgressIndicator()));
              //     case ConnectionState.done:
              //       if (_querySring != null && _querySring.isNotEmpty) {
              //         List<Breed> dummyDoggos = List<Breed>();
              //         initialDoggos.forEach((item) {
              //           if (item.contains(_querySring)) {
              //             dummyDoggos.add(item);
              //           }
              //         });
              //         duplicateDoggos.clear();
              //         duplicateDoggos.addAll(dummyDoggos);
              //         _page.value = _controller.page;
              //       } else {
              //         initialDoggos.clear();
              //         duplicateDoggos.clear();
              //         initialDoggos.addAll(snapshot.data);
              //         duplicateDoggos.addAll(initialDoggos);
              //       }
              //       generateMap();
              //       if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              //       return
              Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  height: _isFilterVisible ? scrrenHeight / 1.4 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 0.0, top: 2.0, right: 0.0, bottom: 2.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(30.0),
                          bottomRight: const Radius.circular(30.0),
                          topLeft: const Radius.circular(30.0),
                          topRight: const Radius.circular(30.0)),
                      child: Container(
                        color: backgroundColor,
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                              text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "B",
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: scrrenWidth,
                    height: 40,
                    child: AppBar(
                      backgroundColor: Colors.transparent, //No more green
                      elevation: 0.0, //Shadow gone
                      primary: true,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 0.0, top: 8.0, bottom: 0.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Dog Breeds",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 35.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFilterVisible = !_isFilterVisible;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 25.0, top: 8.0, bottom: 0.0),
                        child: Icon(
                          _isFilterVisible
                              ? Icons.expand_less
                              : Icons.expand_more,
                          color:
                              _isFilterVisible ? Colors.white : Colors.white24,
                          size: _isFilterVisible ? 30.0 : 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 24.0),
                    child: StreamBuilder<int>(
                        stream: manager.breedCount,
                        builder: (context, snapshot) {
                          return RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: (snapshot.data ?? 0).toString(),
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 26.0,
                                      color: Colors.purpleAccent),
                                ),
                                TextSpan(
                                  text: " Results ",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 26.0,
                                      color: Colors.purpleAccent),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: scrrenWidth,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 30.0, bottom: 8.0),
                        child: TextField(
                          onChanged: (value) {
                            // print("onChanged Searching for = " + value);
                            // filterSearchResults(value);
                            // setState(() {
                            //  _querySring = value;
                            //});
                          },
                          onSubmitted: (value) {
                            setState(() {
                              //_querySring = value;
                              manager.listenToBreeeListStream(value);
                              // breedsStream = manager.breedList;
                              breedsStream = manager.filteredBreedList(value);
                            });
                            
                            print("onSubmitted Searching for = " + value);
                          },
                          autocorrect: false,
                          controller: _editingController,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Breed Name",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                curve: Curves.fastOutSlowIn,
                opacity: _isLetterIndexVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: scrrenWidth,
                        color: Colors.transparent,
                        child: StreamBuilder<List<Letter>>(
                            stream: manager.breedLetterList,
                            builder: (context, snapshot) {
                              letters = snapshot.data ?? [];
                              // print("letters.length = " + letters.length.toString());
                              return ListView.builder(
                                addAutomaticKeepAlives: true,
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: letters.length,
                                itemBuilder: (context, int index) {
                                  return LetterItem(
                                    letter: letters[index],
                                    currentIndex: index,
                                    selectedItem: _selectedItem,
                                    onTapTap: () {
                                      //print("onTapTap onTapTap");
                                      onTapTap(index);
                                    },
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: scrrenWidth + scrrenWidth / 20,
                    width: scrrenWidth,
                    margin: const EdgeInsets.only(top: 0.0),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            setState(() {
                              _page.value = _controller.page;
                              //print("controller.page = " + _controller.page.toString());
                            });
                          }
                        });
                      },
                      child: StreamBuilder<List<Breed>>(
                          stream: breedsStream,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.active:
                              case ConnectionState.waiting:
                                return Container(
                                    width: scrrenWidth,
                                    height: scrrenHeight,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              case ConnectionState.done:
                                breeds = snapshot.data;
                                return PageView.builder(
                                  onPageChanged: (pos) {
                                    setState(() {
                                      //_currentPage = pos;
                                      // HapticFeedback.lightImpact();
                                      // if (_onPageChanged) {
                                      //   print("Current Page = " +
                                      //       _currentPage.toString());
                                      //   String searhLetter =
                                      //       dogIndexMap[_currentPage].toString();
                                      //   int changeToItem = dogIndex.indexWhere(
                                      //       (letter) => letter.value
                                      //           .startsWith(searhLetter));
                                      //   _selectedItem = changeToItem;
                                      // }
                                    });
                                  },
                                  itemCount: breeds.length,
                                  controller: _controller,
                                  itemBuilder:
                                      (BuildContext context, int itemIndex) {
                                    //print((_page.value - itemIndex).abs());
                                    var scale = (1 -
                                        (((_page.value - itemIndex).abs() * 0.1)
                                            .clamp(0.0, 1.0)));
                                    return DogCardSliver(
                                        breed: breeds[itemIndex], scale: scale);
                                  },
                                );
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //     }
          //     return null; // unreachable
          //   },
          // )),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  onTapTap(int index) {
    print("calling setState");
    setState(() {
      int currentPage = _controller.page.round();
      int totalLength = initialDoggos.length - 1;
      int goToPage = letters[index].points_to;
      String letter = letters[index].value;

      //print("Selected index = " + index.toString());
      //print("Selected letter = " + letter);
      //print("Jumping to = " + dogLetterMap[letter].toString());

      _selectedItem = index;
      //goToPage = dogLetterMap[letter];
      //goToPage = 20;
      int delta = (currentPage - goToPage).abs();
      double durationRatio = (delta / totalLength);
      double duration = totalLength * 65.0 * durationRatio;
      //print("delta value = " + delta.toString());
      //print("durationRatio value = " + durationRatio.toString());
      //print("duration value = " + duration.toString());
      _onPageChanged = false;
      Future<void> future = _controller.animateToPage(goToPage,
          duration: Duration(milliseconds: duration.round()),
          curve: Curves.easeOut);
      future
          .then((void _void) => handleValue())
          .catchError((error) => handleError(error));
      //_controller.jumpToPage(goToPage);
    });
  }

  void filterSearchResults(String query) {
    // FIXME: After applying filder the first item must be selected
    // TODO: Remember previos selection before filter so we can return to it once filter is clear

    duplicateDoggos.clear();
    if (query.isNotEmpty) {
      List<Breed> dummyDoggos = List<Breed>();
      initialDoggos.forEach((item) {
        if (item.contains(query)) {
          //print(item.name);
          dummyDoggos.add(item);
        }
      });
//      setState(() {
//        duplicateDoggos.clear();
//        duplicateDoggos.addAll(dummyDoggos);
//        generateMap();
//      });
//    } else {
//      setState(() {
//        duplicateDoggos.clear();
//        duplicateDoggos.addAll(initialDoggos);
//        generateMap();
//      });
    }
    print("Current Page = " + _currentPage.toString());
  }

  @override
  void dispose() {
    _editingController.dispose();
    _controller.dispose();
    super.dispose();
  }

  handleError(error) {
    print("Future Handle Error = " + error.toString());
  }

  handleValue() {
    _onPageChanged = true;
    print("Future Handle Done");
  }
}

class LetterItem extends StatelessWidget {
  const LetterItem({
    Key key,
    @required this.letter,
    @required this.currentIndex,
    @required this.selectedItem,
    @required this.onTapTap,
  }) : super(key: key);

  final Letter letter;
  final int currentIndex;
  final int selectedItem;
  final Function onTapTap;

  @override
  Widget build(BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    Color color = foregroungColor12;
    TextStyle textStyle = disabledListItemStyle;

    leftMargin = currentIndex == 0 ? 20.0 : 2.0;
    rightMargin = currentIndex == letters.length - 1 ? 20.0 : 2.0;

    if (letter.enabled) {
      color =
          currentIndex == selectedItem ? darkerPurpleColor : foregroungColor45;
      textStyle = currentIndex == selectedItem
          ? selectedListItemStyle
          : unselectedListItemStyle;
    }

    return GestureDetector(
      onTap: () {
        //print("GestureDetector onTap");
        if (letter.enabled) {
          onTapTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            left: leftMargin, top: 2.0, right: rightMargin, bottom: 2.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0),
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0)),
          child: Container(
            color: color,
            width: 60,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: letter.value,
                    style: textStyle,
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
