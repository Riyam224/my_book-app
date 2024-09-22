import 'package:flutter/material.dart';
import 'package:my_book/features/home/data/repos/api_service.dart';
import 'package:my_book/features/home/data/repos/home_repo_impl.dart';

import 'core/helper_functions/app_routes.dart';
import 'features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyBook());
}

class MyBook extends StatelessWidget {
  const MyBook({super.key});

  @override
  Widget build(BuildContext context) {
    // todo
    return BlocProvider(
      create: (context) =>
          NewestBooksCubit(HomeRepoImpl(ApiService(Dio())))..fetchNewestBooks(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'InriaSans',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        initialRoute: HomeView.routeName,
      ),
    );
  }
}
