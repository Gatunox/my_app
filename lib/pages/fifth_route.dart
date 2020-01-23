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

  double _viewportScale = 0.84;
  bool _isLetterIndexVisible = true;
  bool _isFilterVisible = false;
  bool _onPageChanged = false;
  bool _searchFlag = false;
  int _activeItem = 0;
  int _selectedItem = -1;
  int _selectedCount = 0;
  Color _boderColor = foregroungColor12;
  //Future<List<Breed>> breeds;
  BreadManager manager = BreadManager();
  Stream<List<Breed>> breedsStream;
  Stream<List<Letter>> lettersStream;
  // Stream<int> countStream;

  TextEditingController _editingController;
  PageController _controller;

  @override
  void initState() {
    print("initState");
    super.initState();
    manager.listenToBreeeListStream("");
    breedsStream = manager.filteredBreedList("");
    lettersStream = manager.breedLetterList;
    // countStream = manager.breedCount;

    _editingController = TextEditingController();
    _controller = PageController(
        initialPage: 0, viewportFraction: _viewportScale, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 6.0;
    super.build(context);
    SizeConfig().init(context);
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    //print("-- FifthRoute Widget build --");
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
          child: Column(
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
                    height: 15,
                    // child: AppBar(
                    //   //backgroundColor: Colors.transparent, //No more green
                    //   elevation: 0.0, //Shadow gone
                    //   brightness: Brightness.dark,
                    //   primary: true,
                    // ),
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
                  //Spacer(),
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
                            left: 8.0, right: 35.0, top: 8.0, bottom: 0.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 24.0),
                    child: StreamBuilder<int>(
                        stream: manager.breedCount,
                        builder: (context, snapshot) {
                          // print("breedCount snapshot.connectionState = " +
                          //     snapshot.connectionState.toString());
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
                  GestureDetector(
                    onTap: () {
                      print("GestureDetector onTap");
                      // setState(() {
                      //   _boderColor = darkerPurpleColor;
                      Navigator.pushNamed(context, '/third');
                      // });
                      // Future.delayed(const Duration(milliseconds: 50), () {
                      //   setState(() {
                      //     _boderColor = foregroungColor12;
                      //   });
                      // });
                    },
                    onDoubleTap: () {
                      print("GestureDetector onDoubleTap");
                      // setState(() {
                      //   _boderColor = darkerPurpleColor;
                      Navigator.pushNamed(context, '/third');
                      // });
                      // Future.delayed(const Duration(milliseconds: 50), () {
                      //   setState(() {
                      //     _boderColor = foregroungColor12;
                      //   });
                      // });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 0.0, right: 20, bottom: 0.0),
                      child: ClipRRect(
                        child: Container(
                          height: 45,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: _boderColor, width: 2.0),
                            color: foregroungColor12,
                            borderRadius: BorderRadius.all(Radius.circular(
                                    12.0) //         <--- border radius here
                                ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.view_list),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     Container(
              //         width: 100,
              //         child: Material(
              //           color: Colors.transparent,
              //           child: Padding(
              //             padding: const EdgeInsets.only(
              //                 left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
              //             child: Material(
              //               shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.0) ),
              //               child: IconButton(
              //                 icon: Icon(Icons.android),
              //                 color: Colors.white,
              //                 onPressed: () {},
              //               ),
              //             ),
              //           ),
              //         ))
              //   ],
              // ),
              Row(
                children: <Widget>[
                  Container(
                    width: scrrenWidth,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 8.0),
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
                              manager.listenToBreeeListStream(value);
                              breedsStream = manager.filteredBreedList(value);
                              letters.clear();
                              _searchFlag = true;
                              _selectedCount = 0;
                              _selectedItem = -1;
                              _page.value = 0;
                              print("onSubmitted Searching for = " + value);
                            });
                          },
                          autocorrect: false,
                          controller: _editingController,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Breed Name",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)))),
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
                            stream: lettersStream,
                            builder: (context, snapshot) {
                              letters = snapshot.data ?? [];
                              // print("letters.length = " +
                              //     letters.length.toString());
                              // print(
                              //     "breedLetterList snapshot.connectionState = " +
                              //         snapshot.connectionState.toString());

                              return ListView.builder(
                                addAutomaticKeepAlives: true,
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: letters.length,
                                itemBuilder: (context, int index) {
                                //  print("Letter " +
                                //      letters[index].letter_value +
                                //      " is " +
                                //      letters[index].letter_enabled.toString() +
                                //      ", _activeItem = " +
                                //      _activeItem.toString() +
                                //      ", _selectedItem = " +
                                //      _selectedItem.toString());
                                  if (_searchFlag == true &&
                                      letters[index].letter_enabled) {
                                    _searchFlag = false;
                                    _activeItem = index;
                                  }
                                  return LetterItem(
                                    letter: letters[index],
                                    currentIndex: index,
                                    activeItem: _activeItem,
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
                                    HapticFeedback.lightImpact();
                                    //setState(() {
                                    // if (_onPageChanged) {
                                    // print(
                                    //     "======== Postion = " + pos.toString());
                                    String name = breeds[pos].dog_name;
                                    // print("======== name = " + name);
                                    //   int changeToItem = dogIndex.indexWhere(
                                    //       (letter) => letter.value
                                    //           .startsWith(searhLetter));
                                    final Letter letter =
                                        Letter(value: name.substring(0, 1));
                                    final int index = letters.indexOf(letter);
                                    _activeItem = index;
                                    // }
                                    //});
                                  },
                                  itemCount:
                                      (breeds == null) ? 0 : breeds.length,
                                  controller: _controller,
                                  itemBuilder:
                                      (BuildContext context, int itemIndex) {
                                    //print((_page.value - itemIndex).abs());
                                    var scale = (1 -
                                        (((_page.value - itemIndex).abs() * 0.1)
                                            .clamp(0.0, 0.1)));
                                    // print("_page.value = " +
                                    //     _page.value.toString() +
                                    //     ", itemIndex = " +
                                    //     itemIndex.toString());
                                    // print("scale = " +
                                    //     scale.toString() +
                                    //     ", " +
                                    //     breeds[itemIndex].dog_name);
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
    //print("onTapTap calling setState");
    setState(() {
      int currentPage = _controller.page.round();
      int totalLength = initialDoggos.length - 1;
      int goToPage = letters[index].points_to;
      String letter = letters[index].value;

      //print("Selected index = " + index.toString());
      //print("Selected letter = " + letter);
      //print("Jumping to = " + dogLetterMap[letter].toString());

      _selectedItem = index;
      _selectedCount += 1;
      //goToPage = dogLetterMap[letter];
      //goToPage = 20;
      int delta = (currentPage - goToPage).abs();
      double durationRatio = (delta / totalLength);
      double duration = totalLength * 100.0 * durationRatio;
      //print("delta value = " + delta.toString());
      //print("durationRatio value = " + durationRatio.toString());
      //print("duration value = " + duration.toString());
      _onPageChanged = false;
      Future<void> future = _controller.animateToPage(goToPage,
          duration: Duration(milliseconds: duration.round()),
          curve: Curves.easeInOut);
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
    print("Future handleValue Done");
    // print("_selectedCount = " +
    //       _selectedCount.toString() +
    //       ", _activeItem = " +
    //       _activeItem.toString() +
    //       ", _selectedItem = " +
    //       _selectedItem.toString());
    setState(() {
      _onPageChanged = true;
      if (_selectedCount == 1) {
        _selectedItem = -1;
      } else {
        _selectedCount -= 1;
      }
      // print("_selectedCount = " +
      //     _selectedCount.toString() +
      //     ", _activeItem = " +
      //     _activeItem.toString() +
      //     ", _selectedItem = " +
      //     _selectedItem.toString());
    });
  }
}

class LetterItem extends StatelessWidget {
  const LetterItem({
    Key key,
    @required this.letter,
    @required this.currentIndex,
    @required this.activeItem,
    @required this.selectedItem,
    @required this.onTapTap,
  }) : super(key: key);

  final Letter letter;
  final int currentIndex;
  final int activeItem;
  final int selectedItem;
  final Function onTapTap;

  @override
  Widget build(BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    Color backgroundColor = foregroungColor12;
    Color borderColor = foregroungColor12;
    TextStyle textStyle = disabledListItemStyle;

    leftMargin = currentIndex == 0 ? 20.0 : 2.0;
    rightMargin = currentIndex == letters.length - 1 ? 20.0 : 2.0;

    if (letter.enabled) {
      backgroundColor =
          currentIndex == activeItem ? darkerPurpleColor : foregroungColor45;
      borderColor =
          currentIndex == selectedItem ? darkerPurpleColor : foregroungColor12;
      textStyle = currentIndex == activeItem
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
          //borderRadius: new BorderRadius.only(
          //    bottomLeft: const Radius.circular(15.0),
          //    bottomRight: const Radius.circular(15.0),
          //    topLeft: const Radius.circular(15.0),
          //    topRight: const Radius.circular(15.0)),
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2.0),
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(12.0) //         <--- border radius here
                  ),
            ),
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
