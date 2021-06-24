import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService navigationService = NavigationService();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  navigatorTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  navigatorReplacemnt(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }
}
