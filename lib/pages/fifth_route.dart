import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/letter_item.dart';
import 'package:my_app/manager/breed_manager.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/letter_model.dart';
import 'package:my_app/pages/third_route.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

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
    Uint8List kBytes;
    rootBundle.load('images/paw.png').then((data) {
      if (mounted)
        setState(() {
          kBytes = data.buffer.asUint8List();

          print(kBytes);
          // var out = new File('output.txt').openWrite();
          // var item = 0;
          // for (var byte in kBytes) {
          //   item++;
          //   out.write(charToUnicode(byte));
          //   print(item.toString() + " " + charToUnicode(byte));
          // }
          // out.close();
          print(kTransparentImage);
        });
    });
    _editingController = TextEditingController();
    _controller = PageController(
        initialPage: 0, viewportFraction: _viewportScale, keepPage: false);
  }

  String charToUnicode(int char) {
    if (char == null || char < 0 || char > 0xfffffffff) {
      throw new ArgumentError('c: $char');
    }

    var hex = char.toRadixString(16);

    return '\0x$hex';
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    super.build(context);
    SizeConfig().init(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    //print("-- FifthRoute Widget build --");
    return Stack(
      children: <Widget>[
        Container(
          //Add box decoration
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              colors: [backgroundColor, backgroundColor],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(screenWidth * 0.2, 0),
          child: Transform.rotate(
            angle: -0.3,
            child: Icon(
              Icons.pets,
              color: darkerPurpleColor12,
              size: screenWidth,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(screenWidth * -0.2, screenHeight * 0.5),
          child: Transform.rotate(
            angle: -0.7,
            child: Icon(
              Icons.pets,
              color: darkerPurpleColor12,
              size: screenWidth,
            ),
          ),
        ),
        SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
                child: Filter(
                    isFilterVisible: _isFilterVisible,
                    scrrenHeight: screenHeight),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        RichText(
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
                        Transform.translate(
                            offset: Offset(185.0, 16.0),
                            child: StreamBuilder<int>(
                                stream: manager.breedCount,
                                builder: (context, snapshot) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      (snapshot.data ?? 0).toString(),
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Roboto',
                                          color: Colors.purpleAccent),
                                    ),
                                  );
                                }))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFilterVisible = !_isFilterVisible;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(
                              _isFilterVisible
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("GestureDetector onTap");
                            Navigator.of(context).push(_createRoute());
                          },
                          onDoubleTap: () {
                            print("GestureDetector onDoubleTap");
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.view_list),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.12,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 8.0),
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
                        width: screenWidth,
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
                                    isFirstItem: index == 0 ? true : false,
                                    isLastItem: index == letters.length - 1
                                        ? true
                                        : false,
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
                    height: screenWidth + screenWidth / 20,
                    width: screenWidth,
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
                                    width: screenWidth,
                                    height: screenHeight,
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
                                  itemCount: (breeds == null) ? 0 : breeds.length,
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
        ),
      ],
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ThirdRoute(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.decelerate;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
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
      _selectedCount -= 1;
      if (_selectedCount == 0) {
        _selectedItem = -1;
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

class Filter extends StatelessWidget {
  const Filter({
    Key key,
    @required bool isFilterVisible,
    @required this.scrrenHeight,
  })  : _isFilterVisible = isFilterVisible,
        super(key: key);

  final bool _isFilterVisible;
  final double scrrenHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      height: _isFilterVisible ? scrrenHeight * 0.8 : 0,
      duration: Duration(milliseconds: 500),
      child: Container(
        margin: EdgeInsets.only(left: 0.0, top: 2.0, right: 0.0, bottom: 2.0),
        child: ClipRRect(
          borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0)),
          child: Container(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Filter elements goes here",
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
