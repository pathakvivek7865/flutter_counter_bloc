import 'package:flutter/material.dart';

import './counter_bloc.dart';

class Provider extends InheritedWidget {
  final counterbloc = CounterBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CounterBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).counterbloc;
  }
}