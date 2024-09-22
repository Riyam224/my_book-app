// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_book/core/utils/assets.dart';
import 'package:my_book/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:my_book/features/home/presentation/views/widgets/custom_loading_indicator.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 30),
        child: Column(
          children: [
            WelcomePart(),
            SizedBox(
              height: 27,
            ),
            BooksGridView(),
            SizedBox(
              height: 48,
            ),
            PremiumFree(),
            SizedBox(
              height: 10,
            ),
            DividerFree(),
            SizedBox(
              height: 40,
            ),
            PopularAuthonBar(),
            SizedBox(
              height: 25,
            ),
            AuthorImageListView(),
          ],
        ),
      ),
    );
  }
}

// todo
class WelcomePart extends StatelessWidget {
  const WelcomePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 61,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 59,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hi Fela',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 0,
                        // letterSpacing: -0.28,
                      ),
                    ),
                  ),
                  Text(
                    'What are you reading today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                      // letterSpacing: -0.28,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(Assets.imagesUser),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            )
          ],
        ));
  }
}

// todo

class BooksItem extends StatelessWidget {
  const BooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 154,
      child: Stack(
        children: [
          Positioned(
            left: 2.97,
            top: 1.41,
            child: Container(
              width: 113.03,
              height: 152.59,
              decoration: ShapeDecoration(
                color: const Color(0xFF333333),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.44),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 111.54,
              height: 151.19,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  image: NetworkImage(Assets.imagesOne),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.44),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2.97,
            top: 160,
            child: Container(
              width: 116,
              child: const Text(
                'Little Blue Trucks Halloween',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontFamily: 'Abel',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 0,
            top: 200,
            child: SizedBox(
              width: 110,
              child: Text(
                'Alice Schertle, Jill McElmurry',
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 12,
                  fontFamily: 'Abel',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          const Positioned(
              left: 0,
              top: 230,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '\$200',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 14,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '00',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 10,
                        fontFamily: 'Abel',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
// todo book grid view and cubit

class BooksGridView extends StatelessWidget {
  const BooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SizedBox(
            height: 252,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: BooksItem(),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}

// todo premium free

class PremiumFree extends StatelessWidget {
  const PremiumFree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 157,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF1C6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 24,
            top: 36,
            child: SizedBox(
              width: 160,
              child: Text(
                'Premium free for the next 3 Months',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Abel',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 231,
            top: 46,
            child: Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(Assets.imagesPremium1),
                fit: BoxFit.fill,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

// todo divider line under premium free

class DividerFree extends StatelessWidget {
  const DividerFree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 2,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 16,
              height: 2,
              decoration: ShapeDecoration(
                color: const Color(0xFFE0E0E0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 0,
            child: Container(
              width: 16,
              height: 2,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 0,
            child: Container(
              width: 16,
              height: 2,
              decoration: ShapeDecoration(
                color: const Color(0xFFE0E0E0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
          Positioned(
            left: 60,
            top: 0,
            child: Container(
              width: 16,
              height: 2,
              decoration: ShapeDecoration(
                color: Color(0xFFE0E0E0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// todo popular author bar
class PopularAuthonBar extends StatelessWidget {
  const PopularAuthonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Popular Authors',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Abel',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          Row(
            children: [
              Text(
                'See more',
                style: TextStyle(
                  color: Color(0xFF9797AA),
                  fontSize: 14,
                  fontFamily: 'Abel',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 214, 214, 228),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// todo popular auther image list view and image item

class AuthorImageListView extends StatelessWidget {
  const AuthorImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PopularAuthorItem(),
          );
        },
      ),
    );
  }
}

// todo popular author item

class PopularAuthorItem extends StatelessWidget {
  const PopularAuthorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(Assets.imagesUder2),
          fit: BoxFit.fill,
        ),
        shape: OvalBorder(),
      ),
    );
  }
}
