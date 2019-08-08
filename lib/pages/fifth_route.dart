import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/common/dog_card_sliver.dart';
import 'package:my_app/styles/colors.dart';
import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: duplicateDoggos.length.toString() +
                                " / " +
                                initialDoggos.length.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0,
                                color: Colors.purpleAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 10.0, top: 8.0, bottom: 0.0),
                    child: Icon(
                      Icons.view_week,
                      color: unselectedIconColor,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: .0, right: 20.0, top: 8.0, bottom: 0.0),
                    child: Icon(
                      FontAwesomeIcons.filter,
                      color: unselectedIconColor,
                      size: 20.0,
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
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Filter",
                            style: unselectedListItemStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 8.0, bottom: 8.0),
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
              Row(
                children: <Widget>[
                  Container(
                    height: scrrenWidth + scrrenWidth / 10,
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
    setState(() {
      _selectedItem = index;
      print("_selectedItem = " + _selectedItem.toString());
    });
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
