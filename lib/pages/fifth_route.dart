import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Model/data.dart' as prefix1;
import 'package:my_app/styles/colors.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/styles/colors.dart' as prefix0;

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

  TextEditingController _editingController;
  PageController _controller;

  @override
  void initState() {
    duplicateDoggos.clear();
    duplicateDoggos.addAll(initialDoggos);
    //print("-- _FifthRouteState initState --");
    _editingController = TextEditingController();
    _controller = PageController(
        initialPage: _currentPage,
        viewportFraction: _viewportScale,
        keepPage: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double scrrenWidth = MediaQuery.of(context).size.width;
    final double scrrenHeight = MediaQuery.of(context).size.height;
    super.build(context);
    //print("-- Widget build --");
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
                        color: foregroungColor45,
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
                        _isLetterIndexVisible = !_isLetterIndexVisible;
                      });
                      print("Icons.view_week GestureDetector onTap");
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 8.0, top: 8.0, bottom: 0.0),
                        child: Icon(
                          Icons.view_week,
                          color: _isLetterIndexVisible
                              ? Colors.white
                              : Colors.white24,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFilterVisible = !_isFilterVisible;
                      });
                      print("FontAwesomeIcons.filter GestureDetector onTap");
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 25.0, top: 8.0, bottom: 0.0),
                        child: Icon(
                          _isFilterVisible ? Icons.close : Icons.add,
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
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Showing ",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                                color: Colors.white70),
                          ),
                          TextSpan(
                            text: duplicateDoggos.length.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                                color: Colors.purpleAccent),
                          ),
                          TextSpan(
                            text: " of ",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
                                color: Colors.white70),
                          ),
                          TextSpan(
                            text: initialDoggos.length.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16.0,
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
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 30.0, bottom: 8.0),
                        child: TextField(
                          onChanged: (value) {
                            print("Searching for = " + value);
                            filterSearchResults(value);
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
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
              //   child: Row(
              //     children: <Widget>[
              //       RichText(
              //         text: TextSpan(
              //           children: <TextSpan>[
              //             TextSpan(
              //               text: "Filter",
              //               style: unselectedListItemStyle,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              AnimatedOpacity(
                curve: Curves.fastOutSlowIn,
                opacity: _isLetterIndexVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 4.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: scrrenWidth,
                        color: Colors.transparent,
                        child: ListView.builder(
                          addAutomaticKeepAlives: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: dogIndex.length,
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
                              // print("controller.page = " + _controller.page.toString());
                            });
                          }
                        });
                      },
                      child: PageView.builder(
                        onPageChanged: (pos) {
                          setState(() {
                            _currentPage = pos;
                            HapticFeedback.lightImpact();
                          });
                        },
                        itemCount: duplicateDoggos.length,
                        controller: _controller,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          //print((_page.value - itemIndex).abs());
                          var scale = (1 -
                              (((_page.value - itemIndex).abs() * 0.1)
                                  .clamp(0.0, 1.0)));
                          return DogCardSliver(
                              dog: duplicateDoggos[itemIndex], scale: scale);
                        },
                      ),
                    ),
                  ),
                ],
              ),
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
    int currentPage = _controller.page.round();
    int totalLength = prefix1.initialDoggos.length - 1;
    int goToPage = 0;

    _selectedItem = index;
    if (index > totalLength)
      goToPage = totalLength;
    else
      goToPage = index;
    int delta = (currentPage - goToPage).abs();
    double durationRatio = (delta / totalLength);
    double duration = 5000 * durationRatio;
    //print("delta value = " + delta.toString());
    //print("durationRatio value = " + durationRatio.toString());
    //print("duration value = " + duration.toString());
    _controller.animateToPage(goToPage,
        duration: Duration(milliseconds: duration.round()),
        curve: Curves.fastOutSlowIn);
    setState(() {});
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      duplicateDoggos.clear();
      List<Dog> dummyDoggos = List<Dog>();
      initialDoggos.forEach((item) {
        if (item.contains(query)) {
          print(item.name);
          dummyDoggos.add(item);
        }
      });
      setState(() {
        duplicateDoggos.addAll(dummyDoggos);
      });
      return;
    } else {
      setState(() {
        duplicateDoggos.clear();
        duplicateDoggos.addAll(initialDoggos);
      });
    }
  }

  @override
  void dispose() {
    _editingController.dispose();
    _controller.dispose();
    super.dispose();
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
    double leftMargin = 0;
    double rightMargin = 0;

    leftMargin = currentIndex == 0 ? 20.0 : 2.0;
    rightMargin = currentIndex == dogIndex.length - 1 ? 20.0 : 2.0;
    return GestureDetector(
      onTap: () {
        print("GestureDetector onTap");
        onTapTap();
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
            color: currentIndex == selectedItem
                ? darkerPurpleColor
                : foregroungColor45,
            width: 60,
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: dogIndex[currentIndex],
                    style: currentIndex == selectedItem
                        ? selectedListItemStyle
                        : unselectedListItemStyle,
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
