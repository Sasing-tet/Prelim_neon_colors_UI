// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:sasing_prelims/constants.dart';
import 'package:sasing_prelims/screens/components/movie_posters.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              bgColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.68,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/Movie-image.png",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: screenHeight * 0.6,
                width: screenWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.01,
                      0.2,
                      0.3,
                    ],
                    colors: [
                      Color.fromARGB(33, 31, 30, 30),
                      Color.fromARGB(195, 22, 21, 21),
                      bgColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 21,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                        }),
                        child: Container(
                          height: 44,
                          width: 44,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: iconColor,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset("assets/back-icon.png"),
                        ),
                      ),
                      Container(
                        height: 44,
                        width: 44,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: iconColor,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset("assets/hamburger-icon.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.32,
              right: 10,
              child: FloatingPlayButton(),
            ),
            Positioned(
              top: screenHeight * 0.45,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Eternals",
                      style: TextStyle(
                        color: textColor,
                        fontSize: titleMediumText,
                        fontWeight: textWeightBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "2021•Action·Adventure·Fantasy•2h36m",
                      style: TextStyle(
                        color: textColor.withOpacity(0.75),
                        fontSize: movieInfoText,
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    itemSize: movieSubtitleText,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: ratingStarColor,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                    unratedColor: iconColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Text(
                      "The saga of the Eternals, a race of\n immortal beings who lived on Earth\n and shaped its history and\n civilizations.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor.withOpacity(0.75),
                        fontSize: movieSubtitleText,
                      ),
                    ),
                  ),
                  Container(
                    height: 1.5,
                    width: screenWidth * 0.7,
                    color: iconColor.withOpacity(0.1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cast",
                        style: TextStyle(
                          color: textColor,
                          fontSize: castText,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: iconColor,
                          minRadius: 16,
                          maxRadius: screenWidth <= 375 ? 24 : 30,
                          backgroundImage: AssetImage("assets/cast-1.png"),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 70,
                            ),
                            transform: Matrix4.translationValues(-6, 0, 0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                MoviePosters(
                                  asset: castMask,
                                  mask: castMask,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: defaultPadding),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Angelina\nJolie",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: movieInfoText),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: iconColor,
                          minRadius: 16,
                          maxRadius: screenWidth <= 375 ? 24 : 30,
                          backgroundImage: AssetImage("assets/cast-2.png"),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 112,
                            ),
                            transform: Matrix4.translationValues(-6, 0, 0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                MoviePosters(
                                  asset: castMask,
                                  mask: castMask,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: defaultPadding),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Gemma\nChan",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: movieInfoText),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: iconColor,
                          minRadius: 16,
                          maxRadius: screenWidth <= 375 ? 24 : 30,
                          backgroundImage: AssetImage("assets/cast-3.png"),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 70,
                            ),
                            transform: Matrix4.translationValues(-6, 0, 0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                MoviePosters(
                                  asset: castMask,
                                  mask: castMask,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: defaultPadding),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Salma\nHayek",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: movieInfoText),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: iconColor,
                          minRadius: 16,
                          maxRadius: screenWidth <= 375 ? 24 : 30,
                          backgroundImage: AssetImage("assets/cast-4.png"),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 112,
                            ),
                            transform: Matrix4.translationValues(-6, 0, 0),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                MoviePosters(
                                  asset: castMask,
                                  mask: castMask,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: defaultPadding),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Richard\nMadden",
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: movieInfoText),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingPlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(40 / 360),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: neonBlue.withOpacity(0.20),
                blurRadius: 4,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: neonBlue.withOpacity(0.20),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
                neonPink,
                neonBlue,
              ]),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(300),
          ),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(321 / 360),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () {},
              child: Image(
                image: AssetImage("assets/play-icon.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
