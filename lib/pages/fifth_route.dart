import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/dog_model.dart';

const SCALE_FRACTION = 0.9;
const FULL_SCALE = 1.0;
const VIEWPORT_FRACTION = 0.9;

class FifthRoute extends StatefulWidget {
  FifthRoute({Key key, this.title}) : super(key: key);

  final String title;

  List<String> initialDogTypes = []
    ..add('None')
    ..add('A')
    ..add('B')
    ..add('C')
    ..add('D')
    ..add('E')
    ..add('F')
    ..add('G')
    ..add('H')
    ..add('I')
    ..add('J')
    ..add('K')
    ..add('L')
    ..add('M')
    ..add('N')
    ..add('O')
    ..add('P')
    ..add('Q')
    ..add('R')
    ..add('S')
    ..add('T')
    ..add('U')
    ..add('V')
    ..add('X')
    ..add('W')
    ..add('Z');

  @override
  _FifthRouteState createState() => _FifthRouteState();
}

class _FifthRouteState extends State<FifthRoute>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<double> _page = ValueNotifier<double>(0.0);
  int _currentPage = 0;
  int _selectedItem = 0;
  double _viewportScale = 0.84;

  TextEditingController _editingController;
  PageController _controller;

  @override
  void initState() {
    _editingController = TextEditingController();
    _controller = PageController(
        initialPage: _currentPage, viewportFraction: _viewportScale);
    duplicateDoggos.addAll(initialDoggos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    super.build(context);
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
            children: <Widget>[
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20.0, right: 0.0, top:4.0, bottom: 4.0),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: initialDoggos.length.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                color: Colors.purpleAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: scrrenWidth,
                    child: Material(
                      color: backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0, right: 20.0, top:4.0, bottom: 4.0),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchResults(value);
                            print("Searching for = " + value);
                          },
                          controller: _editingController,
                          decoration: InputDecoration(
                              labelText: "Search",
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Filter",
                          style: fadedListTitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: scrrenWidth,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 0.0),
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: widget.initialDogTypes.length,
                      // A callback that will return a widget.
                      itemBuilder: (context, int index) {
                        return new LetterItem(
                          widget: widget,
                          currentIndex: index,
                          selectedItem: _selectedItem,
                          onTapTap: () {
                            print("onTapTap onTapTap");
                            onTapTap(index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    height: scrrenWidth + 50,
                    width: scrrenWidth,
                    margin: const EdgeInsets.only(top: 50.0),
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        if (mounted) {
                          setState(() {
                            _page.value = _controller.page;
                            // print("controller.page = " + _controller.page.toString());
                          });
                        }
                      },
                      child: PageView.builder(
                        onPageChanged: (pos) {
                          setState(() {
                            _currentPage = pos;
                            HapticFeedback.lightImpact();
                          });
                        },
                        itemCount: initialDoggos.length,
                        controller: _controller,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          //print((_page.value - itemIndex).abs());
                          var scale = (1 -
                              (((_page.value - itemIndex).abs() * 0.1)
                                  .clamp(0.0, 1.0)));
                          //final scale =
                          //    max(SCALE_FRACTION, (FULL_SCALE - (itemIndex - _page).abs()));
                          return DogCardSliver(
                              dog: initialDoggos[itemIndex], scale: scale);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: initialDoggos.length.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                color: Colors.purpleAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Filter",
                          style: fadedListTitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: scrrenWidth,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 0.0),
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: widget.initialDogTypes.length,
                      // A callback that will return a widget.
                      itemBuilder: (context, int index) {
                        return new LetterItem(
                          widget: widget,
                          currentIndex: index,
                          selectedItem: _selectedItem,
                          onTapTap: () {
                            print("onTapTap onTapTap");
                            onTapTap(index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

              //   Stack(
              //     children: <Widget>[
              //       Positioned(
              //         top: 80.0,
              //         left: 20.0,
              //         child: Row(
              //           children: <Widget>[
              //             RichText(
              //               text: TextSpan(
              //                 children: <TextSpan>[
              //                   TextSpan(
              //                     text: "Dog Breeds",
              //                     style: TextStyle(
              //                         fontFamily: 'Roboto',
              //                         fontSize: 35.0,
              //                         color: Colors.white),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding: const EdgeInsets.only(top: 8.0, left: 4.0),
              //               child: RichText(
              //                 text: TextSpan(
              //                   children: <TextSpan>[
              //                     TextSpan(
              //                       text: initialDoggos.length.toString(),
              //                       style: TextStyle(
              //                           fontFamily: 'Roboto',
              //                           fontSize: 20.0,
              //                           color: Colors.purpleAccent),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Positioned(
              //         top: 160.0,
              //         left: 20.0,
              //         child: RichText(
              //           text: TextSpan(
              //             children: <TextSpan>[
              //               TextSpan(
              //                 text: "Filter",
              //                 style: fadedListTitle,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         top: 0.0,
              //         left: 0.0,
              //         width: scrrenWidth,
              //         height: scrrenHeight,
              //         child: Container(
              //           margin: const EdgeInsets.only(left: 0.0),
              //           child: NotificationListener<ScrollNotification>(
              //             onNotification: (ScrollNotification notification) {
              //               if (mounted) {
              //                 setState(() {
              //                   _page.value = _controller.page;
              //                   // print("controller.page = " + _controller.page.toString());
              //                 });
              //               }
              //             },
              //             child: PageView.builder(
              //               onPageChanged: (pos) {
              //                 setState(() {
              //                   _currentPage = pos;
              //                   HapticFeedback.lightImpact();
              //                 });
              //               },
              //               itemCount: initialDoggos.length,
              //               controller: _controller,
              //               itemBuilder: (BuildContext context, int itemIndex) {
              //                 //print((_page.value - itemIndex).abs());
              //                 var scale = (1 -
              //                     (((_page.value - itemIndex).abs() * 0.1)
              //                         .clamp(0.0, 1.0)));
              //                 //final scale =
              //                 //    max(SCALE_FRACTION, (FULL_SCALE - (itemIndex - _page).abs()));
              //                 return DogCardSliver(
              //                     dog: initialDoggos[itemIndex], scale: scale);
              //               },
              //             ),
              //           ),
              //         ),
              //       ),

              //       Positioned(
              //         top: 120.0,
              //         child: Container(
              //           height: 100,
              //           color: Colors.transparent,
              //           padding: const EdgeInsets.only(top: 60.0),
              //           width: scrrenWidth,
              //           child: ListView.builder(
              //             addAutomaticKeepAlives: true,
              //             scrollDirection: Axis.horizontal,
              //             physics: const AlwaysScrollableScrollPhysics(),
              //             itemCount: widget.initialDogTypes.length,
              //             // A callback that will return a widget.
              //             itemBuilder: (context, int index) {
              //               return new LetterItem(
              //                 widget: widget,
              //                 currentIndex: index,
              //                 selectedItem: _selectedItem,
              //                 onTapTap: () {
              //                   print("onTapTap onTapTap");
              //                   onTapTap(index);
              //                 },
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  onTapTap(int index) {
    print("calling setState");
    setState(() {
      _selectedItem = index;
      print("_selectedItem = " + _selectedItem.toString());
    });
  }

  void filterSearchResults(String query) {

    if(query.isNotEmpty) {
      List<Dog> dummyDoggos = List<Dog>();
      duplicateDoggos.forEach((item) {
        if(initialDoggos.contains(query)) {
          dummyDoggos.add(item);
        }
      });
      setState(() {
        initialDoggos.clear();
        initialDoggos.addAll(dummyDoggos);
      });
      return;
    } else {
      setState(() {
        initialDoggos.clear();
        initialDoggos.addAll(duplicateDoggos);
      });
    }
  }
}

class LetterItem extends StatelessWidget {
  const LetterItem({
    Key key,
    @required this.widget,
    @required this.currentIndex,
    @required this.selectedItem,
    @required this.onTapTap,
  }) : super(key: key);

  final FifthRoute widget;
  final int currentIndex;
  final int selectedItem;
  final Function onTapTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("GestureDetector onTap");
        onTapTap();
      },
      child: Container(
        color: Colors.transparent,
        height: 80,
        width: 45,
        margin: EdgeInsets.only(left: 20.0, right: 0.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: RichText(
              text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: widget.initialDogTypes[currentIndex],
                style: currentIndex == selectedItem
                    ? selectedListItemStyle
                    : unselectedListItemStyle,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
