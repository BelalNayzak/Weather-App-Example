import 'package:flutter/material.dart';

class NavigationServices {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static get context => _navigatorKey.currentContext!;
  static get navKey => _navigatorKey;

  static const String homeRoute = '/';
  // ...

}

// ...