import 'package:flutter/material.dart';

import 'core/helper_functions/app_routes.dart';
import 'features/home/presentation/views/home_view.dart';

void main() {
  runApp(const MyBook());
}

class MyBook extends StatelessWidget {
  const MyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'InriaSans',
      ),
      onGenerateRoute: generateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}
