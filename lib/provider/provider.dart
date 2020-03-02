import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/manager/breed_manager.dart';

class Provider extends InheritedWidget{
  final BreedManager data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static BreedManager of (BuildContext context){
    return (context.getElementForInheritedWidgetOfExactType<Provider>().widget as Provider).data;
  }  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return null;
  }}