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
      // theme: ThemeData(
      //   brightness: Brightness.light, // Set the brightness to dark
      //   fontFamily: 'InriaSans', // Set your custom font here
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: Colors.black, // Background color for scaffold
      //   appBarTheme: AppBarTheme(
      //     color: Colors.blueGrey[900], // AppBar color
      //   ),
      // ),
      theme: ThemeData(
        fontFamily: 'InriaSans',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}
