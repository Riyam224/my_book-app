import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_book/features/home/presentation/views/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
